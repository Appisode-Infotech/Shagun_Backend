import pymysql
from django.db import connection
from datetime import datetime
from Shagun_backend.util.constants import CHECK_USER, GIFT_SENT, TRACK_ORDER
from Shagun_backend.util.responsegenerator import responseGenerator


def add_transaction_history(transaction_obj):
    print(transaction_obj)
    try:
        with connection.cursor() as cursor:
            sql_query = "INSERT INTO transaction_history (sender_uid, receiver_uid, transaction_amount, shagun_amount, " \
                        "greeting_card_id, transaction_fee, delivery_fee, transaction_id, payment_status, event_id, " \
                        "status, created_on) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (transaction_obj.sender_uid, transaction_obj.receiver_uid, transaction_obj.transaction_amount,
                      transaction_obj.shagun_amount, transaction_obj.greeting_card_id, transaction_obj.transaction_fee,
                      transaction_obj.delivery_fee, transaction_obj.transaction_id, transaction_obj.payment_status,
                      transaction_obj.event_id, transaction_obj.status, datetime.now())
            cursor.execute(sql_query, values)

            return {
                "status": True,
                "msg": "Transaction records added"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_sent_gift(sent_gift_obj):
    try:
        with connection.cursor() as cursor:
            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN st.transaction_id IS NOT NULL THEN True ELSE False END AS settlement_status
                FROM transaction_history AS th
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN settlements AS st ON th.id = st.transaction_id
                WHERE th.sender_uid = '{sent_gift_obj.uid}' AND et.event_type_name = '{sent_gift_obj.event_type_name}'
                AND DATE_FORMAT(th.created_on, '%Y-%m') = '{sent_gift_obj.month}'
            """
            cursor.execute(sent_gift_query)
            sent_gifts = cursor.fetchall()
            print(sent_gifts)

            return {
                "status": True,
                "sent_gifts": responseGenerator.generateResponse(sent_gifts, GIFT_SENT)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_received_gift(received_gift_obj):
    try:
        with connection.cursor() as cursor:
            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN st.transaction_id IS NOT NULL THEN True ELSE False END AS settlement_status
                FROM transaction_history AS th
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN settlements AS st ON th.id = st.transaction_id
                WHERE th.receiver_uid = '{received_gift_obj.uid}' AND et.event_type_name = '{received_gift_obj.event_type_name}'
                AND DATE_FORMAT(th.created_on, '%Y-%m') = '{received_gift_obj.month}'
            """
            cursor.execute(sent_gift_query)
            received_gifts = cursor.fetchall()
            print(received_gifts)

            return {
                "status": True,
                "sent_gifts": responseGenerator.generateResponse(received_gifts, GIFT_SENT)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_track_order(track_order_obj):
    try:
        with connection.cursor() as cursor:
            track_order_query = f""" SELECT transaction_history.shagun_amount, print_jobs.status, 
                                CASE WHEN print_jobs.transaction_id IS NOT NULL THEN True ELSE False END AS 
                                settlement_status, transaction_history.created_on
                                FROM transaction_history
                                LEFT JOIN print_jobs ON transaction_history.id = print_jobs.transaction_id
                                WHERE transaction_history.sender_uid = '{track_order_obj.uid}' AND transaction_history.event_id = '{track_order_obj.event_id}'
                                """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            print(track)

            return {
                "status": True,
                "track_data": responseGenerator.generateResponse(track, TRACK_ORDER)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
