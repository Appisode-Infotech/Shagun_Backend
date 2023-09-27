import pymysql
from django.db import connection

from Shagun_backend.util.constants import *


def request_callback(request_obj):
    try:
        with connection.cursor() as cursor:
            request_query = """ INSERT INTO user_callback_request (uid,type,event_date,event_type,status, created_on)
             VALUES (%s,%s,%s,%s,%s,%s) """
            values = (
            request_obj.uid, request_obj.type, request_obj.event_date, request_obj.event_type, False, getIndianTime(),)
            cursor.execute(request_query, values)
            return {
                "status": True,
                "message": "Row added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def update_callback_request(req_id, cmpltd_by, status):
    try:
        with connection.cursor() as cursor:
            update_request_query = f""" UPDATE  user_callback_request SET status = '{status}', 
            completed_by = '{cmpltd_by}' WHERE id = '{req_id}'  """
            cursor.execute(update_request_query)
            return {
                "status": True,
                "message": "Updated successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
