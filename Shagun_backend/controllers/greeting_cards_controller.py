import pymysql
from django.db import connection

from Shagun_backend.util.constants import GREETING_CARDS
from Shagun_backend.util.responsegenerator import responseGenerator


def get_greeting_cards():
    try:
        with connection.cursor() as cursor:
            greeting_cards_query = """SELECT card_name, card_image_url, card_price FROM greeting_cards WHERE status=1"""
            cursor.execute(greeting_cards_query)
            greeting_cards = cursor.fetchall()
            print(greeting_cards)

            return {
                "status": True,
                "sent_gifts": responseGenerator.generateResponse(greeting_cards, GREETING_CARDS)

            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


