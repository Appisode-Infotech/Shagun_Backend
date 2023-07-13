import pymysql
from django.db import connection
from datetime import datetime
from Shagun_backend.util.constants import CHECK_USER
from Shagun_backend.util.responsegenerator import responseGenerator


def add_printer(store_obj):
    try:
        with connection.cursor() as cursor:
            query = "INSERT INTO printer (store_name, city, address, lat_lng, gst_no, store_owner, contact_number, " \
                    "printer_user_name, printer_password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(query, [store_obj.store_name, store_obj.city, store_obj.address, store_obj.lat_lng,
                                   store_obj.gst_no, store_obj.store_owner, store_obj.contact_number,
                                   store_obj.printer_user_name, store_obj.printer_password])
            return {
                "status": True,
                "user": "store added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def disable_printer(pid, pstatus):
    try:
        with connection.cursor() as cursor:
            disable_query = "UPDATE printer SET status = %s WHERE id = %s"
            values = (pstatus, pid)
            cursor.execute(disable_query, values)
            return {
                "status": True,
                "user": "printer  status changed successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
