import jwt
from datetime import datetime, timedelta
import os
import csv
from django.core.files.storage import FileSystemStorage
import re

from django.core.files.storage import default_storage
from django.core.paginator import Paginator
from django.shortcuts import redirect, render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from django.contrib import messages
import time

from rest_framework.reverse import reverse

from Shagun_backend import settings
from Shagun_backend.controllers import user_controller, event_controller, app_data_controller, store_controller, \
    transactions_controller, user_home_page_controller, greeting_cards_controller, admin_controller, request_controller, \
    bank_controller, test_controller, delivery_vendor_controller
from Shagun_backend.models import registration_model, user_kyc_model, bank_details_model, create_event_model, \
    app_data_model, add_printer_model, transactions_history_model, track_order_model, employee_model, \
    gifts_transaction_model, request_callback_model, greeting_cards_model, add_vendor_model, bank_model
from Shagun_backend.models.create_event_model1 import transform_data_to_json
from Shagun_backend.util.constants import today


def sign_up(request):
    if request.method == 'POST':
        data = request.POST
        response = user_controller.employee_login(data['username'], data['password'])
        if response['msg'] == 'Success':
            request.session['is_logged_in'] = True
            request.session['uid'] = data['username']
            request.session['name'] = response['name']
            request.session['profile_pic'] = response['profile_pic']
            return redirect('admin_dashboard')
        else:
            messages.error(request, response['msg'])
    return render(request, 'pages/admin_employee/login.html')


def logout(request):
    request.session.clear()
    return redirect('sign_up')


def custom_404(request):
    request.session.clear()
    return render(request, 'pages/admin_employee/error-404.html')


