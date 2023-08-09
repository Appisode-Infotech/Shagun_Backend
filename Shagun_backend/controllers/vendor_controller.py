import pymysql
from django.db import connection


def add_vendor(vendor_obj):
    try:
        with connection.cursor() as cursor:
            add_printer_query = """INSERT INTO delivery_vendors (delivery_vendor_name, city, address, lat_lng, status, 
                                   gst_no, delivery_vendor_owner, contact_number, created_by) 
                                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(add_printer_query, [vendor_obj.delivery_vendor_name, vendor_obj.city, vendor_obj.address,
                                               vendor_obj.lat_lng, vendor_obj.status, vendor_obj.gst_no,
                                               vendor_obj.delivery_vendor_owner, vendor_obj.contact_number, vendor_obj.created_by])
            return {
                "status": True,
                "Vendor": "Vendor added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def enable_disable_vendor(vendor_id, status):
    try:
        with connection.cursor() as cursor:
            disable_query = "UPDATE delivery_vendors SET status = %s WHERE id = %s"
            values = (status, vendor_id)
            cursor.execute(disable_query, values)
            return {
                "status": True,
                "vendor_status": "vendor  status changed successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
