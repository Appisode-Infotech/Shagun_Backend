import json

import jwt
from datetime import datetime, timedelta

from rest_framework.decorators import api_view
from rest_framework.response import Response
from Shagun_backend.controllers import user_controller, event_controller, app_data_controller, store_controller, \
    transactions_controller, user_home_page_controller, greeting_cards_controller
from django.http import JsonResponse

from Shagun_backend.models import registration_model, user_kyc_model, bank_details_model, create_event_model, \
    app_data_model, add_printer_model, transactions_history_model, gifts_sent_model, track_order_model


@api_view(['POST'])
def check_user(request):
    user, status_code = user_controller.check_user_exist(request.data.get('uid'))
    if user['status']:
        token = jwt.encode({'username': user['user']['user_id'], 'exp': datetime.utcnow() + timedelta(minutes=2)},
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
def user_register(request):
    reg_obj = registration_model.registration_model_from_dict(request.data)
    response, status_code = user_controller.user_register(reg_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def edit_user(request):
    edit_reg_obj = registration_model.registration_model_from_dict(request.data)
    response, status_code = user_controller.edit_user(edit_reg_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def activate_deactivate_user(request):
    response, status_code = user_controller.deactivate_user(request.data['uid'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def add_user_kyc(request):
    kyc_obj = user_kyc_model.user_kyc_model_from_dict(request.data)
    response, status_code = user_controller.add_user_kyc(kyc_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def update_user_kyc(request):
    kyc_obj = user_kyc_model.user_kyc_model_from_dict(request.data)
    response, status_code = user_controller.update_user_kyc(kyc_obj)
    # print(response)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def add_bank_details(request):
    bank_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.add_bank_details(bank_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def update_bank_details(request):
    bank_update_obj = bank_details_model.bank_details_model_from_dict(request.data)
    response, status_code = user_controller.update_bank_details(bank_update_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def create_event(request):
    event_obj = create_event_model.create_event_model_from_dict(request.data)
    response, status_code = event_controller.create_event(event_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_event_list(request):
    response, status_code = event_controller.get_event_list(request.data['uid'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_single_event(request):
    uid = request.data['uid']
    event_id = request.data['event_id']
    response, status_code = event_controller.get_single_event(event_id)
    print(response)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def app_compatibility(request):
    uid = request.data['uid']
    app_obj = app_data_model.app_data_model_from_dict(request.data)
    response, status_code = app_data_controller.app_compatibility(app_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def create_events_type(request):
    response, status_code = event_controller.create_events_type(request.data['event_type_name'])
    print(response)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_events_type(request):
    response, status_code = event_controller.disable_events_type(request.data['event_id'], request.data['status'])
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def add_location(request):
    response, status_code = event_controller.add_location(request.data['city_name'])
    print(response)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def enable_disable_location(request):
    response, status_code = event_controller.disable_location(request.data['id'], request.data['status'])
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
def add_transaction_history(request):
    transaction_obj = transactions_history_model.transactions_history_model_from_dict(request.data)
    response, status_code = transactions_controller.add_transaction_history(transaction_obj)
    return JsonResponse(response, status=status_code)


# @api_view(['POST'])
# def add_transaction_history(request):
#     transaction_obj = transactions_history_model.transactions_history_model_from_dict(request.data)
#     response, status_code = transactions_controller.add_transaction_history(transaction_obj)
#     return JsonResponse(response, status=status_code)

@api_view(['POST'])
def user_home_page(request):
    response, status_code = user_home_page_controller.home_page_data(request.data['uid'])
    return JsonResponse(response, status=status_code)

@api_view(['POST'])
def gift_sent(request):
    sent_gift_obj = gifts_sent_model.gifts_sent_model_from_dict(request.data)
    response, status_code = transactions_controller.get_sent_gift(sent_gift_obj)
    return JsonResponse(response, status=status_code)

@api_view(['POST'])
def gift_received(request):
    received_gift_obj = gifts_sent_model.gifts_sent_model_from_dict(request.data)
    response, status_code = transactions_controller.get_received_gift(received_gift_obj)
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def get_greeting_cards(request):
    response, status_code = greeting_cards_controller.get_greeting_cards()
    return JsonResponse(response, status=status_code)


@api_view(['POST'])
def track_order(request):
    track_order_obj = track_order_model.track_order_model_from_dict(request.data)
    response, status_code = transactions_controller.get_track_order(track_order_obj)
    return JsonResponse(response, status=status_code)




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
