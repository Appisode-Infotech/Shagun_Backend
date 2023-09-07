import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *

def printer_login(uname, pwd):
    print(pwd)
    with connection.cursor() as cursor:
        printer_login_query = f"""SELECT id,printer_user_name, printer_password, store_name FROM printer 
                                    WHERE printer_user_name = '{uname}' """
        cursor.execute(printer_login_query)
        result = cursor.fetchone()
        print(result)
        if result is not None and result[2] == pwd:
            return {
                "msg": "Success",
                "username": result[1],
                "pwd": result[2],
                "store_name": result[3],
                "id": result[0],
            }

        if result is not None and result[2] != pwd:
            return {
                "msg": "wrong password",
            }

        else:
            return {
                "msg": "printer not exist, Please contact admin to register",
            }


def add_printer(store_obj):
    try:
        with connection.cursor() as cursor:
            add_printer_query = """INSERT INTO printer (store_name, city, address, email, gst_no, store_owner,
                                 contact_number, printer_user_name, printer_password) 
                                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(add_printer_query, [store_obj.store_name, store_obj.city, store_obj.address,
                                store_obj.email, store_obj.gst_no, store_obj.store_owner, store_obj.contact_number,
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
            edit_printer_query = """UPDATE printer SET store_name = %s, city = %s, address = %s, email = %s, 
                                    gst_no= %s, store_owner= %s, contact_number= %s, printer_user_name= %s, 
                                    printer_password=%s  WHERE id = %s"""
            values = (store_obj.store_name, store_obj.city, store_obj.address, store_obj.email  , store_obj.gst_no,
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
            LEFT JOIN locations AS l ON p.city = l.id WHERE p.status LIKE '{status}' ORDER BY p.id DESC """
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
            OR contact_number LIKE '%{search}%' OR printer_user_name LIKE '%{search}%' ) ORDER BY p.id DESC"""
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
            LEFT JOIN locations AS l ON p.city = l.id WHERE p.status = '{status}' ORDER BY p.id DESC"""
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

    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status IN ({status_values_str}) ORDER BY pj.created_on DESC """
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
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


def search_all_jobs(status, search):
    status_values_str = ', '.join(str(status_value) for status_value in status)
    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" 
            SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status IN ({status_values_str}) AND  ( pj.event_id LIKE '%{search}%' OR 
            pj.printer_id LIKE '%{search}%' OR gc.card_name LIKE '%{search}%' OR p.store_name LIKE '%{search}%') 
            ORDER BY pj.created_on DESC"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
            print(get_all_jobs_query)
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

def printer_search_all_jobs(status, search, pid):
    status_values_str = ', '.join(str(status_value) for status_value in status)
    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" 
            SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status IN ({status_values_str}) AND pj.printer_id = '{pid}' AND ( pj.event_id LIKE '%{search}%' OR 
            pj.printer_id LIKE '%{search}%' OR gc.card_name LIKE '%{search}%' OR p.store_name LIKE '%{search}%') 
            ORDER BY pj.created_on DESC"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
            print(get_all_jobs_query)
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


def filter_all_jobs(status):
    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" 
            SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status = '{status}' ORDER BY pj.created_on DESC"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
            print(get_all_jobs_query)
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


def printer_filter_jobs(status, pid):
    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" 
            SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.status = '{status}' AND pj.printer_id = '{pid}' ORDER BY pj.created_on DESC"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
            print(get_all_jobs_query)
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


def get_printers_jobs(pid, status):
    status_values_str = ', '.join(str(status_value) for status_value in status)
    try:
        with connection.cursor() as cursor:
            get_all_jobs_query = f""" SELECT pj.*, p.store_name, et.event_type_name, gc.card_name, gc.card_image_url,
            gc.card_price, e.event_date FROM print_jobs AS pj
            LEFT JOIN printer AS p ON pj.printer_id = p.id
            LEFT JOIN event AS e ON pj.event_id = e.id
            LEFT JOIN events_type AS et ON e.event_type_id = et.id
            LEFT JOIN greeting_cards AS gc ON pj.card_id = gc.id
            WHERE pj.printer_id = '{pid}' AND pj.status IN ({status_values_str}) ORDER BY pj.created_on DESC"""
            cursor.execute(get_all_jobs_query)
            jobs = cursor.fetchall()
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


def change_print_jobs_status(pjid, status):
    try:
        with connection.cursor() as cursor:
            query = f"""UPDATE print_jobs SET status = '{status}' WHERE id = '{pjid}' """
            cursor.execute(query)
            return {
                "status": True,
                "message": "Printer job status updated successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def printer_dashboard(pid):
    try:
        with connection.cursor() as cursor:
            transaction_stats_query = f"""
                                    SELECT 
                                        SUM(CASE WHEN `status` IN (1, 2, 3, 4, 5) THEN `billing_amount` ELSE 0 END) AS total_amount,
                                        SUM(CASE WHEN `status` = 5 THEN `billing_amount` ELSE 0 END) AS work_done_amount,
                                        SUM(CASE WHEN `status` IN (2, 3, 4) THEN `billing_amount` ELSE 0 END) AS in_progress_amount,
                                        SUM(CASE WHEN `status` = 1 THEN `billing_amount` ELSE 0 END) AS new_amount
                                    FROM 
                                        print_jobs
                                    WHERE printer_id = '{pid}'
                                    """
            cursor.execute(transaction_stats_query)
            transaction_stats = cursor.fetchone()
            event_stats_query = f"""
                SELECT 
                    COUNT(*) AS total_events,
                    CAST(SUM(DATE(event_date) = '{today.date()}') AS SIGNED) AS events_created_today
                FROM event;
                """
            cursor.execute(event_stats_query)
            event_stats = cursor.fetchone()

            today_events_query = f"""
                            SELECT event.event_date, event.event_admin, et.event_type_name, event.id,
                            event.is_approved, event.status FROM event
                            LEFT JOIN events_type AS et ON event.event_type_id = et.id
                             WHERE DATE(event_date) = '{today.date()}' ORDER BY event.created_on DESC;
                            """
            cursor.execute(today_events_query)
            today_event_stats = cursor.fetchall()

            jobs_sql = f"""
                    SELECT
                        SUM(CASE WHEN `status` = 1 THEN 1 ELSE 0 END) AS new_count,
                        SUM(CASE WHEN `status` IN (2, 3, 4) THEN 1 ELSE 0 END) AS in_progress_count,
                        SUM(CASE WHEN `status` = 5 THEN 1 ELSE 0 END) AS completed_count,
                        COUNT(*) AS total_jobs
                    FROM
                        print_jobs
                    WHERE
                        printer_id = '{pid}'
                    """

            cursor.execute(jobs_sql)
            job_stats = cursor.fetchone()

            events_sql = """
                        SELECT
                            SUM(CASE WHEN is_approved = 0 THEN 1 ELSE 0 END) AS pending_events,
                            SUM(CASE WHEN is_approved = 1 THEN 1 ELSE 0 END) AS approved_events,
                            SUM(CASE WHEN is_approved = 2 THEN 1 ELSE 0 END) AS rejected_events,
                            COUNT(*) AS total_events
                        FROM
                            event
                        """
            cursor.execute(events_sql)
            events_stat = cursor.fetchone()

            vendors_sql = """
                        SELECT
                            (SELECT COUNT(*) FROM printer WHERE status = 1) AS active_printers,
                            (SELECT COUNT(*) FROM printer WHERE status = 0) AS inactive_printers,
                            (SELECT COUNT(*) FROM delivery_vendors WHERE status = 1) AS active_delivery_vendors,
                            (SELECT COUNT(*) FROM delivery_vendors WHERE status = 0) AS inactive_delivery_vendors;
                        """
            cursor.execute(vendors_sql)
            vendors_stat = cursor.fetchone()

            return {
                "status": True,
                "total_amount": round(transaction_stats[0], 2),
                "work_done_amount": round(transaction_stats[1], 2),
                "in_progress_amount": round(transaction_stats[2], 2),
                "new_amount": round(transaction_stats[3], 2),
                # "today_created_events": event_stats[1],
                # "events": responsegenerator.responseGenerator.generateResponse(today_event_stats, EVENT_LIST),
                "new_jobs": job_stats[0],
                "open_jobs": job_stats[1],
                "completed": job_stats[2],
                "total_jobs": job_stats[3],
                # "pending_events": events_stat[0],
                # "approved_events": events_stat[1],
                # "rejected_events": events_stat[2],
                # "total_events": events_stat[3],
                # "active_printers": vendors_stat[0],
                # "inactive_printers": vendors_stat[1],
                # "active_delivery_vendors": vendors_stat[2],
                # "inactive_delivery_vendors": vendors_stat[3]

            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
