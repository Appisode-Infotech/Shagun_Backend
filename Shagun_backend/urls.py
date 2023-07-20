"""Shagun_backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import to include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from Shagun_backend.views import *

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('api/app_compatibility', app_compatibility, name='app_compatibility'),
    # path('api/get_token', get_token, name='get_token'),
    path('api/check_user', check_user, name='check_user'),
    path('api/user_register', user_register, name='user_register'),
    path('api/get_user_profile', get_user_profile, name='get_user_profile'),
    path('api/edit_user', edit_user, name='edit_user'),
    path('api/add_transaction_history', add_transaction_history, name='add_transaction_history'),
    path('api/user_home_page', user_home_page, name='user_home_page'),
    path('api/gift_sent_list', gift_sent_list, name='gift_sent_list'),
    path('api/gift_received_list', gift_received_list, name='gift_received_list'),
    path('api/get_greeting_cards', get_greeting_cards, name='get_greeting_cards'),
    path('api/track_order', track_order, name='track_order'),
    path('api/get_single_event', get_single_event, name='get_single_event'),
    path('api/get_my_event_list', get_my_event_list, name='get_my_event_list'),

    path('', admin_dashboard, name='admin_dashboard'),
    path('sign_up', sign_up, name='sign_up'),
    path('logout', logout, name='logout'),
    path('manage_event', manage_event, name='manage_event'),
    path('add_events', add_events, name='add_events'),
    path('manage_event_types', manage_event_types, name='manage_event_types'),
    path('manage_location', manage_location, name='manage_location'),
    path('manage_kyc', manage_kyc, name='manage_kyc'),
    path('manage_bank_details', manage_bank_details, name='manage_bank_details'),
    path('manage_greeting_cards', manage_greeting_cards, name='manage_greeting_cards'),
    path('manage_users', manage_users, name='manage_users'),
    path('manage_employee', manage_employee, name='manage_employee'),
    path('add_employee', add_employee, name='add_employee'),
    path('enable_disable_employee', enable_disable_employee, name='enable_disable_employee'),
    path('manage_printers', manage_printers, name='manage_printers'),
    path('manage_settlement', manage_settlement, name='manage_settlement'),


    path('activate_deactivate_user', activate_deactivate_user, name='activate_deactivate_user'),
    # path('home', home, name='home'),
    path('add_user_kyc', add_user_kyc, name='add_user_kyc'),
    path('update_user_kyc', update_user_kyc, name='update_user_kyc'),
    path('enable_disable_kyc', enable_disable_kyc, name='enable_disable_kyc'),
    path('add_bank_details', add_bank_details, name='add_bank_details'),
    path('update_bank_details', update_bank_details, name='update_bank_details'),
    path('create_event', create_event, name='create_event'),
    path('enable_disable_event', enable_disable_event, name='enable_disable_event'),
    # path('get_event_list', get_event_list, name='get_event_list'),
    path('create_events_type', create_events_type, name='create_events_type'),
    path('enable_disable_events_type', enable_disable_events_type, name='enable_disable_events_type'),
    path('edit_events_type', edit_events_type, name='edit_events_type'),
    path('get_event_type_list', get_event_type_list, name='get_event_type_list'),
    path('add_location', add_location, name='add_location'),
    path('enable_disable_location', enable_disable_location, name='enable_disable_location'),
    path('edit_location', edit_location, name='edit_location'),
    path('add_printer', add_printer, name='add_printer'),
    path('enable_disable_printer', enable_disable_printer, name='enable_disable_printer'),
    path('edit_printer', edit_printer, name='edit_printer'),

]
