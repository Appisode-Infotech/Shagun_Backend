import pymysql
from django.db import connection
import json

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def create_event(event_obj):
    try:
        with connection.cursor() as cursor:
            sub_events_json = json.dumps([sub_event.__dict__ for sub_event in event_obj.sub_events])
            event_admin_json = json.dumps([event_admins.__dict__ for event_admins in event_obj.event_admin])
            create_event_query = "INSERT INTO event (created_by_uid, event_type_id, city_id, address_line1, " \
                                 "address_line2, event_lat_lng, created_on, sub_events, event_date," \
                                 "event_note, event_admin, is_approved,  status, printer_id) " \
                                 "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (event_obj.created_by_uid, event_obj.event_type_id, event_obj.city_id, event_obj.address_line1,
                      event_obj.address_line2, event_obj.event_lat_lng, today, sub_events_json,
                      event_obj.event_date, event_obj.event_note, event_admin_json, False, True, event_obj.printer_id)
            cursor.execute(create_event_query, values)
            return {
                "status": True,
                "message": "Event Created successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_event(event_obj, event_id):
    try:
        with connection.cursor() as cursor:
            sub_events_json = json.dumps([sub_event.__dict__ for sub_event in event_obj.sub_events])
            event_admin_json = json.dumps([event_admins.__dict__ for event_admins in event_obj.event_admin])
            update_event_query = """
                        UPDATE event
                        SET
                            event_type_id = %s,
                            city_id = %s,
                            printer_id = %s,
                            address_line1 = %s,
                            address_line2 = %s,
                            event_lat_lng = %s,
                            sub_events = %s,
                            event_date = %s,
                            event_note = %s,
                            event_admin = %s
                        WHERE
                            id = %s
                    """

            # Assuming you have the event_obj, sub_events_json, and event_admin_json available
            values = (
                event_obj.event_type_id, event_obj.city_id, event_obj.printer_id,
                event_obj.address_line1, event_obj.address_line2, event_obj.event_lat_lng,
                sub_events_json, event_obj.event_date, event_obj.event_note,
                event_admin_json, event_id
            )
            cursor.execute(update_event_query, values)
            return {
                "status": True,
                "message": "Event Created successfully"
            }, 200

    except pymysql.Error as e:
        print(str(e))
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        print(str(e))
        return {"status": False, "message": str(e)}, 301


def enable_disable_event(e_id, et_status):
    try:
        with connection.cursor() as cursor:
            disable_event_query = "UPDATE event SET status = %s WHERE id = %s"
            values = (et_status, e_id)
            cursor.execute(disable_event_query, values)
            return {
                "status": True,
                "message": "Event Status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_event_by_id(et_id):
    try:
        with connection.cursor() as cursor:
            get_event_query = f""" SELECT e.*, et.event_type_name,
            l.city_name, p.store_name FROM event e
            LEFT JOIN events_type et ON e.event_type_id = et.id
            LEFT JOIN locations l ON e.city_id = l.id
            LEFT JOIN printer p ON e.printer_id = p.id;
            WHERE id = '{et_id}'"""
            cursor.execute(get_event_query)
            event = cursor.fetchone()
            print(event)
            if event is not None:
                print(event)
                return {
                    "status": True,
                    "event_data": responsegenerator.responseGenerator.generateResponse(event, EVENT_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "event": None
                }, 301

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_active_event(status):
    try:
        with connection.cursor() as cursor:
            event_settlement_query = f"""
                    SELECT e.* ,
                      IFNULL(SUM(th.shagun_amount), 0) AS total_received_amount,
                      IFNULL(SUM(CASE WHEN s.transaction_id IS NULL THEN th.shagun_amount ELSE 0 END), 0) AS total_shagun_amount,
                      IFNULL(SUM(CASE WHEN s.transaction_id IS NOT NULL THEN th.shagun_amount ELSE 0 END), 0) AS settled_amount
                    FROM event e
                    LEFT JOIN transaction_history th ON e.id = th.event_id
                    LEFT JOIN settlements s ON th.id = s.transaction_id
                    WHERE DATE(e.event_date) >= '{today.date()}' AND e.status = '{1}'
                    GROUP BY e.id, e.event_date;
                    """
            cursor.execute(event_settlement_query)
            amount = cursor.fetchall()
            return {
                "status": True,
                # "msg": amount
                "active_event": responsegenerator.responseGenerator.generateResponse(amount, ACTIVE_EVENT)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def gift_event(e_id, phone):
    try:
        with connection.cursor() as cursor:
            gift_event_query = f""" SELECT * , (SELECT uid FROM users WHERE phone = '{phone}') AS users FROM event 
            WHERE id = '{e_id}'"""
            cursor.execute(gift_event_query)
            event = cursor.fetchone()
            if event is not None:
                print(event)
                return {
                    "status": True,
                    "gift_event": responsegenerator.responseGenerator.generateResponse(event, GIFT_EVENT)
                }, 200
            else:
                return {
                    "status": False,
                    "event": None
                }, 301

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_event_list(uid):
    try:
        with connection.cursor() as cursor:
            event_list_query = "SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id," \
                               "event.is_approved, event.status FROM event JOIN events_type ON " \
                               "event.event_type_id = events_type.id"
            cursor.execute(event_list_query)
            events = cursor.fetchall()
            return {
                "status": True,
                "event_list": responsegenerator.responseGenerator.generateResponse(events, EVENT_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_single_event(event_id, phone):
    try:
        with connection.cursor() as cursor:
            single_event_query = f"""SELECT 
                                        event.event_date, event.event_admin, event.event_note, 
                                        event.address_line1, event.address_line2, event.event_lat_lng, 
                                        event.sub_events, events_type.event_type_name, users.uid, users.name , event.id
                                    FROM event
                                    JOIN events_type ON event.event_type_id = events_type.id
                                    LEFT JOIN users ON users.phone = '{phone}'
                                    WHERE event.id = '{event_id}'"""
            cursor.execute(single_event_query)
            events = cursor.fetchone()
            print(responsegenerator.responseGenerator.generateResponse(events, SINGLE_EVENT))
            return {
                "status": True,
                "event": responsegenerator.responseGenerator.generateResponse(events, SINGLE_EVENT)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def create_events_type(event_name, created_by):
    try:
        with connection.cursor() as cursor:
            events_type_query = "INSERT INTO events_type (event_type_name, status,created_by) VALUES (%s,%s,%s)"
            values = (event_name, True, created_by)
            cursor.execute(events_type_query, values)
            return {
                "status": True,
                "message": "Event Type added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_events_type(event_id, e_status):
    try:
        with connection.cursor() as cursor:
            disable_events_type_query = "UPDATE events_type SET status = %s WHERE id = %s"
            values = (e_status, event_id)
            cursor.execute(disable_events_type_query, values)
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
            edit_query = f"""UPDATE events_type SET event_type_name = '{event_type_name}' where id= '{lid}'"""
            cursor.execute(edit_query)
            return {
                "status": True,
                "message": "Events Type edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def events_type_by_id(et_id):
    try:
        with connection.cursor() as cursor:
            events_type_query = " SELECT id, event_type_name FROM events_type WHERE id= %s;"
            cursor.execute(events_type_query, [et_id, ])
            events = cursor.fetchone()
            if events is not None:
                return {
                    "status": True,
                    "event_type": responsegenerator.responseGenerator.generateResponse(events, EVENT_TYPE_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "event_type": None
                }, 301

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

            return {
                "status": True,
                "event_type_list": responseGenerator.generateResponse(event_type_list, EVENT_TYPE_LIST)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_location(city_name, created_by):
    try:
        with connection.cursor() as cursor:
            add_location_query = "INSERT INTO locations (city_name, status, created_by) VALUES (%s,%s, %s)"
            values = (city_name, True, created_by)
            cursor.execute(add_location_query, values)
            return {
                "status": True,
                "message": "location added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_location(location_id, loc_status):
    try:
        with connection.cursor() as cursor:
            disable_loc_query = "UPDATE locations SET status = %s WHERE id = %s"
            values = (loc_status, location_id)
            cursor.execute(disable_loc_query, values)
            return {
                "status": True,
                "message": "Location status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_location(lid, city_name):
    try:
        with connection.cursor() as cursor:
            edit_location_query = f"""UPDATE locations SET city_name = '{city_name}' where id= '{lid}' """
            cursor.execute(edit_location_query)
            return {
                "status": True,
                "message": "Location edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_location_by_id(loc_id):
    try:
        with connection.cursor() as cursor:
            get_location_query = " SELECT id, city_name FROM locations WHERE id=%s;"
            cursor.execute(get_location_query, [loc_id])
            location = cursor.fetchone()
            if location is not None:
                return {
                    "status": True,
                    "location": responsegenerator.responseGenerator.generateResponse(location, EVENT_TYPE_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "location": None
                }, 301

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_event_type_list_for_admin():
    try:
        with connection.cursor() as cursor:
            event_type_for_admin_query = "SELECT id, event_type_name, status FROM events_type"
            cursor.execute(event_type_for_admin_query)
            events = cursor.fetchall()
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
            location_list_query = "SELECT id, city_name, status FROM locations"
            cursor.execute(location_list_query)
            events = cursor.fetchall()
            return {
                "status": True,
                "locations": responsegenerator.responseGenerator.generateResponse(events, ALL_LOCATION_LIST)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_my_event_list(uid):
    try:
        with connection.cursor() as cursor:
            phone_query = f"""SELECT phone FROM users WHERE uid = '{uid}'"""
            cursor.execute(phone_query)
            phone = cursor.fetchone()[0]
            # SQL query for events with event_date less than or equal to today
            sql_query_past_events = sql_query_upcoming_events = f"""
                    SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id, 
                        event.is_approved, event.status,
                        total_amount.shagun_amount AS total_amount,
                        sender_count.sender_uid_count AS sender_count
                    FROM event
                    LEFT OUTER JOIN events_type ON event.event_type_id = events_type.id
                    LEFT OUTER JOIN (
                        SELECT event_id, SUM(shagun_amount) AS shagun_amount
                        FROM transaction_history
                        GROUP BY event_id
                    ) AS total_amount ON event.id = total_amount.event_id
                    LEFT OUTER JOIN (
                        SELECT event_id, COUNT(DISTINCT sender_uid) AS sender_uid_count
                        FROM transaction_history
                        GROUP BY event_id
                    ) AS sender_count ON event.id = sender_count.event_id
                    WHERE JSON_CONTAINS(event_admin, %(uid_json)s) AND DATE(event.event_date) < '{today.date()}'
                    AND event.is_approved = 1
                """

            # SQL query for events with event_date greater than today
            sql_query_upcoming_events = f"""
                        SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id, 
                            event.is_approved, event.status,
                            total_amount.shagun_amount AS total_amount,
                            sender_count.sender_uid_count AS sender_count
                        FROM event 
                        LEFT OUTER JOIN events_type ON event.event_type_id = events_type.id 
                        LEFT OUTER JOIN (
                            SELECT event_id, SUM(shagun_amount) AS shagun_amount
                            FROM transaction_history
                            GROUP BY event_id
                        ) AS total_amount ON event.id = total_amount.event_id
                        LEFT OUTER JOIN (
                            SELECT event_id, COUNT(DISTINCT sender_uid) AS sender_uid_count
                            FROM transaction_history
                            GROUP BY event_id
                        ) AS sender_count ON event.id = sender_count.event_id
                        WHERE JSON_CONTAINS(event_admin, %(uid_json)s) AND DATE(event.event_date) >= '{today.date()}'
                        AND event.is_approved = 1
                    """

            # UID JSON data
            uid_json = json.dumps({'uid': uid})

            # Execute the first query for past events
            cursor.execute(sql_query_past_events, {'uid_json': uid_json})
            past_events = cursor.fetchall()
            print(past_events, "past")

            # Execute the second query for upcoming events
            cursor.execute(sql_query_upcoming_events, {'uid_json': uid_json})
            upcoming_events = cursor.fetchall()
            print(upcoming_events, "upcoming")

            invited_events_query = f"""
                            SELECT et.event_type_name, e.event_date, e.event_admin, e.id, egi.status
                            FROM event_guest_invite AS egi
                            JOIN users AS u ON u.phone = egi.invited_to
                            JOIN event AS e ON egi.event_id = e.id
                            JOIN events_type AS et ON e.event_type_id = et.id
                            WHERE egi.invited_to = '{phone}' ORDER BY egi.created_at DESC
                            LIMIT 5
                        """
            cursor.execute(invited_events_query)
            invited_events = cursor.fetchall()

            event_type_list_query = """SELECT * FROM events_type WHERE status=1"""
            cursor.execute(event_type_list_query)
            event_type_list = cursor.fetchall()

            return {
                "status": True,
                "past_events": responsegenerator.responseGenerator.generateResponse(past_events, EVENT_LIST),
                "upcoming_events": responsegenerator.responseGenerator.generateResponse(upcoming_events, EVENT_LIST),
                "invited_events": responsegenerator.responseGenerator.generateResponse(invited_events,
                                                                                       INVITED_EVENT_LIST),
                "event_type_list": responseGenerator.generateResponse(event_type_list, EVENT_TYPE_LIST)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def search_user_event(uid):
    try:
        with connection.cursor() as cursor:
            sql_query_upcoming_events = f"""
                        SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id, 
                            event.is_approved, event.status, (SELECT phone FROM users WHERE uid = '{uid}') AS users
                        FROM event 
                        LEFT JOIN events_type ON event.event_type_id = events_type.id
                        
                        WHERE JSON_CONTAINS(event_admin, %(uid_json)s) AND DATE(event.event_date) >= '{today.date()}' 
                        AND status = 1"""
            uid_json = json.dumps({'uid': uid})
            cursor.execute(sql_query_upcoming_events, {'uid_json': uid_json})
            upcoming_events = cursor.fetchall()

            return {
                "status": True,
                "upcoming_events": responsegenerator.responseGenerator.generateResponse(upcoming_events,
                                                                                        SEARCH_EVENT_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_event_list():
    try:
        with connection.cursor() as cursor:
            event_list_query = "SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id," \
                               "event.is_approved, event.status FROM event JOIN events_type ON " \
                               "event.event_type_id = events_type.id"
            cursor.execute(event_list_query)
            events = cursor.fetchall()
            return {
                "status": True,
                "event_list": responsegenerator.responseGenerator.generateResponse(events, ALL_EVENT_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_active_events():
    try:
        with connection.cursor() as cursor:
            active_events_query = f"""SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id, 
            event.is_approved, event.status  FROM event JOIN events_type ON event.event_type_id = events_type.id 
            WHERE event.status= '{True}' """
            cursor.execute(active_events_query)
            events = cursor.fetchall()
            return {
                "msg": events
            }
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_city_list_for_user():
    try:
        with connection.cursor() as cursor:
            get_location_query = """SELECT * FROM locations WHERE status=1"""
            cursor.execute(get_location_query)
            locations_list = cursor.fetchall()

            return {
                "status": True,
                "city_list": responseGenerator.generateResponse(locations_list, ACTIVE_LOCATIONS_LIST)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def set_event_status(event_id, status):
    try:
        with connection.cursor() as cursor:
            event_status_query = "UPDATE event SET is_approved = %s WHERE id = %s"
            values = (status, event_id)
            cursor.execute(event_status_query, values)
            return {
                "status": True,
                "message": "Event Status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301
