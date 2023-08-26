import json

import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def get_all_banks_list():
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM bank_list"
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


def add_bank_list(bank_name, bank_logo):
    try:
        with connection.cursor() as cursor:
            bank_list_query = """INSERT INTO bank_list (bank_name, bank_logo) VALUES (%s, %s )"""
            cursor.execute(bank_list_query, (bank_name, bank_logo))
            return {
                "status": True,
                "message": "Bank List added successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def activate_deactivate_bank_list(bank_id, status):
    try:
        with connection.cursor() as cursor:
            query = f"""UPDATE print_jobs SET status = '{status}' WHERE id = '{id}' """
            cursor.execute(query)
            return {
                "status": True,
                "message": "Bank status updated successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301



