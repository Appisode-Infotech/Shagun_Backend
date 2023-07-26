import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import GREETING_CARDS, GREETING_CARDS_BY_ID
from Shagun_backend.util.responsegenerator import responseGenerator


def get_greeting_cards():
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = """SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards 
            WHERE status=1"""
            cursor.execute(greeting_cards_query)
            greeting_cards = cursor.fetchall()

            return {
                "status": True,
                "active_greeting_cards": responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_greeting_cards():
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = """SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards"""
            cursor.execute(greeting_cards_query)
            greeting_cards = cursor.fetchall()

            return {
                "status": True,
                "all_greeting_cards": responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_greeting_cards(event_id, estatus):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE greeting_cards SET status = %s WHERE id = %s"
            values = (estatus, event_id)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Greeting card changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def edit_greeting_cards(grt_obj):
    try:
        with connection.cursor() as cursor:
            query = "UPDATE greeting_cards SET card_name = %s, card_image_url = %s, card_price = %s," \
                    " status = %s WHERE id = %s"
            values = (grt_obj.card_name, grt_obj.card_image_url, grt_obj.card_price, grt_obj.status, grt_obj.id)
            cursor.execute(query, values)
            return {
                "status": True,
                "msg": "Greeting card updated successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_greetings_by_id(gre_id):
    try:
        with connection.cursor() as cursor:
            sql_query = f"""SELECT id, card_name FROM greeting_cards WHERE id = '{gre_id}' """
            cursor.execute(sql_query)
            greeting = cursor.fetchone()
            if greeting is not None:
                return {
                      "status": True,
                      "greetings": responsegenerator.responseGenerator.generateResponse(greeting, GREETING_CARDS_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "greeting_card": None
                }, 301

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301