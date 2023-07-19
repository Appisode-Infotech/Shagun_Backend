import jwt
from datetime import datetime, timedelta

from django.shortcuts import redirect, render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse

from Shagun_backend.controllers import user_controller, event_controller, app_data_controller, store_controller, \
    transactions_controller, user_home_page_controller, greeting_cards_controller
from Shagun_backend.models import registration_model, user_kyc_model, bank_details_model, create_event_model, \
    app_data_model, add_printer_model, transactions_history_model, track_order_model, employee_model


def admin_dashboard(request):
    return render(request, 'index.html')


def manage_event(request):
    response, status_code = event_controller.get_event_list('qwertyuiojhgfd56')
    context = {
        'events': response
    }
    return render(request, 'template/pages/tables/events.html', context)


def manage_event_types(request):
    response, status_code = event_controller.get_event_type_list_for_admin()
    context = {
        'events': response
    }
    return render(request, 'template/pages/tables/event_type.html', context)


def manage_location(request):
    response, status_code = event_controller.get_locations_list()
    context = {
        'locations_list': response
    }
    return render(request, 'template/pages/tables/location.html', context)


def manage_kyc(request):
    response, status_code = user_controller.get_kyc_data()
    context = {
        'kyc': response
    }
    return render(request, 'template/pages/tables/kyc.html', context)


def manage_bank_details(request):
    response, status_code = user_controller.get_all_bank_data()
    print(response)
    context = {
        'bank': response
    }
    return render(request, 'template/pages/tables/bank_details.html', context)


def manage_greeting_cards(request):
    response, status_code = greeting_cards_controller.get_all_greeting_cards()
    print(response)
    context = {
        'greeting': response
    }
    return render(request, 'template/pages/tables/greeting_cards.html', context)


def manage_users(request):
    response, status_code = user_controller.get_all_users()
    print(response)
    context = {
        'users': response
    }
    return render(request, 'template/pages/tables/users.html', context)


def manage_employee(request):
    response, status_code = user_controller.get_all_employees()
    print(response)
    context = {
        'users': response
    }
    return render(request, 'template/pages/tables/employees.html', context)


@api_view(['POST'])
def add_employee(request):
    emp_obj = employee_model.add_employee_model_from_dict(request.data)
    response, status_code = user_controller.add_employee(emp_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_employee(request):
    response, status_code = user_controller.enable_disable_employee(request.data['uid'], request.data['status'])
    return JsonResponse(response, status=status_code)


def manage_printers(request):
    response, status_code = store_controller.get_all_printers()
    context = {
        'printers': response
    }
    return render(request, 'template/pages/tables/printers.html', context)












# This API ensure that all Shagun app users are using compatible versions of the application, promoting a consistent
# and seamless user experience while maintaining the ability to leverage the latest features and enhancements.
@api_view(['POST'])
def app_compatibility(request):
    app_obj = app_data_model.app_data_model_from_dict(request.data)
    response, status_code = app_data_controller.app_compatibility(app_obj)
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


# This API allows new users to register in the Shagun app. It handles the registration process, validating
# user-provided information, and creating a new user account in the backend database.
@api_view(['POST'])
def user_register(request):
    print(request.data)
    reg_obj = registration_model.registration_model_from_dict(request.data)
    user, status_code = user_controller.user_register(reg_obj)
    print(user)
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
def update_bank_details(request):
    bank_update_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.update_bank_details(bank_update_obj)
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
@api_view(['POST'])
def get_event_list(request):
    response, status_code = event_controller.get_event_list(request.data['uid'])
    return JsonResponse(response, status=status_code)



@api_view(['POST'])
def get_my_event_list(request):
    response, status_code = event_controller.get_my_event_list(request.data['uid'])
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
def create_events_type(request):
    response, status_code = event_controller.create_events_type(request.data['event_type_name'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_events_type(request):
    response, status_code = event_controller.disable_events_type(request.data['event_id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def edit_events_type(request):
    response, status_code = event_controller.edit_events_type(request.data['event_type_name'], request.data['id'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_event_type_list(request):
    response, status_code = event_controller.get_event_type_list_for_user()
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def add_location(request):
    response, status_code = event_controller.add_location(request.data['city_name'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_location(request):
    response, status_code = event_controller.disable_location(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def edit_location(request):
    response, status_code = event_controller.edit_location(request.data['id'], request.data['city_name'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def add_printer(request):
    store_obj = add_printer_model.add_printer_model_from_dict(request.data)
    response, status_code = store_controller.add_printer(store_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_printer(request):
    response, status_code = store_controller.disable_printer(request.data['id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def edit_printer(request):
    store_obj = add_printer_model.add_printer_model_from_dict(request.data)
    response, status_code = store_controller.edit_printer(store_obj)
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
            response, status_code = transactions_controller.get_sent_gift(request.data['uid'])
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
            response, status_code = transactions_controller.get_received_gift(request.data['uid'])
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
