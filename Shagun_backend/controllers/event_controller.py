import pymysql
from django.db import connection
from datetime import datetime
import json

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import EVENT_LIST, SINGLE_EVENT, ALL_EVENT_TYPE_LIST, ALL_LOCATION_LIST, \
    EVENT_TYPE_LIST
from Shagun_backend.util.responsegenerator import responseGenerator


def create_event(event_obj):
    try:
        with connection.cursor() as cursor:
            sub_events_json = json.dumps([sub_event.__dict__ for sub_event in event_obj.sub_events])
            event_admin_json = json.dumps([event_admins.__dict__ for event_admins in event_obj.event_admin])
            sql_query = "INSERT INTO event (created_by_uid, event_type_id, city_id, address_line1, address_line2, " \
                        "event_lat_lng, created_on, sub_events, event_date, event_note, event_admin, is_approved, " \
                        " active) " \
                        "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (event_obj.created_by_uid, event_obj.event_type_id, event_obj.city_id, event_obj.address_line1,
                      event_obj.address_line2, event_obj.event_lat_lng, datetime.now(), sub_events_json,
                      event_obj.event_date, event_obj.event_note, event_admin_json, False, True)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Event Created successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def enable_disable_event(e_id, etstatus):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE event SET status = %s WHERE id = %s"
            values = (etstatus, e_id)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Event Status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def get_event_list(uid):
    try:
        with connection.cursor() as cursor:
            sql_query = "SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id," \
                        "event.is_approved, event.status FROM event JOIN events_type ON " \
                        "event.event_type_id = events_type.id"
            cursor.execute(sql_query)
            events = cursor.fetchall()
            return {
                "status": True,
                "event_list": responsegenerator.responseGenerator.generateResponse(events, EVENT_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_single_event(event_id):
    try:
        with connection.cursor() as cursor:
            sql_query = "SELECT event.event_date, event.event_admin, event.event_note, event.address_line1, " \
                        "event.address_line2, event.event_lat_lng, event.sub_events, events_type.event_type_name  " \
                        "FROM event JOIN events_type ON event.event_type_id = events_type.id WHERE event.id = %s"
            cursor.execute(sql_query, (event_id,))
            events = cursor.fetchone()
            return {
                "status": True,
                "msg": responsegenerator.responseGenerator.generateResponse(events, SINGLE_EVENT)
            }, 200
            # return responsegenerator.responseGenerator.generateResponse(events, SINGLE_EVENT), 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def create_events_type(event_name):
    try:
        with connection.cursor() as cursor:
            sql_query = "INSERT INTO events_type (event_type_name, status) VALUES (%s,%s)"
            values = (event_name, True)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Event Type added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_events_type(event_id, estatus):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE events_type SET status = %s WHERE id = %s"
            values = (estatus, event_id)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Event Type changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_events_type(lid, event_type_name):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE events_type SET event_type_name = %s where id=%s"
            values = (event_type_name, lid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Events Type edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_event_type_list_for_user():
    try:
        with connection.cursor() as cursor:
            event_type_list_query = """SELECT * FROM events_type WHERE status=1"""
            cursor.execute(event_type_list_query)
            event_type_list = cursor.fetchall()
            print(event_type_list_query)

            return {
                "status": True,
                "event_type_list": responseGenerator.generateResponse(event_type_list, EVENT_TYPE_LIST)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_location(city_name):
    try:
        with connection.cursor() as cursor:
            sql_query = "INSERT INTO locations (city_name, status) VALUES (%s,%s)"
            values = (city_name, True)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "location added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_location(location_id, lstatus):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE locations SET status = %s WHERE id = %s"
            values = (lstatus, location_id)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Location status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_location(lid, lcity_name):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE locations SET city_name = %s where id=%s"
            values = (lcity_name, lid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Location edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_event_type_list_for_admin():
    try:
        with connection.cursor() as cursor:
            sql_query = "SELECT id, event_type_name, status FROM events_type"
            cursor.execute(sql_query)
            events = cursor.fetchall()
            print(events)
            return {
                "status": True,
                "events_type": responsegenerator.responseGenerator.generateResponse(events, ALL_EVENT_TYPE_LIST)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_locations_list():
    try:
        with connection.cursor() as cursor:
            sql_query = "SELECT id, city_name, status FROM locations"
            cursor.execute(sql_query)
            events = cursor.fetchall()
            return {
                "status": True,
                "locations": responsegenerator.responseGenerator.generateResponse(events, ALL_LOCATION_LIST)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301