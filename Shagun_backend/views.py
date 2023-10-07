import csv
import json
import os
import time
from datetime import datetime, timedelta

import jwt
from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.core.files.storage import default_storage
from django.http import JsonResponse
from django.shortcuts import redirect, render
from rest_framework.decorators import api_view
from rest_framework.response import Response

from Shagun_backend import settings
from Shagun_backend.controllers import user_controller, event_controller, app_data_controller, store_controller, \
    transactions_controller, user_home_page_controller, greeting_cards_controller, admin_controller, \
    request_controller, bank_controller, test_controller, delivery_vendor_controller, reset_password_controller
from Shagun_backend.models import user_kyc_model, bank_details_model, create_event_model, \
    app_data_model, add_printer_model, transactions_history_model, employee_model, \
    gifts_transaction_model, request_callback_model, greeting_cards_model, add_vendor_model
from Shagun_backend.models.create_event_model1 import transform_data_to_json


def sign_up(request):
    if request.method == 'POST':
        data = request.POST
        response = user_controller.employee_login(data['username'], data['password'])
        if response['msg'] == 'Success':
            request.session['is_logged_in'] = True
            request.session['uid'] = data['username']
            request.session['name'] = response['name']
            request.session['role'] = response['role']
            request.session['profile_pic'] = response['profile_pic']
            return redirect('admin_dashboard')
        else:
            messages.error(request, response['msg'])
            return render(request, 'pages/admin_employee/login_signup/login.html')
    return render(request, 'pages/admin_employee/login_signup/login.html')


def logout(request):
    request.session.clear()
    return redirect('sign_up')


def previewPrint(request):
    print(request.GET['imageUrl'])
    return render(request, 'pages/printer/print_job/print_card.html')


def printerLogout(request):
    request.session.clear()
    return redirect('printer_login')


def custom_404(request, slug=None):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        return render(request, 'pages/admin_employee/error_page/error-404.html')
    else:
        return redirect('sign_up')


def admin_dashboard(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = admin_controller.admin_dashboard(request.session.get('uid'))
        return render(request, 'index.html', response)
    else:
        return redirect('sign_up')


def app_settings(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        print(request.POST)

        if request.method == 'POST':
            data = request.POST
            credentials = {
                "map_api_key": data.get("map_api_key"),
                "emailjs_service_id": data.get("emailjs_service_id"),
                "emailjs_template_id": data.get("emailjs_template_id"),
                "emailjs_user_id": data.get("emailjs_user_id"),
                "emailjs_grecaptcha_response": data.get("emailjs_grecaptcha_response"),
                "android_app_package_name": data.get("android_app_package_name"),
                "android_app_name": data.get("android_app_name"),
                "android_min_version": data.get("android_min_version"),
                "android_max_version": data.get("android_max_version"),
                "ios_app_package_name": data.get("ios_app_package_name"),
                "ios_app_name": data.get("ios_app_name"),
                "ios_min_version": data.get("ios_min_version"),
                "ios_max_version": data.get("ios_max_version"),
                "cashfree_api_url": data.get("cashfree_api_url"),
                "cashfree_secret_key": data.get("cashfree_secret_key"),
                "cashfree_client_key": data.get("cashfree_client_key"),
                "firebase_cred": data.get("firebase_cred"),
                "deep_link": data.get("deep_link"),
            }

            # Save the credentials dictionary to a JSON file
            json_file_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'util/credentials.json')
            with open(json_file_path, 'w') as file:
                json.dump(credentials, file)
            print("Credentials saved successfully")

            return redirect('app_settings')
        else:
            json_file_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'util/credentials.json')
            try:
                with open(json_file_path, 'r') as file:
                    credentials = json.load(file)
                print(credentials)
                return render(request, 'pages/admin_employee/app_settings/app_settings.html',
                              {"credentials": credentials})
            except FileNotFoundError:
                return redirect('app_settings')

    else:
        return redirect('sign_up')


def reset_password(request, email, action_page):
    resp, status_code = reset_password_controller.reset_password(email, action_page)
    return redirect(action_page)

def reset_my_password(request, email, action_page):
    resp, status_code = reset_password_controller.reset_password(email, action_page)
    return JsonResponse(resp)


def forgot_password(request, action_page):
    if request.method == 'POST':
        return redirect(action_page)
    else:
        return render(request, 'pages/admin_employee/login_signup/forget_password.html', {"action_page": action_page})


