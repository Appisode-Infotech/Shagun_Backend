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
    path('admin/', admin.site.urls),
    path('app_compatibility', app_compatibility, name='app_compatibility'),
    path('check_user', check_user, name='check_user'),
    path('user_register', user_register, name='user_register'),
    path('edit_user', edit_user, name='edit_user'),
    path('activate_deactivate_user', activate_deactivate_user, name='activate_deactivate_user'),
    # path('home', home, name='home'),
    path('add_user_kyc', add_user_kyc, name='add_user_kyc'),
    path('update_user_kyc', update_user_kyc, name='update_user_kyc'),
    path('add_bank_details', add_bank_details, name='add_bank_details'),
    path('update_bank_details', update_bank_details, name='update_bank_details'),
    path('create_event', create_event, name='create_event'),
    path('get_event_list', get_event_list, name='get_event_list'),
    path('get_single_event', get_single_event, name='get_single_event'),
    path('create_events_type', create_events_type, name='create_events_type'),
    path('enable_disable_events_type', enable_disable_events_type, name='enable_disable_events_type'),
    path('add_location', add_location, name='add_location'),
    path('enable_disable_location', enable_disable_location, name='enable_disable_location'),
    path('add_printer', add_printer, name='add_printer'),
    path('enable_disable_printer', enable_disable_printer, name='enable_disable_printer'),
    path('add_transaction_history', add_transaction_history, name='add_transaction_history'),
    path('user_home_page', user_home_page, name='user_home_page'),
    path('gift_sent', gift_sent, name='gift_sent'),
    path('gift_received', gift_received, name='gift_received'),
    path('get_greeting_cards', get_greeting_cards, name='get_greeting_cards'),
    path('track_order', track_order, name='track_order'),

]