def admin_dashboard(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = admin_controller.admin_dashboard(request.session.get('uid'))
        print(response)
        return render(request, 'index.html', response)
    else:
        return redirect('sign_up')


def manage_event(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_all_event_list()
        paginator = Paginator(response['event_list'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/events.html', {'response': response})
    else:
        return redirect('sign_up')


@api_view(['POST'])
def manage_settlement(request):
    response = event_controller.get_all_active_events()
    return JsonResponse(response, safe=False)


def manage_event_types(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_event_type_list_for_admin()
        paginator = Paginator(response['events_type'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/event_type.html', {"response": response})
    else:
        return redirect('sign_up')


def manage_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_locations_list()
        return render(request, 'pages/admin_employee/location.html', response)
    else:
        return redirect('sign_up')


def manage_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print("++++++++++++++++++++++++++++++++++++++")
            print(request.POST)
            response, status_code = user_controller.get_kyc_data('%')
            paginator = Paginator(response['kyc_data'], 25)
            page = request.GET.get('page')
            response = paginator.get_page(page)
            return render(request, 'pages/admin_employee/kyc.html', {"response": response})
        else:
            response, status_code = user_controller.get_kyc_data('%')
            paginator = Paginator(response['kyc_data'], 25)
            page = request.GET.get('page')
            response = paginator.get_page(page)
            return render(request, 'pages/admin_employee/kyc.html', {"response": response})

    else:
        return redirect('sign_up')


def filter_kyc(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_kyc_data(status)
        paginator = Paginator(response['kyc_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/kyc.html', {"response": response, "status": status})

    else:
        return redirect('sign_up')


def filter_bank(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:

        response, status_code = user_controller.get_all_bank_data(status)
        paginator = Paginator(response['bank_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/bank_details.html', {"response": response, "status": status})

    else:
        return redirect('sign_up')


def filter_user(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:

        response, status_code = user_controller.filter_users(status)
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/users.html', {"response": response, "status": status})

    else:
        return redirect('sign_up')


def manage_bank_details(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_bank_data('%')
        paginator = Paginator(response['bank_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/bank_details.html', {"response": response})
    else:
        return redirect('sign_up')


def manage_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.get_all_greeting_cards()
        paginator = Paginator(response['all_greeting_cards'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/greeting_cards.html', {"response": response})
    else:
        return redirect('sign_up')


def printer_manage_greeting_cards(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        response, status_code = greeting_cards_controller.get_printer_greeting_cards(request.session.get('id'))
        paginator = Paginator(response['all_greeting_cards'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/printer/greeting_cards.html', {"response": response})
    else:
        return redirect('sign_up')


def manage_users(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_users('%')
        print(response)
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/users.html', {"response": response})
    else:
        return redirect('sign_up')


def manage_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_employees()
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/employees.html', {"response": response, "role": 2})
    else:
        return redirect('sign_up')


def manage_admin(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_admins()
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/admins.html', {"response": response, "role": 1})
    else:
        return redirect('sign_up')


def manage_printers(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.get_printers_by_status('%')
        paginator = Paginator(response['printer_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/printing_vendor.html', {"response": response})
    else:
        return redirect('sign_up')


def manage_delivery_vendors(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = delivery_vendor_controller.get_delivery_vendor()
        paginator = Paginator(response['delivery_vendor_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/delivery_vendor.html', {"response": response})
    else:
        return redirect('sign_up')


def edit_delivery_vendors(request, vid):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
            vendor_obj = add_vendor_model.add_vendor_model_from_dict(request.POST)
            print("=========================================================")
            print(vendor_obj)
            print("=========================================================")

            response = delivery_vendor_controller.update_vendor(vendor_obj)
            print(response)
            return redirect('manage_delivery_vendors')
        else:
            response, status_code = delivery_vendor_controller.edit_delivery_vendor(vid)
            location, status_code = event_controller.get_city_list_for_user()
            return render(request, 'pages/admin_employee/edit_delivery_vendor.html',
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
            return redirect('printer_home_page')
        else:
            messages.error(request, response['msg'])
            return render(request, 'pages/admin_employee/printer_login.html')
    else:
        return render(request, 'pages/admin_employee/printer_login.html')


def printer_home_page(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        return render(request, 'pages/printer/printer_dashbord.html')
    return redirect('printer_login')


def kyc_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_user_requests('KYC')
        paginator = Paginator(response['req_list'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/manage_kyc_request.html', {"response": response})
    else:
        return redirect('sign_up')


def event_request(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_user_requests('event')
        paginator = Paginator(response['req_list'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/manage_event_request.html', {"response": response})
    else:
        return redirect('sign_up')


def get_settlement_for_event(request, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.event_settlement(status)
        paginator = Paginator(response['event_settlement'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/settlements.html', {"response": response})
    else:
        return redirect('sign_up')


def dashboard_search_event_settlement(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.search_event_settlement(request.POST['search'])
        paginator = Paginator(response['event_settlement'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/settlements.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def all_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.get_all_jobs(status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/all_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def filter_all_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.filter_all_jobs(status, request.POST['search'])
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/all_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def Open_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4]
        response, status_code = store_controller.get_all_jobs(status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/all_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def filter_Open_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [1, 2, 3, 4]
        response, status_code = store_controller.filter_all_jobs(status, request.POST['search'])
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/all_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def closed_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [5]
        response, status_code = store_controller.get_all_jobs(status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/closed_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def filter_closed_printer_jobs(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        status = [5]
        response, status_code = store_controller.filter_all_jobs(status, request.POST['search'])
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/closed_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


# I need the data from transaction history table (sender, reciever, total amount, shagun, amount, card amount,
# created date, event date.... all details
def transactions_settlement(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            reciever_list = request.POST.getlist('selected_uid')
            transaction_id = request.POST.getlist('selected_ids')
            amount_list = request.POST.getlist('selected_amounts')
            transactions_controller.settle_payment(reciever_list, transaction_id, amount_list)
            response, status_code = transactions_controller.get_transaction_list(event_id, '%')
            paginator = Paginator(response['transactions'], 250)
            page = request.GET.get('page')
            response = paginator.get_page(page)
            return render(request, 'pages/admin_employee/transactions_settlement.html',
                          {"response": response, "event_id": event_id})
        else:
            response, status_code = transactions_controller.get_transaction_list(event_id, '%')
            print(response)
            paginator = Paginator(response['transactions'], 250)
            page = request.GET.get('page')
            response = paginator.get_page(page)
            return render(request, 'pages/admin_employee/transactions_settlement.html',
                          {"response": response, "event_id": event_id})
    else:
        return redirect('sign_up')


def add_events(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            json_data = transform_data_to_json(request.POST)
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
            return render(request, 'pages/admin_employee/add_events.html', context)

    else:
        return redirect('sign_up')


def add_events_type(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.create_events_type(request.POST['event_type_name'], request.POST['created_by_uid'])
            return redirect('manage_event_types')
        else:
            return render(request, 'pages/admin_employee/add_events_type.html')

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
            response, status_code = user_controller.get_all_users('%')
            return render(request, 'pages/admin_employee/add_kyc.html', response)
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
            bank, status_code = bank_controller.get_all_banks_list()
            context = {
                "user": user,
                "bank": bank
            }
            return render(request, 'pages/admin_employee/add_bank.html', context)
    else:
        return redirect('sign_up')


def add_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.add_employee(emp_obj)
            return redirect('manage_employee')
        else:
            return render(request, 'pages/admin_employee/add_employee.html')
    else:
        return redirect('sign_up')


def add_admin(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            admin_obj = employee_model.add_employee_model_from_dict(request.POST)
            print(user_controller.add_admin(admin_obj))
            return redirect('manage_admin')
        else:
            return render(request, 'pages/admin_employee/add_admin.html')
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
            return render(request, 'pages/admin_employee/add_printer.html', location)
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
            return render(request, 'pages/admin_employee/add_delivery_vendor.html', location)
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
            return render(request, 'pages/admin_employee/add_greeting_cards.html', printers_list)

    else:
        return redirect('sign_up')


def printer_add_greeting_cards(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
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
            return redirect('printer_manage_greeting_cards')
        else:
            printers_list, status_code = store_controller.get_printers_by_status(1)
            return render(request, 'pages/printer/add_greeting_cards.html', printers_list)

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
            return render(request, 'pages/admin_employee/edit_kyc.html', context)
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


def printer_activate_deactivate_greeting_cards(request, card_id, status):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
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
            user_controller.edit_bank_details(bank_update_obj)
            return redirect('manage_bank_details')
        else:
            bank_data, status_code = user_controller.get_bank_by_id(bank_id)
            bank_list, status_code = bank_controller.get_all_banks_list()
            context = {
                "bank_data": bank_data,
                "bank_list": bank_list
            }
            return render(request, 'pages/admin_employee/edit_bank.html', context)
    else:
        return redirect('sign_up')


def edit_employee(request, user_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.edit_employee(emp_obj)
            return redirect('manage_employee')
        else:
            response, status_code = user_controller.get_employee_by_id(user_id)
            return render(request, 'pages/admin_employee/edit_employee.html', response)
    else:
        return redirect('sign_up')


def edit_admin(request, user_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.edit_employee(emp_obj)
            return redirect('manage_admin')
        else:
            response, status_code = user_controller.get_employee_by_id(user_id)
            return render(request, 'pages/admin_employee/edit_admin.html', response)
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
        return redirect('sign_up')


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

            return render(request, 'pages/admin_employee/edit_printer.html', context)

    else:
        return redirect('sign_up')


def edit_event(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            json_data = transform_data_to_json(request.POST)
            event_obj = create_event_model.create_event_model_from_dict(json_data)
            event_controller.edit_event(event_obj, event_id)
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
            return render(request, 'pages/admin_employee/edit_event.html', context)

    else:
        return redirect('sign_up')


def filtered_events_on_approval_status(request, status):
    # Get all events filtered by status
    response, status_code = event_controller.get_event_by_approval_status(status)
    paginator = Paginator(response['event_list'], 25)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/events.html', {'response': response, "status": status})


def filter_transaction_lists(request, event_id, status):
    response, status_code = transactions_controller.get_transaction_list(event_id, status)
    paginator = Paginator(response['transactions'], 250)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/transactions_settlement.html',
                  {"response": response, "event_id": event_id, "status": status})


def dashboard_search_event(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.dashboard_search_event(request.POST['search'])
        paginator = Paginator(response['event_list'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/events.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.search_kyc_data(request.POST['search'])
        paginator = Paginator(response['kyc_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/kyc.html',
                      {"response": response, "search": request.POST['search']})

    else:
        return redirect('sign_up')


def dashboard_search_bank(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_bank(request.POST['search'])
        paginator = Paginator(response['bank_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/bank_details.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_user(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_user(request.POST['search'])
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/users.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.dashboard_search_employee(request.POST['search'])
        paginator = Paginator(response['user_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/employees.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_employee_status(request, status, role):
    response, status_code = user_controller.dashboard_search_employee_status(status, role)
    paginator = Paginator(response['user_data'], 25)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/employees.html', {'response': response, "status": status})


def dashboard_search_printers(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.dashboard_search_printers(request.POST['search'])
        paginator = Paginator(response['printer_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/printing_vendor.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_delivery_vendors(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = delivery_vendor_controller.dashboard_search_delivery_vendor(request.POST['search'])
        paginator = Paginator(response['delivery_vendor_data'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/delivery_vendor.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_printers_status(request, status):
    # Get all printers filtered by status
    response, status_code = store_controller.dashboard_search_printers_status(status)
    paginator = Paginator(response['printer_data'], 25)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/printing_vendor.html', {'response': response, "status": status})


def dashboard_search_delivery_vendors_status(request, status):
    response, status_code = delivery_vendor_controller.dashboard_search_delivery_vendor_status(status)
    paginator = Paginator(response['delivery_vendor_data'], 25)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/delivery_vendor.html', {'response': response, "status": status})


def dashboard_search_greetings(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.dashboard_search_greetings(request.POST['search'])
        paginator = Paginator(response['all_greeting_cards'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/admin_employee/greeting_cards.html',
                      {"response": response, "search": request.POST['search']})
    else:
        return redirect('sign_up')


def dashboard_search_greetings_status(request, status):
    # Get all printers filtered by status
    response, status_code = greeting_cards_controller.dashboard_search_greetings(status)
    paginator = Paginator(response['all_greeting_cards'], 25)
    page = request.GET.get('page')
    response = paginator.get_page(page)
    return render(request, 'pages/admin_employee/printing_vendor.html', {'response': response, "status": status})


def printer_all_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1, 2, 3, 4, 5]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/printer/printer_all_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def printer_open_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [1, 2, 3, 4]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/printer/printer_open_jobs.html', {"response": response})
    else:
        return redirect('sign_up')


def printer_closed_jobs(request):
    if request.session.get('is_printer_logged_in') is not None and request.session.get('is_printer_logged_in') is True:
        status = [5]
        response, status_code = store_controller.get_printers_jobs(request.session.get('id'), status)
        paginator = Paginator(response['jobs'], 25)
        page = request.GET.get('page')
        response = paginator.get_page(page)
        return render(request, 'pages/printer/printer_closed_jobs.html', {"response": response})
    else:
        return redirect('sign_up')



def whatsapp_invite(request, e_id):
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
                test_controller.save_event_guest_invite(invited_by, mob_numbers, e_id, invite_message)
                return redirect(reverse('whatsapp_invite', args=[e_id]))

            except Exception as e:
                error_message = f"An error occurred while processing the CSV: {e}"
                return render(request, 'pages/admin_employee/whatsapp_invite.html',
                              {'error_message': error_message, "event_data": event_data['event_data'],
                               "admins": admins})

        else:
            mob_numbers = list(set(mob_numbers))
            test_controller.save_event_guest_invite(invited_by, mob_numbers, e_id)
            return render(request, 'pages/admin_employee/whatsapp_invite.html',
                          {'invited_list': invited_list['invited_list'], "event_data": event_data['event_data'], "admins": admins})

    else:
        return render(request, 'pages/admin_employee/whatsapp_invite.html',
                      {'invited_list': invited_list['invited_list'], "admins": admins, "event_data": event_data['event_data']})



#
# def get_all_jobs(request):
#     response, status_code = store_controller.get_all_jobs()
#     paginator = Paginator(response['jobs'], 25)
#     page = request.GET.get('page')
#     response = paginator.get_page(page)
#     return render(request, 'pages/admin_employee/test.html', {"response": response})

#
# def get_closed_jobs(request, status):
#     response, status_code = store_controller.get_closed_jobs(status)
#     paginator = Paginator(response['jobs'], 25)
#     page = request.GET.get('page')
#     response = paginator.get_page(page)
#     return render(request, 'pages/admin_employee/test.html', {"response": response, "status": status})


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


#
# @api_view(['POST'])
# def update_callback_request(request):
#     callback_obj = request_callback_model.request_callback_model_from_dict(request.data)
#     response, status_code = request_controller.update_callback_request(callback_obj)
#     return JsonResponse(response, status=status_code)


# This API is used to verify the existence of a user. It checks if the provided user details or credentials match
# any registered user in the backend system.

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
    reg_obj = registration_model.registration_model_from_dict(request.data)
    user, status_code = user_controller.user_register(reg_obj)
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
            edit_reg_obj = registration_model.registration_model_from_dict(request.data)
            response, status_code = user_controller.edit_user(edit_reg_obj)
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


# This API enables to securely add their bank account details to the Shagun app. It ensures the confidentiality
# and integrity of the sensitive information provided by the user, storing it securely in the backend database.
@api_view(['POST'])
def add_bank_details(request):
    bank_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.add_bank_details(bank_obj)
    return JsonResponse(response, status=status_code)


# Users can utilize this API to update their bank account details if needed. It allows for the modification of
# information associated with the user's bank account, such as account number or any other relevant details.
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
def gift_received_list(request):
    gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
    response, status_code = transactions_controller.get_received_gift(gift_data_obj)
    return JsonResponse(response, status=status_code)
    # token = request.headers.get('Authorization').split(' ')[1]
    # try:
    #     decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
    #     username = decoded_token['username']
    #     if username == request.data.get('uid'):
    #         gift_data_obj = gifts_transaction_model.gifts_transaction_model_from_dict(request.data)
    #         response, status_code = transactions_controller.get_received_gift(gift_data_obj)
    #         return JsonResponse(response, status=status_code)
    #
    #     else:
    #         return JsonResponse({'message': 'Invalid token for user'}, status=401)
    #
    # except jwt.ExpiredSignatureError:
    #     return JsonResponse({'message': 'Token has expired'}, status=401)
    # except jwt.InvalidTokenError:
    #     return JsonResponse({'message': 'Invalid token'}, status=401)


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


#
# @api_view(['POST'])
# def edit_greeting_cards(request):
#     grt_obj = greeting_cards_model.greeting_cards_model_from_dict(request.data)
#     response, status_code = greeting_cards_controller.edit_greeting_cards(grt_obj)
#     return JsonResponse(response, status=status_code)


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
def track_order(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            track_order_obj = track_order_model.track_order_model_from_dict(request.data)
            response, status_code = transactions_controller.get_track_order(track_order_obj)
            return JsonResponse(response, status=status_code)
        else:
            return JsonResponse({'message': 'Invalid token for user'}, status=401)

    except jwt.ExpiredSignatureError:
        return JsonResponse({'message': 'Token has expired'}, status=401)
    except jwt.InvalidTokenError:
        return JsonResponse({'message': 'Invalid token'}, status=401)


# @api_view(['POST'])
# def home(request):
#     token = request.headers.get('Authorization').split(' ')[1]
#     try:
#         decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
#         username = decoded_token['username']
#         if username == request.data.get('uid'):
#             return JsonResponse({'message': 'Welcome, {}'.format(username)})
#
#         else:
#             return JsonResponse({'message': 'Invalid token for user'}, status=401)
#
#     except jwt.ExpiredSignatureError:
#         return JsonResponse({'message': 'Token has expired'}, status=401)
#     except jwt.InvalidTokenError:
#         return JsonResponse({'message': 'Invalid token'}, status=401)


# test done here

def test_view(request):
    # response['event_list']
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_all_event_list()
        paginator = Paginator(response['event_list'], 2)

        # Get the current page number from the request's GET parameters
        page_number = request.GET.get('page')

        # Get the Page object for the current page
        page_obj = paginator.get_page(page_number)

        context = {
            'page_obj': page_obj
        }
        return render(request, 'pages/admin_employee/test.html', context)
    else:
        return redirect('sign_up')


# def event_admin(request, event_id):
#     response, status_code = test_controller.event_admin(event_id)
#     print(response)
#     return render(request, 'pages/admin_employee/event.html', {"response": response, "event_id": event_id})



@api_view(['POST'])
def add_ev(request):
    resp, status_code = event_controller.add()
    return JsonResponse(resp)


@api_view(['POST'])
def event_admin(request):
    response, status_code = test_controller.event_admin(request.data['event_id'])
    return JsonResponse(response)


@api_view(['POST'])
def add_bank_list(request):
    response, status_code = bank_controller.add_bank_list(request.data['bank_name'], request.data['bank_logo'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def activate_deactivate_bank_list(request):
    response, status_code = bank_controller.activate_deactivate_bank_list(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def activate_deactivate_print_jobs(request):
    response, status_code = store_controller.activate_deactivate_print_jobs(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)

# def next_page(request):
#     print("============================================")
#     print(request.POST['selected_id_list'])
#     if request.method == 'POST':
#         selected_ids = request.POST['selected_id_list']
#         print("====================================")
#         print(selected_ids)
#         return redirect('manage_event')
