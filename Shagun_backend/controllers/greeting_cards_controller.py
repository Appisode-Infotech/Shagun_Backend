import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import GREETING_CARDS, GREETING_CARDS_BY_ID, wishes, GETGREETING_CARDS, getIndianTime
from Shagun_backend.util.responsegenerator import responseGenerator

def get_greeting_cards(event_id):
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = f"""
                                    SELECT gc.card_name, gc.card_image_url, gc.card_price, gc.id, gc.status
                                    FROM greeting_cards gc
                                    INNER JOIN event e ON e.printer_id = gc.printer_id AND e.id = '{event_id}'
                                    WHERE gc.status = 1
                                    ORDER BY gc.created_on DESC
                                """
            cursor.execute(greeting_cards_query)
            greeting_cards = cursor.fetchall()

            return {
                "status": True,
                "active_greeting_cards": responseGenerator.generateResponse(greeting_cards, GETGREETING_CARDS),
                "wishes": wishes

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_greeting_cards():
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = f"""SELECT gc.card_name, gc.card_image_url, gc.card_price, gc.id, gc.status, 
                                        p.store_name, creator.name, updator.name, gc.created_on, gc.updated_on 
                                        FROM greeting_cards AS gc
                                        LEFT JOIN users AS creator ON gc.created_by = creator.uid
                                        LEFT JOIN users AS updator ON gc.updated_by = updator.uid
                                        LEFT JOIN printer AS p ON gc.printer_id = p.id
                                        ORDER BY gc.id DESC"""
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

def get_printer_greeting_cards(p_id):
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = f"""SELECT gc.card_name, gc.card_image_url, gc.card_price, gc.id, gc.status, 
                                        p.store_name, creator.name, updator.name, gc.created_on, gc.updated_on 
                                        FROM greeting_cards AS gc
                                        LEFT JOIN users AS creator ON gc.created_by = creator.uid
                                        LEFT JOIN users AS updator ON gc.updated_by = updator.uid
                                        LEFT JOIN printer AS p ON gc.printer_id = p.id
                                        WHERE gc.printer_id = '{p_id}' ORDER BY gc.id DESC"""
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

def dashboard_search_greetings(search):
    try:
        with connection.cursor() as cursor:
            search_greeting_query = f"""SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards
             WHERE (id LIKE '%{search}%' OR card_name LIKE '%{search}%') ORDER BY created_on DESC"""
            cursor.execute(search_greeting_query)
            greeting_cards = cursor.fetchall()
            return {
                "status": True,
                "all_greeting_cards": responsegenerator.responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301



def printer_search_greetings(search, pid):
    try:
        with connection.cursor() as cursor:
            search_greeting_query = f"""SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards
             WHERE printer_id = '{pid}' AND (id LIKE '%{search}%' OR card_name LIKE '%{search}%') ORDER BY created_on DESC"""
            cursor.execute(search_greeting_query)
            greeting_cards = cursor.fetchall()
            return {
                "status": True,
                "all_greeting_cards": responsegenerator.responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def dashboard_filter_greetings(status):
    try:
        with connection.cursor() as cursor:
            search_greeting_query = f"""SELECT gc.card_name, gc.card_image_url, gc.card_price, gc.id, gc.status, 
                                                    p.store_name, creator.name, updator.name, gc.created_on, gc.updated_on 
                                                    FROM greeting_cards AS gc
                                                    LEFT JOIN users AS creator ON gc.created_by = creator.uid
                                                    LEFT JOIN users AS updator ON gc.updated_by = updator.uid
                                                    LEFT JOIN printer AS p ON gc.printer_id = p.id
                                                    WHERE gc.status= '{status}' ORDER BY gc.id DESC """

            cursor.execute(search_greeting_query)
            greeting_cards = cursor.fetchall()
            return {
                "status": True,
                "all_greeting_cards": responsegenerator.responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def printer_filter_greeting_cards(status, pid):
    try:
        with connection.cursor() as cursor:
            search_greeting_query = f"""SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards
             WHERE status= '{status}' AND printer_id = '{pid}'  ORDER BY created_on DESC"""
            cursor.execute(search_greeting_query)
            greeting_cards = cursor.fetchall()
            return {
                "status": True,
                "all_greeting_cards": responsegenerator.responseGenerator.generateResponse(greeting_cards,
                                                                                           GREETING_CARDS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301

def dashboard_search_greetings_status(status):
    try:
        with connection.cursor() as cursor:
            search_greeting_query = f"""SELECT card_name, card_image_url, card_price, id, status FROM greeting_cards
             WHERE status = '{status}' ORDER BY created_on DESC"""
            cursor.execute(search_greeting_query)
            greeting_cards = cursor.fetchall()
            return {
                "status": True,
                "all_greeting_cards": responsegenerator.responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def disable_greeting_cards(event_id, estatus):
    try:
        with connection.cursor() as cursor:
            disable_cards_query = "UPDATE greeting_cards SET status = %s WHERE id = %s"
            values = (estatus, event_id)
            cursor.execute(disable_cards_query, values)
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
            edit_cards_query = f"""UPDATE greeting_cards SET card_name = '{grt_obj.card_name}', 
            card_price = '{grt_obj.card_price}', updated_by = '{grt_obj.updated_by}', updated_on = %s 
            WHERE id = '{grt_obj.id}' """
            cursor.execute(edit_cards_query, (getIndianTime(),))
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
            get_greetings_query = f"""SELECT id, card_name FROM greeting_cards WHERE id = '{gre_id}' """
            cursor.execute(get_greetings_query)
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


def add_greeting_card(grt_obj):
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = f"""INSERT INTO greeting_cards 
                                    (card_name, card_image_url, card_price, status,printer_id, created_by, created_on, 
                                    updated_by, updated_on)
                                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            cursor.execute(greeting_cards_query,
                           (grt_obj.card_name, grt_obj.card_image_url, grt_obj.card_price, True, grt_obj.printer_id,
                            grt_obj.created_by, getIndianTime() , grt_obj.updated_by, getIndianTime()))
            return {
                "status": True,
                "msg": "card added successfully"

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