def update_password(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            response = user_controller.update_password(request.POST)
            if not response['status']:
                messages.error(request, response['message'])
                return render(request, 'pages/admin_employee/login_signup/change_password.html',
                              {"msg": response['message']})
            else:
                messages.success(request, response['message'])
                return render(request, 'pages/admin_employee/login_signup/change_password.html')
        else:
            return render(request, 'pages/admin_employee/login_signup/change_password.html')
    else:
        return redirect('sign_up')


def update_printer_password(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        if request.method == 'POST':
            response = store_controller.update_printer_password(request.POST)
            print(response)
            if not response['status']:
                messages.error(request, response['message'])
                return render(request, 'pages/printer/printer_auth/change_password.html',
                              {"msg": response['message']})
            else:
                messages.success(request, response['message'])
                return render(request, 'pages/printer/printer_auth/change_password.html')
        else:
            return render(request, 'pages/printer/printer_auth/change_password.html')
    else:
        return redirect('printer_login')


def manage_event(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_all_event_list()

        return render(request, 'pages/admin_employee/event_management/event/events.html',
                      {'response': response['event_list']})
    else:
        return redirect('sign_up')


@api_view(['POST'])
def manage_settlement(request):
    response = event_controller.get_all_active_events()
    return JsonResponse(response, safe=False)


def manage_event_types(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_event_type_list_for_admin()

        return render(request, 'pages/admin_employee/event_management/event_type/event_type.html',
                      {"response": response['events_type']})
    else:
        return redirect('sign_up')


def manage_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_locations_list()
        return render(request, 'pages/admin_employee/event_management/location/location.html', response)
    else:
        return redirect('sign_up')


def manage_bank_list(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = bank_controller.get_all_banks_list()
        return render(request, 'pages/admin_employee/users_management/banks/bank_lists.html',
                      {"bank_list": response['bank_list']})
    else:
        return redirect('sign_up')


def add_bank_list(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
            resp = bank_controller.add_bank_list(request.POST['bank_name'], request.POST['created_by_uid'])
            print(resp)
            return redirect('manage_bank_list')
    else:
        return redirect('sign_up')


def edit_bank_list(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            bank_controller.edit_bank_list(request.POST['id'], request.POST['name'])
            return redirect('manage_bank_list')
    else:
        return redirect('sign_up')


def activate_deactivate_bank_list(request, bank_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        bank_controller.activate_deactivate_bank_list(bank_id, status)
        return redirect('manage_bank_list')
    else:
        return redirect('sign_up')


def manage_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            response, status_code = user_controller.get_kyc_data('%')
            return render(request, 'pages/admin_employee/users_management/kyc/kyc.html',
                          {"response": response['kyc_data']})
        else:
            response, status_code = user_controller.get_kyc_data('%')
            return render(request, 'pages/admin_employee/users_management/kyc/kyc.html',
                          {"response": response['kyc_data']})

    else:
        return redirect('sign_up')


def filter_kyc(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_kyc_data(status)
        return render(request, 'pages/admin_employee/users_management/kyc/kyc.html',
                      {"response": response['kyc_data'], "status": status})

    else:
        return redirect('sign_up')


def filter_bank(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:

        response, status_code = user_controller.get_all_bank_data(status)

        return render(request, 'pages/admin_employee/users_management/banks/bank_details.html',
                      {"response": response['bank_data'], "status": status})

    else:
        return redirect('sign_up')


def filter_user(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:

        response, status_code = user_controller.filter_users(status)

        return render(request, 'pages/admin_employee/users_management/users/users.html',
                      {"response": response['user_data'], "status": status})

    else:
        return redirect('sign_up')


def manage_bank_details(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_bank_data('%')

        return render(request, 'pages/admin_employee/users_management/banks/bank_details.html',
                      {"response": response['bank_data']})
    else:
        return redirect('sign_up')


def manage_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.get_all_greeting_cards()

        return render(request, 'pages/admin_employee/event_management/greeting_card/greeting_cards.html',
                      {"response": response['all_greeting_cards']})
    else:
        return redirect('sign_up')


def manage_users(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_users('%')

        return render(request, 'pages/admin_employee/users_management/users/users.html',
                      {"response": response['user_data']})
    else:
        return redirect('sign_up')


def manage_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_employees()

        return render(request, 'pages/admin_employee/employee_management/employee/employees.html',
                      {"response": response['user_data'], "role": 2})
    else:
        return redirect('sign_up')


def manage_admin(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_admins()

        return render(request, 'pages/admin_employee/employee_management/admin/admins.html',
                      {"response": response['user_data'], "role": 1})
    else:
        return redirect('sign_up')


def manage_printers(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.get_printers_by_status('%')

        return render(request, 'pages/admin_employee/vendors_management/printing_vendor/printing_vendor.html',
                      {"response": response['printer_data']})
    else:
        return redirect('sign_up')


def manage_delivery_vendors(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = delivery_vendor_controller.get_delivery_vendor()
        print(response)

        return render(request, 'pages/admin_employee/vendors_management/delivery_vendor/delivery_vendor.html',
                      {"response": response['delivery_vendor_data']})
    else:
        return redirect('sign_up')


def edit_delivery_vendors(request, vid):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            vendor_obj = add_vendor_model.add_vendor_model_from_dict(request.POST)
            delivery_vendor_controller.update_vendor(vendor_obj)
            return redirect('manage_delivery_vendors')
        else:
            response, status_code = delivery_vendor_controller.edit_delivery_vendor(vid)
            location, status_code = event_controller.get_city_list_for_user()

            return render(request,
                          'pages/admin_employee/vendors_management/delivery_vendor/edit_delivery_vendor.html',
                          {"response": response['delivery_vendor_data'], "location": location['city_list']})

    else:
        return redirect('sign_up')


def printer_login(request):
    if request.method == 'POST':
        response = store_controller.printer_login(request.POST['printer_user_name'], request.POST['printer_password'])
        if response['msg'] == 'Success':
            request.session['is_printer_logged_in'] = True
            request.session['id'] = response['id']
            request.session['printer_user_name'] = response['username']
            request.session['store_name'] = response['store_name']
            return redirect('printer_home_page')
        else:
            messages.error(request, response['msg'])
            return render(request, 'pages/printer/printer_auth/printer_login.html')
    else:
        return render(request, 'pages/printer/printer_auth/printer_login.html')


def kyc_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_user_requests('KYC')

        return render(request, 'pages/admin_employee/user_requests/kyc_request/manage_kyc_request.html',
                      {"response": response['req_list']})
    else:
        return redirect('sign_up')


def search_kyc_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.search_user_requests('KYC', request.POST['search'])

        return render(request, 'pages/admin_employee/user_requests/kyc_request/manage_kyc_request.html',
                      {"response": response['req_list'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def filter_kyc_request(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.filter_user_requests('KYC', status)

        return render(request, 'pages/admin_employee/user_requests/kyc_request/manage_kyc_request.html',
                      {"response": response['req_list'], "status": status})
    else:
        return redirect('sign_up')


def event_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_user_requests('event')

        return render(request, 'pages/admin_employee/user_requests/event_request/manage_event_request.html',
                      {"response": response['req_list']})
    else:
        return redirect('sign_up')


def search_event_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.search_user_requests('event', request.POST['search'])

        return render(request, 'pages/admin_employee/user_requests/event_request/manage_event_request.html',
                      {"response": response['req_list'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def filter_event_request(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.filter_user_requests('event', status)

        return render(request, 'pages/admin_employee/user_requests/event_request/manage_event_request.html',
                      {"response": response['req_list'], "status": status})
    else:
        return redirect('sign_up')


def get_settlement_for_event(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.event_settlement(status)

        return render(request, 'pages/admin_employee/event_management/settlement/settlements.html',
                      {"response": response['event_settlement'], "status": status})
    else:
        return redirect('sign_up')


def dashboard_search_event_settlement(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.search_event_settlement(request.POST['search'])

        return render(request, 'pages/admin_employee/event_management/settlement/settlements.html',
                      {"response": response['event_settlement'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def all_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.get_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/all_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('sign_up')


def new_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1]
        response, status_code = store_controller.get_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/new_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('sign_up')


def search_all_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.search_all_jobs(status, request.POST['search'])

        return render(request, 'pages/admin_employee/printer_jobs/all_jobs.html',
                      {"response": response['jobs'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def search_new_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1]
        response, status_code = store_controller.search_all_jobs(status, request.POST['search'])

        return render(request, 'pages/admin_employee/printer_jobs/new_jobs.html',
                      {"response": response['jobs'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def Open_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [2, 3, 4]
        response, status_code = store_controller.get_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/open_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('sign_up')


def search_open_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4]
        response, status_code = store_controller.search_all_jobs(status, request.POST['search'])

        return render(request, 'pages/admin_employee/printer_jobs/all_jobs.html',
                      {"response": response['jobs'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def filter_all_printer_jobs(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.filter_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/all_jobs.html',
                      {"response": response['jobs'], "status": status})
    else:
        return redirect('sign_up')


def filter_open_printer_jobs(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.filter_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/open_jobs.html',
                      {"response": response['jobs'], "status": status})
    else:
        return redirect('sign_up')


def closed_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [5]
        response, status_code = store_controller.get_all_jobs(status)

        return render(request, 'pages/admin_employee/printer_jobs/closed_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('sign_up')


def search_closed_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [5]
        response, status_code = store_controller.search_all_jobs(status, request.POST['search'])

        return render(request, 'pages/admin_employee/printer_jobs/closed_jobs.html',
                      {"response": response['jobs'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def transactions_settlement(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            transaction_id = request.POST.getlist('selected_ids')
            settlement, status_code = transactions_controller.settle_payment(transaction_id)
            if status_code == 200:
                response, status_code = transactions_controller.update_transactions(transaction_id)
                return JsonResponse(response)
            else:
                return JsonResponse(settlement)
        else:
            response, status_code = transactions_controller.get_transaction_list(event_id, '%')

            return render(request,
                          'pages/admin_employee/event_management/settlement/transactions_settlement.html',
                          {"response": response['transactions'], "event_id": event_id})
    else:
        return redirect('sign_up')


def search_transactions_settlement(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = transactions_controller.search_transaction_list(event_id, request.POST['search'])

        return render(request, 'pages/admin_employee/event_management/settlement/transactions_settlement.html',
                      {"response": response['transactions'], "event_id": event_id, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def add_events(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
            json_data = transform_data_to_json(request.POST)
            print(json_data)
            event_obj = create_event_model.create_event_model_from_dict(json_data)
            event_controller.create_event(event_obj)
            return redirect('manage_event')
        else:
            event_types, status_code = event_controller.get_event_type_list_for_user()
            location, status_code = event_controller.get_city_list_for_user()
            users_list, status_code = user_controller.get_all_users(1)
            printers_list, status_code = store_controller.get_printers_by_status(1)
            context = {
                "event_types": event_types,
                "location": location,
                "users": users_list,
                "printers": printers_list
            }
            return render(request, 'pages/admin_employee/event_management/event/add_events.html', context)

    else:
        return redirect('sign_up')


def add_events_type(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.create_events_type(request.POST['event_type_name'], request.POST['created_by_uid'])
            return redirect('manage_event_types')
        else:
            return render(request, 'event_management/event_management/add_events_type.html')

    else:
        return redirect('sign_up')


def add_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""images/documents/{request.POST['identification_number1'] if file_key == "document1"
                else request.POST['identification_number2']}_{int(time.time())}_{str(file_obj)}"""
                identification_doc_key = 'identification_doc1' if file_key == 'document1' else 'identification_doc2'
                form_data = form_data.copy()
                form_data[identification_doc_key] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)

            kyc_obj = user_kyc_model.user_kyc_model_from_dict(form_data)
            user_controller.add_user_kyc(kyc_obj)
            return redirect('manage_kyc')
        else:
            response, status_code = user_controller.get_users_for_kyc('%')
            return render(request, 'pages/admin_employee/users_management/kyc/add_kyc.html', response)
    else:
        return redirect('sign_up')


def add_bank(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            bank_obj = bank_details_model.bank_details_model_from_dict(request.POST)
            user_controller.add_bank_details(bank_obj)
            return redirect('manage_bank_details')
        else:
            user, status_code = user_controller.get_all_users('%')
            print(user)
            bank, status_code = bank_controller.get_active_banks_list()
            context = {
                "user": user['user_data'],
                "banks": bank
            }
            return render(request, 'pages/admin_employee/users_management/banks/add_bank.html', context)
    else:
        return redirect('sign_up')


def add_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get(
            'is_logged_in') is True and request.session.get('role'):
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.add_employee(emp_obj)
            return redirect('manage_employee')
        else:
            return render(request, 'pages/admin_employee/employee_management/employee/add_employee.html')
    else:
        return redirect('sign_up')


def add_admin(request):
    if request.session.get('is_logged_in') is not None and request.session.get(
            'is_logged_in') is True and request.session.get('role') == 1:
        if request.method == 'POST':
            admin_obj = employee_model.add_employee_model_from_dict(request.POST)
            print(admin_obj)
            response = user_controller.add_admin(admin_obj)
            print(response)
            return redirect('manage_admin')
        else:
            return render(request, 'pages/admin_employee/employee_management/admin/add_admin.html')
    else:
        return redirect('sign_up')


def add_printer(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            store_obj = add_printer_model.add_printer_model_from_dict(request.POST)
            store_controller.add_printer(store_obj)
            return redirect('manage_printers')
        else:
            location, status_code = event_controller.get_city_list_for_user()
            return render(request, 'pages/admin_employee/vendors_management/printing_vendor/add_printer.html',
                          location)
    else:
        return redirect('sign_up')


def add_delivery_vendor(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            vendor_obj = add_vendor_model.add_vendor_model_from_dict(request.POST)
            response = delivery_vendor_controller.add_vendor(vendor_obj)
            return redirect('manage_delivery_vendors')
        else:
            location, status_code = event_controller.get_city_list_for_user()
            return render(request,
                          'pages/admin_employee/vendors_management/delivery_vendor/add_delivery_vendor.html',
                          location)
    else:
        return redirect('sign_up')


def add_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""images/greeting_card/{int(time.time())}_{str(file_obj)}"""
                form_data = form_data.copy()
                form_data['card_image_url'] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)
            grt_obj = greeting_cards_model.greeting_cards_model_from_dict(form_data)
            greeting_cards_controller.add_greeting_card(grt_obj)
            return redirect('manage_greeting_cards')
        else:
            printers_list, status_code = store_controller.get_printers_by_status(1)
            return render(request,
                          'pages/admin_employee/event_management/greeting_card/add_greeting_cards.html',
                          printers_list)

    else:
        return redirect('sign_up')


def add_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.add_location(request.POST['city_name'], request.POST['created_by_uid'])
            return redirect('manage_location')
    else:
        return redirect('sign_up')


def activate_deactivate_location(request, location_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_controller.disable_location(location_id, status)
        return redirect('manage_location')
    else:
        return redirect('sign_up')


def activate_deactivate_bank(request, bank_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        user_controller.disable_bank(bank_id, status)
        return redirect('manage_bank_details')
    else:
        return redirect('sign_up')


def activate_deactivate_users(request, user_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        user_controller.enable_disable_employee(user_id, status)
        return redirect('manage_users')
    else:
        return redirect('sign_up')


def activate_deactivate_employee(request, user_id, status, role):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        user_controller.enable_disable_employee(user_id, status)
        if role == 2:
            return redirect('manage_employee')
        else:
            return redirect('manage_admin')
    else:
        return redirect('sign_up')


def activate_deactivate_printers(request, printer_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        store_controller.disable_printer(printer_id, status)
        return redirect('manage_printers')
    else:
        return redirect('sign_up')


def change_print_jobs_status(request, pid, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.change_print_jobs_status(pid, status)
        return redirect('Open_printer_jobs')
    else:
        return redirect('sign_up')


def activate_deactivate_delivery_vendors(request, printer_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        delivery_vendor_controller.enable_disable_delivery_vendor(printer_id, status)
        return redirect('manage_delivery_vendors')
    else:
        return redirect('sign_up')


def activate_deactivate_event_type(request, event_type_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_controller.disable_events_type(event_type_id, status)
        return redirect('manage_event_types')
    else:
        return redirect('sign_up')


def activate_deactivate_event(request, event_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_controller.enable_disable_event(event_id, status)
        return redirect('manage_event')
    else:
        return redirect('sign_up')


def edit_kyc(request, kyc_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""images/documents/{request.POST['identification_number1'] if file_key == "document1"
                else request.POST['identification_number2']}_{int(time.time())}_{str(file_obj)}"""
                identification_doc_key = 'identification_doc1' if file_key == 'document1' else 'identification_doc2'
                form_data = form_data.copy()
                form_data[identification_doc_key] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)

            kyc_obj = user_kyc_model.user_kyc_model_from_dict(form_data)
            user_controller.edit_user_kyc(kyc_obj)
            return redirect('manage_kyc')
        else:
            kyc_data, status_code = user_controller.get_kyc_by_id(kyc_id)
            users_list, status_code = user_controller.get_all_users(1)
            context = {
                "kyc_data": kyc_data,
                "user_list": users_list
            }
            return render(request, 'pages/admin_employee/users_management/kyc/edit_kyc.html', context)
    else:
        return redirect('sign_up')


def set_event_status(request, event_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_controller.set_event_status(event_id, status)
        return redirect('manage_event')
    else:
        return redirect('sign_up')


def set_KYC_request_status(request, req_id, cmpltd_by, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        request_controller.update_callback_request(req_id, cmpltd_by, status)
        return redirect('kyc_request')
    else:
        return redirect('sign_up')


def set_event_request_status(request, req_id, cmpltd_by, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        request_controller.update_callback_request(req_id, cmpltd_by, status)
        return redirect('event_request')
    else:
        return redirect('sign_up')


def activate_deactivate_greeting_cards(request, card_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        greeting_cards_controller.disable_greeting_cards(card_id, status)
        return redirect('manage_greeting_cards')
    else:
        return redirect('sign_up')


def activate_deactivate_kyc(request, kyc_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        user_controller.enable_disable_kyc(kyc_id, status)
        return redirect('manage_kyc')
    else:
        return redirect('sign_up')


def edit_bank(request, bank_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            bank_update_obj = bank_details_model.bank_details_model_from_dict(request.POST)
            resp = user_controller.edit_bank_details(bank_update_obj)
            return redirect('manage_bank_details')
        else:
            bank_data, status_code = user_controller.get_bank_by_id(bank_id)
            context = {
                "bank_data": bank_data
            }
            return render(request, 'pages/admin_employee/users_management/banks/edit_bank.html', context)
    else:
        return redirect('sign_up')


def edit_employee(request, user_id):
    if request.session.get('is_logged_in') is not None and request.session.get(
            'is_logged_in') is True and request.session.get('role') == 1:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.edit_employee(emp_obj, user_id)
            return redirect('manage_employee')
        else:
            response, status_code = user_controller.get_employee_by_id(user_id)
            return render(request, 'pages/admin_employee/employee_management/employee/edit_employee.html',
                          response)
    else:
        return redirect('sign_up')


def edit_admin(request, user_id):
    if request.session.get('is_logged_in') is not None and request.session.get(
            'is_logged_in') is True and request.session.get('role') == 1:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.edit_employee(emp_obj, user_id)
            return redirect('manage_admin')
        else:
            response, status_code = user_controller.get_employee_by_id(user_id)
            return render(request, 'pages/admin_employee/employee_management/admin/edit_admin.html', response)
    else:
        return redirect('sign_up')


def edit_event_type(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.edit_events_type(request.POST['id'], request.POST['name'])
            return redirect('manage_event_types')
    else:
        return redirect('sign_up')


def edit_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.edit_location(request.POST['id'], request.POST['name'])
            return redirect('manage_location')
    else:
        return redirect('sign_up')


def edit_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            grt_obj = greeting_cards_model.greeting_cards_model_from_dict(request.POST)
            greeting_cards_controller.edit_greeting_cards(grt_obj)
            return redirect('manage_greeting_cards')
    else:
        return redirect('sign_up')


def printer_edit_greeting_cards(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        if request.method == 'POST':
            grt_obj = greeting_cards_model.greeting_cards_model_from_dict(request.POST)
            greeting_cards_controller.edit_greeting_cards(grt_obj)
            return redirect('printer_manage_greeting_cards')
    else:
        return redirect('printer_login')


def edit_printer(request, printer_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            store_obj = add_printer_model.add_printer_model_from_dict(request.POST)
            response, status_code = store_controller.edit_printer(store_obj)
            return redirect('manage_printers')
        else:
            printer_data, status_code = store_controller.get_printer_by_id(printer_id)
            location, status_code = event_controller.get_city_list_for_user()
            context = {
                "printer_data": printer_data,
                "location": location
            }

            return render(request, 'pages/admin_employee/vendors_management/printing_vendor/edit_printer.html',
                          context)

    else:
        return redirect('sign_up')


def edit_event(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
            json_data = transform_data_to_json(request.POST)
            print(json_data)
            event_obj = create_event_model.create_event_model_from_dict(json_data)
            response = event_controller.edit_event(event_obj, event_id)
            return redirect('manage_event')
        else:
            event_types, status_code = event_controller.get_event_type_list_for_user()
            location, status_code = event_controller.get_city_list_for_user()
            users_list, status_code = user_controller.get_all_users(1)
            printers_list, status_code = store_controller.get_printers_by_status(1)
            event_data, status_code = event_controller.get_event_by_id(event_id)

            context = {
                "event_types": event_types,
                "location": location,
                "users": users_list,
                "printers": printers_list,
                "event": event_data
            }
            return render(request, 'pages/admin_employee/event_management/event/edit_event.html', context)

    else:
        return redirect('sign_up')


def filtered_events_on_approval_status(request, status):
    response, status_code = event_controller.get_event_by_approval_status(status)
    return render(request, 'pages/admin_employee/event_management/event/events.html',
                  {'response': response['event_list'], "status": status})


def filter_transaction_lists(request, event_id, status):
    response, status_code = transactions_controller.get_transaction_list(event_id, status)
    return render(request, 'pages/admin_employee/event_management/settlement/transactions_settlement.html',
                  {"response": response['transactions'], "event_id": event_id, "status": status})


def dashboard_search_event(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.dashboard_search_event(request.POST['search'])

        return render(request, 'pages/admin_employee/event_management/event/events.html',
                      {"response": response['event_list'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.search_kyc_data(request.POST['search'])

        return render(request, 'pages/admin_employee/users_management/kyc/kyc.html',
                      {"response": response['kyc_data'], "search": request.POST['search']})

    else:
        return redirect('sign_up')


def dashboard_search_bank(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_bank(request.POST['search'])

        return render(request, 'pages/admin_employee/users_management/banks/bank_details.html',
                      {"response": response['bank_data'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_user(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_user(request.POST['search'])

        return render(request, 'pages/admin_employee/users_management/users/users.html',
                      {"response": response['user_data'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_employee(request.POST['search'])

        return render(request, 'pages/admin_employee/employee_management/employee/employees.html',
                      {"response": response['user_data'], "search": request.POST['search'], "role": 2})
    else:
        return redirect('sign_up')


def dashboard_search_employee_status(request, status, role):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_employee_status(status)

        return render(request, 'pages/admin_employee/employee_management/employee/employees.html',
                      {'response': response['user_data'], "status": status, "role": role})
    else:
        return redirect('sign_up')


def dashboard_search_printers(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.dashboard_search_printers(request.POST['search'])

        return render(request, 'pages/admin_employee/vendors_management/printing_vendor/printing_vendor.html',
                      {"response": response['printer_data'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_delivery_vendors(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = delivery_vendor_controller.dashboard_search_delivery_vendor(request.POST['search'])

        return render(request, 'pages/admin_employee/vendors_management/delivery_vendor/delivery_vendor.html',
                      {"response": response['delivery_vendor_data'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_printers_status(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.dashboard_search_printers_status(status)

        return render(request, 'pages/admin_employee/vendors_management/printing_vendor/printing_vendor.html',
                      {'response': response['printer_data'], "status": status})
    else:
        return redirect('sign_up')


def dashboard_search_delivery_vendors_status(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = delivery_vendor_controller.dashboard_search_delivery_vendor_status(status)

        return render(request, 'pages/admin_employee/vendors_management/delivery_vendor/delivery_vendor.html',
                      {'response': response['delivery_vendor_data'], "status": status})
    else:
        return redirect('sign_up')


def dashboard_search_greetings(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.dashboard_search_greetings(request.POST['search'])

        return render(request, 'pages/admin_employee/event_management/greeting_card/greeting_cards.html',
                      {"response": response['all_greeting_cards'], "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_greetings_status(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.dashboard_filter_greetings(status)

        return render(request, 'pages/admin_employee/event_management/greeting_card/greeting_cards.html',
                      {'response': response['all_greeting_cards'], "status": status})
    else:
        return redirect('sign_up')


def printer_search_greetings(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = greeting_cards_controller.printer_search_greetings(request.POST['search'],
                                                                                   request.session.get('id'))

        return render(request, 'pages/printer/greeting_card/greeting_cards.html',
                      {"response": response['all_greeting_cards'], "search": request.POST['search']})
    else:
        return redirect('printer_login')


def change_printer_jobs_status(request, pjid, status, from_page):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = store_controller.change_print_jobs_status(pjid, status)
        return redirect(from_page)
    else:
        return redirect('printer_login')


def whatsapp_invite(request, e_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_data, status_code = event_controller.get_event_by_id(e_id)
        admins = event_controller.get_event_admins(e_id)
        invited_list = event_controller.get_invited_users_list(e_id)

        if request.method == 'POST':
            mob_numbers = []
            invited_by = request.POST['invited_by_uid']
            invite_message = request.POST['invite_msg']
            phone = request.POST['phone']
            if 'csv_file' in request.FILES:
                csv_file = request.FILES['csv_file']
                try:
                    fs = FileSystemStorage(location=os.path.join(settings.MEDIA_ROOT, 'contacts'))
                    filename = fs.save(csv_file.name, csv_file)
                    with open(fs.path(filename), 'r') as file:
                        reader = csv.reader(file)
                        for row in reader:
                            for cell in row:
                                cleaned_cell = ''.join(filter(str.isdigit, cell))
                                if cell.isdigit() and len(cleaned_cell) == 10:
                                    mob_numbers.append(cleaned_cell)

                    mob_numbers = list(set(mob_numbers))
                    if phone != '':
                        mob_numbers.append(phone)
                    response, status_code = event_controller.save_event_guest_invite(invited_by, mob_numbers, e_id,
                                                                                     invite_message)
                    return JsonResponse(response)

                except Exception as e:
                    error_message = f"An error occurred while processing the CSV: {e}"
                    return render(request, 'pages/admin_employee/event_management/event/whatsapp_invite.html',
                                  {'error_message': error_message, "event_data": event_data['event_data'],
                                   "admins": admins})

            else:
                if phone != '':
                    mob_numbers.append(phone)
                    response, status_code = event_controller.save_event_guest_invite(invited_by, mob_numbers, e_id,
                                                                                     invite_message)

                    return JsonResponse(response)

        else:
            return render(request, 'pages/admin_employee/event_management/event/whatsapp_invite.html',
                          {'invited_list': invited_list['invited_list'], "admins": admins,
                           "event_data": event_data['event_data'], "event_id": e_id})

    else:
        return redirect('sign_up')


# Printer view functions

def printer_home_page(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = store_controller.printer_dashboard(request.session.get('id'))
        return render(request, 'pages/printer/dashboard/printer_dashbord.html', response)
    return redirect('printer_login')


def printer_manage_greeting_cards(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = greeting_cards_controller.get_printer_greeting_cards(request.session.get('id'))
        return render(request, 'pages/printer/greeting_card/greeting_cards.html',
                      {"response": response['all_greeting_cards']})
    else:
        return redirect('printer_login')


def printer_search_all_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.printer_search_all_jobs(status, request.POST['search'],
                                                                         request.session.get('id'))

        return render(request, 'pages/printer/print_job/printer_all_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_search_open_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [2, 3, 4]
        response, status_code = store_controller.printer_search_all_jobs(status, request.POST['search'],
                                                                         {request.session.get('id')})

        return render(request, 'pages/printer/print_job/printer_open_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_search_closed_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [5]
        response, status_code = store_controller.printer_search_all_jobs(status, request.POST['search'],
                                                                         request.session.get('id'))

        return render(request, 'pages/printer/printer_closed_jobs.html', {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_search_new_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1]
        response, status_code = store_controller.printer_search_all_jobs(status, request.POST['search'],
                                                                         request.session.get('id'))

        return render(request, 'pages/printer/print_job/printer_new_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_filter_all_jobs(request, status):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = store_controller.printer_filter_jobs(status, request.session.get('id'))

        return render(request, 'pages/printer/print_job/printer_all_jobs.html',
                      {"response": response['jobs'], "status": status})
    else:
        return redirect('printer_login')


def printer_filter_open_jobs(request, status):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = store_controller.printer_filter_jobs(status, request.session.get('id'))

        return render(request, 'pages/printer/print_job/printer_open_jobs.html',
                      {"response": response['jobs'], "status": status})
    else:
        return redirect('printer_login')


def printer_add_greeting_cards(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        if request.method == 'POST':
            form_data = request.POST
            for file_key, file_obj in request.FILES.items():
                file_name = f"""images/greeting_card/{int(time.time())}_{str(file_obj)}"""
                form_data = form_data.copy()
                form_data['card_image_url'] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)
            grt_obj = greeting_cards_model.greeting_cards_model_from_dict(form_data)
            resp = greeting_cards_controller.add_greeting_card(grt_obj)
            return redirect('printer_manage_greeting_cards')
        else:
            printers_list, status_code = store_controller.get_printers_by_status(1)
            return render(request, 'pages/printer/greeting_card/add_greeting_cards.html', printers_list)

    else:
        return redirect('printer_login')


def printer_activate_deactivate_greeting_cards(request, card_id, status):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        greeting_cards_controller.disable_greeting_cards(card_id, status)
        return redirect('printer_manage_greeting_cards')
    else:
        return redirect('printer_login')


def printer_filter_greetings_cards(request, status):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = greeting_cards_controller.printer_filter_greeting_cards(status,
                                                                                        request.session.get('id'))

        return render(request, 'pages/printer/greeting_card/greeting_cards.html',
                      {'response': response['all_greeting_cards'], "status": status})
    else:
        return redirect('printer_login')


def printer_all_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)

        return render(request, 'pages/printer/print_job/printer_all_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_new_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)

        return render(request, 'pages/printer/print_job/printer_new_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_open_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [2, 3, 4]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)

        return render(request, 'pages/printer/print_job/printer_open_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


def printer_closed_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [5]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)

        return render(request, 'pages/printer/print_job/printer_closed_jobs.html',
                      {"response": response['jobs']})
    else:
        return redirect('printer_login')


#
# def get_all_jobs(request):
#     response, status_code = store_controller.get_all_jobs()
#     paginator = Paginator(response['jobs'], 25)
#     page = request.GET.get('page')
#     response = paginator.get_page(page)
#     return render(request, 'event_management/event_management/test.html', {"response": response})

#
# def get_closed_jobs(request, status):
#     response, status_code = store_controller.get_closed_jobs(status)
#     paginator = Paginator(response['jobs'], 25)
#     page = request.GET.get('page')
#     response = paginator.get_page(page)
#     return render(request, 'event_management/event_management/test.html', {"response": response, "status": status})


# @api_view(['POST'])
# def get_closed_jobs(request):
#     response, status_code = store_controller.get_closed_jobs(request.data['status'])
#     return JsonResponse(response, status=status_code)

# @api_view(['POST'])
# def add_employee(request):
#     emp_obj = employee_model.add_employee_model_from_dict(request.data)
#     response, status_code = user_controller.add_employee(emp_obj)
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_employee(request):
    response, status_code = user_controller.enable_disable_employee(request.data['uid'], request.data['status'])
    return JsonResponse(response, status=status_code)


# @api_view(['POST'])
# def edit_employee(request):
#     emp_obj = employee_model.add_employee_model_from_dict(request.data)
#     response, status_code = user_controller.edit_employee(emp_obj)
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_employee_by_id(request):
    response, status_code = user_controller.get_employee_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


# This API ensure that all Shagun app users are using compatible versions of the application, promoting a consistent
# and seamless user experience while maintaining the ability to leverage the latest features and enhancements.
@api_view(['POST'])
def app_compatibility(request):
    app_obj = app_data_model.app_data_model_from_dict(request.data)
    response, status_code = app_data_controller.app_compatibility(app_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def check_user(request):
    user, status_code = user_controller.check_user_exist(request.data.get('uid'), request.data['fcm_token'])
    if user['status']:
        token = jwt.encode({'username': user['user']['user_id'], 'exp': datetime.utcnow() + timedelta(minutes=300)},
                           'secret_key', algorithm='HS256')
        return Response({
            "status": user['status'],
            "token": token,
            "user": user['user']
        }, status=status_code)
    else:
        return Response({
            "status": user['status'],
            "token": None,
            "user": None

        }, status=status_code)


@api_view(['POST'])
def get_users_by_name_or_phone(request):
    response, status_code = user_controller.get_users_by_name_or_phone(request.data['search'])
    return JsonResponse(response, status=status_code)


# This API allows new users to register in the Shagun app. It handles the registration process, validating
# user-provided information, and creating a new user account in the backend database.
@api_view(['POST'])
def user_register(request):
    file_name = ""
    if request.data.get('profile_pic') is None:
        print("No profile added")
    else:
        for file_key, file_obj in request.FILES.items():
            file_name = f"""images/profile_pic/{request.data['uid']}_{str(file_obj)}"""
            with default_storage.open(file_name, 'wb+') as destination:
                for chunk in file_obj.chunks():
                    destination.write(chunk)

    user, status_code = user_controller.user_register(request.data, file_name)
    if user['user'] is not None:
        token = jwt.encode({'username': user['user']['user_id'], 'exp': datetime.utcnow() + timedelta(minutes=30)},
                           'secret_key', algorithm='HS256')
    else:
        token = None
    return JsonResponse({
        "status": user['status'],
        "token": token,
        "user": user['user']
    }, status=status_code)


@api_view(['POST'])
def get_user_profile(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = user_controller.get_user_profile(request.data['uid'])
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


# This API enables users to modify their credentials or update their user information. It provides the functionality
# to edit user details such as name, contact information, profile picture, or any other relevant data associated with
# their account.
@api_view(['POST'])
def edit_user(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            file_name = ""
            if request.data.get('profile_pic') is None:
                print("No profile added")
            else:
                for file_key, file_obj in request.FILES.items():
                    file_name = f"""images/profile_pic/{request.data['uid']}_{str(file_obj)}"""
                    with default_storage.open(file_name, 'wb+') as destination:
                        for chunk in file_obj.chunks():
                            destination.write(chunk)

            # edit_reg_obj = registration_model.registration_model_from_dict(request.data)
            response, status_code = user_controller.edit_user(request.data, file_name)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


# With this API, administrators or authorized users can change the status of a user account. By activating or
# deactivating a user, their access and privileges within the app can be controlled. An active user can fully utilize
# the app, while an inactive user may have limited access or restricted functionality.
@api_view(['POST'])
def activate_deactivate_user(request):
    response, status_code = user_controller.deactivate_user(request.data['uid'], request.data['status'])
    return JsonResponse(response, status=status_code)


# This API is responsible for a user's KYC submission. It validates the provided KYC documents against
# specified criteria or regulations and updates the user's KYC status in the backend system once approved.
@api_view(['POST'])
def add_user_kyc(request):
    kyc_obj = user_kyc_model.user_kyc_model_from_dict(request.data)
    response, status_code = user_controller.add_user_kyc(kyc_obj)
    return JsonResponse(response, status=status_code)


# This API allows to update their KYC details. If there are changes or updates required in their KYC documents
# or information, users can provide the updated details and ensure their KYC records remain accurate.
@api_view(['POST'])
def update_user_kyc(request):
    kyc_obj = user_kyc_model.user_kyc_model_from_dict(request.data)
    response, status_code = user_controller.update_user_kyc(kyc_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_kyc(request):
    response, status_code = user_controller.enable_disable_kyc(request.data['uid'], request.data['verification_status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_kyc_by_id(request):
    response, status_code = user_controller.get_kyc_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


# This API enables to securely add their banks account details to the Shagun app. It ensures the confidentiality
# and integrity of the sensitive information provided by the user, storing it securely in the backend database.
@api_view(['POST'])
def add_bank_details(request):
    bank_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.add_bank_details(bank_obj)
    return JsonResponse(response, status=status_code)


# Users can utilize this API to update their banks account details if needed. It allows for the modification of
# information associated with the user's banks account, such as account number or any other relevant details.
@api_view(['POST'])
def edit_bank_details(request):
    bank_update_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.edit_bank_details(bank_update_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_bank_by_id(request):
    response, status_code = user_controller.get_bank_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


# This API facilitates the creation of events within the Shagun app. Authorized users can use this API to specify
# event-specific information such as the event title, description, date, time, location, and other relevant details.
@api_view(['POST'])
def create_event(request):
    event_obj = create_event_model.create_event_model_from_dict(request.data)
    response, status_code = event_controller.create_event(event_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_event(request):
    response, status_code = event_controller.enable_disable_event(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def active_event_settlement(request):
    response, status_code = transactions_controller.event_settlement(request.data['event_id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_my_event_list(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = event_controller.get_my_event_list(request.data['uid'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def get_event_by_id(request):
    response, status_code = event_controller.get_event_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def search_user_event(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = event_controller.search_user_event(request.data['search_uid'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


# By providing the event ID as a parameter, this API allows users to fetch detailed information about a specific event.
# It retrieves event-specific details such as the event description, date, time, location, participating users, and any
# other relevant information associated with that particular event.
@api_view(['POST'])
def get_single_event(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            event_id = request.data['event_id']
            phone = request.data['phone']
            response, status_code = event_controller.get_single_event(event_id, phone)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_event(request):
    response, status_code = event_controller.gift_event(request.data['id'], request.data['phone'])
    return JsonResponse(response, status=status_code)


#
# @api_view(['POST'])
# def create_events_type(request):
#     response, status_code = event_controller.create_events_type(request.data['event_type_name'])
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_events_type(request):
    response, status_code = event_controller.disable_events_type(request.data['event_id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_events_type_by_id(request):
    response, status_code = event_controller.events_type_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def edit_events_type(request):
    response, status_code = event_controller.edit_events_type(request.data['event_type_name'], request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_event_type_list(request):
    response, status_code = event_controller.get_event_type_list_for_user()
    return JsonResponse(response, status=status_code)


# @api_view(['POST'])
# def add_location(request):
#     response, status_code = event_controller.add_location(request.data['city_name'])
#     return JsonResponse(response, status=status_code)
#

@api_view(['POST'])
def enable_disable_location(request):
    response, status_code = event_controller.disable_location(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


#
# @api_view(['POST'])
# def edit_location(request):
#     response, status_code = event_controller.edit_location(request.data['id'], request.data['city_name'])
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_location_by_id(request):
    response, status_code = event_controller.get_location_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


# @api_view(['POST'])
# def add_printer(request):
#     store_obj = add_printer_model.add_printer_model_from_dict(request.data)
#     response, status_code = store_controller.add_printer(store_obj)
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_printer(request):
    response, status_code = store_controller.disable_printer(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


# @api_view(['POST'])
# def edit_printer(request):
#     store_obj = add_printer_model.add_printer_model_from_dict(request.data)
#     response, status_code = store_controller.edit_printer(store_obj)
#     return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_printer_by_id(request):
    response, status_code = store_controller.get_printer_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def request_callback(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            request_obj = request_callback_model.request_callback_model_from_dict(request.data)
            response, status_code = request_controller.request_callback(request_obj)
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def add_transaction_history(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            transaction_obj = transactions_history_model.transactions_history_model_from_dict(request.data)
            response, status_code = transactions_controller.add_transaction_history(transaction_obj)
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def user_home_page(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = user_home_page_controller.home_page_data(request.data['uid'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def get_my_all_invited_events(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = event_controller.get_my_invited_event_list(request.data['uid'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def get_my_notifications(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = event_controller.get_my_notifications_list(request.data['uid'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_sent_list(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
            response, status_code = transactions_controller.get_sent_gift(gift_data_obj)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_sent_search(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
            response, status_code = transactions_controller.search_sent_gift(gift_data_obj)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_received_list(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
            response, status_code = transactions_controller.get_received_gift(gift_data_obj)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_received_search(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
            response, status_code = transactions_controller.search_received_gift(gift_data_obj)
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def gift_received_for_event(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = transactions_controller.get_received_gift_for_event(request.data['uid'],
                                                                                        request.data['eid'])
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def track_transaction(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = transactions_controller.get_transaction_track(request.data['tid'])
            return JsonResponse(response, status=status_code)

        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def get_greeting_cards(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = greeting_cards_controller.get_greeting_cards(request.data['event_id'])
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


@api_view(['POST'])
def get_greetings_by_id(request):
    response, status_code = greeting_cards_controller.get_greetings_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def manage_vendor(request):
    vendor_obj = add_vendor_model.add_vendor_model_from_dict(request.data)
    response, status_code = delivery_vendor_controller.add_vendor(vendor_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_vendor(request):
    response, status_code = delivery_vendor_controller.enable_disable_vendor(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def event_admin(request):
    response, status_code = test_controller.event_admin(request.data['event_id'])
    return JsonResponse(response)
