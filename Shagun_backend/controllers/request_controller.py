import pymysql
from django.db import connection

from Shagun_backend.util.constants import *


def request_pullback(uid, req_type):
    try:
        with connection.cursor() as cursor:
            sql_query = """ INSERT INTO users_kyc_event_request (uid,type,status, created_on) VALUES (%s,%s,%s,%s) """
            values = (uid, req_type, False, today)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Row added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
