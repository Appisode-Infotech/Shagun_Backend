import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *


def add_printer(store_obj):
    try:
        with connection.cursor() as cursor:
            add_printer_query = """INSERT INTO printer (store_name, city, address, lat_lng, gst_no, store_owner,
                                 contact_number, printer_user_name, printer_password) 
                                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(add_printer_query, [store_obj.store_name, store_obj.city, store_obj.address, store_obj.lat_lng,
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


def edit_printer(store_obj):
    try:
        with connection.cursor() as cursor:
            edit_printer_query = """UPDATE printer SET store_name = %s, city = %s, address = %s, lat_lng = %s, 
                                    gst_no= %s, store_owner= %s, contact_number= %s, printer_user_name= %s, 
                                    printer_password=%s  WHERE id = %s"""
            values = (store_obj.store_name, store_obj.city, store_obj.address, store_obj.lat_lng, store_obj.gst_no,
                      store_obj.store_owner, store_obj.contact_number, store_obj.printer_user_name,
                      store_obj.printer_password, store_obj.store_id)
            cursor.execute(edit_printer_query, values)
            return {
                "status": True,
                "message": "Printer edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def get_printer_by_id(pid):
    try:
        with connection.cursor() as cursor:
            printer_by_id_query = f""" SELECT p.*, loc.city_name FROM printer AS p LEFT JOIN locations AS loc 
                                        ON p.city = loc.id WHERE p.id = '{pid}'"""
            cursor.execute(printer_by_id_query)
            printer = cursor.fetchone()
            if printer is not None:
                return {
                      "status": True,
                      "store": responsegenerator.responseGenerator.generateResponse(printer, PRINTER_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "Printer": None
                }, 301
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_printers_by_status(status):
    try:
        with connection.cursor() as cursor:
            printers_data_query = f""" SELECT p.id, p.store_name, l.city_name, p.address, p.status, p.gst_no, 
            p.store_owner, p.contact_number FROM printer AS p
            LEFT JOIN locations AS l ON p.city = l.id WHERE p.status LIKE '{status}'"""
            cursor.execute(printers_data_query)
            printer_data = cursor.fetchall()
            return {
                "status": True,
                "printer_data": responsegenerator.responseGenerator.generateResponse(printer_data, ALL_PRINTERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def dashboard_search_printers(search):
    try:
        with connection.cursor() as cursor:
            printers_data_query = f""" SELECT p.id, p.store_name, l.city_name, p.address, p.status, p.gst_no, 
            p.store_owner, p.contact_number FROM printer AS p
            LEFT JOIN locations AS l ON p.city = l.id 
            WHERE (p.id LIKE '%{search}%' OR store_name LIKE '%{search}%' OR store_owner LIKE '%{search}%'
            OR contact_number LIKE '%{search}%' OR printer_user_name LIKE '%{search}%' )"""
            cursor.execute(printers_data_query)
            printer_data = cursor.fetchall()
            print(printer_data)
            return {
                "status": True,
                "printer_data": responsegenerator.responseGenerator.generateResponse(printer_data, ALL_PRINTERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def dashboard_search_printers_status(status):
    try:
        with connection.cursor() as cursor:
            printers_status_query = f""" SELECT p.id, p.store_name, l.city_name, p.address, p.status, p.gst_no, 
            p.store_owner, p.contact_number FROM printer AS p
            LEFT JOIN locations AS l ON p.city = l.id WHERE p.status = '{status}'"""
            cursor.execute(printers_status_query)
            printer_data = cursor.fetchall()
            print(printer_data)
            return {
                "status": True,
                "printer_data": responsegenerator.responseGenerator.generateResponse(printer_data, ALL_PRINTERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def get_all_jobs(status):
    status_values_str = ', '.join(str(status_value) for status_value in status)
    print(status_values_str)

    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status IN ({status_values_str})"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
            print(jobs)
            if jobs is not None:
                return {
                      "status": True,
                      "jobs": responsegenerator.responseGenerator.generateResponse(jobs, ALL_JOBS)
                }, 200
            else:
                return {
                    "status": False,
                    "jobs": None
                }, 301
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
