import jwt
from datetime import datetime, timedelta

from django.core.files.storage import default_storage
from django.shortcuts import redirect, render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from django.contrib import messages
import time

from Shagun_backend.controllers import user_controller, event_controller, app_data_controller, store_controller, \
    transactions_controller, user_home_page_controller, greeting_cards_controller, admin_controller, request_controller, \
    bank_controller
from Shagun_backend.models import registration_model, user_kyc_model, bank_details_model, create_event_model, \
    app_data_model, add_printer_model, transactions_history_model, track_order_model, employee_model, \
    gifts_transaction_model, request_callback_model, greeting_cards_model
from Shagun_backend.models.create_event_model1 import transform_data_to_json


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
    return render(request, 'pages/tables/login.html')


def logout(request):
    request.session.clear()
    return redirect('sign_up')


def admin_dashboard(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = admin_controller.admin_dashboard(request.session.get('uid'))
        return render(request, 'index.html', response)
    else:
        return redirect('sign_up')


def manage_event(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_all_event_list()
        return render(request, 'pages/tables/events.html', response)
    else:
        return redirect('sign_up')


@api_view(['POST'])
def manage_settlement(request):
    response = event_controller.get_all_active_events()
    return JsonResponse(response, safe=False)


def manage_event_types(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_event_type_list_for_admin()
        return render(request, 'pages/tables/event_type.html', response)
    else:
        return redirect('sign_up')


def manage_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = event_controller.get_locations_list()
        return render(request, 'pages/tables/location.html', response)
    else:
        return redirect('sign_up')


def manage_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            data = request.POST
            response, status_code = user_controller.get_kyc_data()
            return render(request, 'pages/tables/kyc.html', response)
        else:
            response, status_code = user_controller.get_kyc_data()
            return render(request, 'pages/tables/kyc.html', response)


    else:
        return redirect('sign_up')


def manage_bank_details(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_bank_data()

        return render(request, 'pages/tables/bank_details.html', response)
    else:
        return redirect('sign_up')


def manage_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = greeting_cards_controller.get_all_greeting_cards()
        return render(request, 'pages/tables/greeting_cards.html', response)
    else:
        return redirect('sign_up')


def manage_users(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_users()
        return render(request, 'pages/tables/users.html', response)
    else:
        return redirect('sign_up')


def manage_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = user_controller.get_all_employees()
        return render(request, 'pages/tables/employees.html', response)
    else:
        return redirect('sign_up')


def manage_printers(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        response, status_code = store_controller.get_all_printers()
        return render(request, 'pages/tables/printers.html', response)
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
            users_list, status_code = user_controller.get_all_users()
            printers_list, status_code = store_controller.get_all_printers()
            context = {
                "event_types": event_types,
                "location": location,
                "users": users_list,
                "printers": printers_list
            }
            return render(request, 'pages/tables/add_events.html', context)

    else:
        return redirect('sign_up')


def add_events_type(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            event_controller.create_events_type(request.POST['event_type_name'], request.POST['created_by_uid'])
            return redirect('manage_event_types')
        else:
            return render(request, 'pages/tables/add_events_type.html')

    else:
        return redirect('sign_up')


def add_kyc(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""{request.POST['identification_number1'] if file_key == "document1" else request.POST['identification_number2']}_{int(time.time())}_{str(file_obj)}"""
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
            response, status_code = user_controller.get_all_users()
            return render(request, 'pages/tables/add_kyc.html', response)
    else:
        return redirect('sign_up')


def add_bank(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            bank_obj = bank_details_model.bank_details_model_from_dict(request.POST)
            user_controller.add_bank_details(bank_obj)
            return redirect('manage_bank_details')
        else:
            user, status_code = user_controller.get_all_users()
            bank, status_code = bank_controller.get_all_banks_list()
            context = {
                "user": user,
                "bank": bank
            }
            return render(request, 'pages/tables/add_bank.html', context)
    else:
        return redirect('sign_up')


def add_employee(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            emp_obj = employee_model.add_employee_model_from_dict(request.POST)
            user_controller.add_employee(emp_obj)
            return redirect('manage_employee')
        else:
            return render(request, 'pages/tables/add_employee.html')
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
            return render(request, 'pages/tables/add_printer.html', location)
    else:
        return redirect('sign_up')


def add_greeting_cards(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""{int(time.time())}_{str(file_obj)}"""
                form_data = form_data.copy()
                form_data['card_image_url'] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)
            grt_obj = greeting_cards_model.greeting_cards_model_from_dict(form_data)
            greeting_cards_controller.add_greeting_card(grt_obj)
            return redirect('manage_greeting_cards')
        else:
            printers_list, status_code = store_controller.get_all_printers()
            return render(request, 'pages/tables/add_greeting_cards.html', printers_list)

    else:
        return redirect('sign_up')


def add_location(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            response, status_code = event_controller.add_location(request.POST['city_name'],
                                                                  request.POST['created_by_uid'])
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


def activate_deactivate_employee(request, user_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        user_controller.enable_disable_employee(user_id, status)
        return redirect('manage_employee')
    else:
        return redirect('sign_up')


def activate_deactivate_printers(request, printer_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        store_controller.disable_printer(printer_id, status)
        return redirect('manage_printers')
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


def edit_kyc(request, event_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        form_data = request.POST
        if request.method == 'POST':
            for file_key, file_obj in request.FILES.items():
                file_name = f"""{request.POST['identification_number1'] if file_key == "document1" else request.POST['identification_number2']}_{int(time.time())}_{str(file_obj)}"""
                identification_doc_key = 'identification_doc1' if file_key == 'document1' else 'identification_doc2'
                form_data = form_data.copy()
                form_data[identification_doc_key] = file_name
                with default_storage.open(file_name, 'wb+') as destination:
                    for chunk in file_obj.chunks():
                        destination.write(chunk)

            kyc_obj = user_kyc_model.user_kyc_model_from_dict(form_data)
            print(kyc_obj)
            user_controller.edit_user_kyc(kyc_obj)
            return redirect('manage_kyc')
        else:
            kyc_data, status_code = user_controller.get_kyc_by_id(event_id)
            print(kyc_data)
            users_list, status_code = user_controller.get_all_users()
            context = {
                "kyc_data": kyc_data,
                "user_list": users_list
            }
            return render(request, 'pages/tables/edit_kyc.html', context)
    else:
        return redirect('sign_up')


def set_event_status(request, event_id, status):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        event_controller.set_event_status(event_id, status)
        return redirect('manage_event')
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
            user_controller.edit_bank_details(bank_update_obj)
            return redirect('manage_bank_details')
        else:
            bank_data, status_code = user_controller.get_bank_by_id(bank_id)
            bank_list, status_code = bank_controller.get_all_banks_list()
            print(bank_data)
            context = {
                "bank_data": bank_data,
                "bank_list": bank_list
            }
            return render(request, 'pages/tables/edit_bank.html', context)
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
            return render(request, 'pages/tables/edit_employee.html', response)
    else:
        return redirect('sign_up')


def edit_event_type(request):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
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
            print(grt_obj)
            print(greeting_cards_controller.edit_greeting_cards(grt_obj))
            return redirect('manage_greeting_cards')
    else:
        return redirect('sign_up')


def edit_printer(request, printer_id):
    if request.session.get('is_logged_in') is not None and request.session.get('is_logged_in') is True:
        if request.method == 'POST':
            print(request.POST)
            store_obj = add_printer_model.add_printer_model_from_dict(request.POST)
            response, status_code = store_controller.edit_printer(store_obj)
            print(response)
            return redirect('manage_printers')
        else:
            printer_data, status_code = store_controller.get_printer_by_id(printer_id)
            location, status_code = event_controller.get_city_list_for_user()
            context = {
                "printer_data": printer_data,
                "location": location
            }

            return render(request, 'pages/tables/edit_printer.html', context)

    else:
        return redirect('sign_up')


def edit_event(request, event_id):
    return render(request, 'pages/tables/edit_event.html')


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
def update_callback_request(request):
    callback_obj = request_callback_model.request_callback_model_from_dict(request.data)
    response, status_code = request_controller.update_callback_request(callback_obj)
    return JsonResponse(response, status=status_code)


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
    print(bank_obj)
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


# This API retrieves a list of registered events from the backend database. It provides comprehensive event information,
# including event titles, dates, locations, and other relevant data. Users can browse and access the available events
# through this API.
# @api_view(['POST'])
# def get_event_list(request):
#     response, status_code = event_controller.get_event_list(request.data['uid'])
#     return JsonResponse(response, status=status_code)

@api_view(['POST'])
def event_settlement(request):
    response, status_code = transactions_controller.event_settlement(request.data['event_id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_my_event_list(request):
    response, status_code = event_controller.get_my_event_list(request.data['uid'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_event_by_id(request):
    response, status_code = event_controller.get_event_by_id(request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_active_event(request):
    response, status_code = event_controller.get_active_event(request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def search_user_event(request):
    response, status_code = event_controller.search_user_event(request.data['uid'])
    return JsonResponse(response, status=status_code)


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
            response, status_code = event_controller.get_single_event(event_id)
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
    request_obj = request_callback_model.request_callback_model_from_dict(request.data)
    response, status_code = request_controller.request_callback(request_obj)
    return JsonResponse(response, status=status_code)


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
def get_greeting_cards(request):
    token = request.headers.get('Authorization').split(' ')[1]
    try:
        decoded_token = jwt.decode(token, 'secret_key', algorithms=['HS256'])
        username = decoded_token['username']
        if username == request.data.get('uid'):
            response, status_code = greeting_cards_controller.get_greeting_cards()
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
