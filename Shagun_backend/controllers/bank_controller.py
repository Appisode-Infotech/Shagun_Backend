import json

import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def get_all_banks_list():
    try:
        with connection.cursor() as cursor:
            query = """SELECT b.*, creator.name, updator.name FROM bank_list AS b
                        LEFT JOIN users AS creator ON b.created_by = creator.uid
                        LEFT JOIN users AS updator ON b.updated_by = updator.uid"""
            cursor.execute(query)
            bank_list = cursor.fetchall()
            return {
                "status": True,
                "bank_list": responsegenerator.responseGenerator.generateResponse(bank_list, BANK_LISTS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_active_banks_list():
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM bank_list WHERE status = 1 "
            cursor.execute(query)
            bank_list = cursor.fetchall()
            return {
                "status": True,
                "bank_list": responsegenerator.responseGenerator.generateResponse(bank_list, BANK_LISTS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def activate_deactivate_bank_list(bank_id, status):
    try:
        with connection.cursor() as cursor:
            query = f"""UPDATE bank_list SET status = '{status}' WHERE id = '{bank_id}' """
            cursor.execute(query)
            return {
                "status": True,
                "message": "Bank status updated successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_bank_list(bank_name, created_by, updated_by):
    try:
        with connection.cursor() as cursor:
            add_location_query = """INSERT INTO bank_list (bank_name, status, created_by, created_on, updated_by, updated_on) 
                                    VALUES (%s, %s, %s, %s, %s, %s)"""
            values = (bank_name, True, created_by, getIndianTime(), updated_by, getIndianTime())
            cursor.execute(add_location_query, values)
            return {
                "status": True,
                "message": "bank added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_bank_list(bid, name, updated_by):
    try:
        with connection.cursor() as cursor:
            update_location_query = """UPDATE bank_list 
                                      SET bank_name = %s, updated_by = %s, updated_on = %s 
                                      WHERE id = %s"""
            values = (name, updated_by, getIndianTime(), bid)
            cursor.execute(update_location_query, values)
            return {
                "status": True,
                "message": "bank added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
