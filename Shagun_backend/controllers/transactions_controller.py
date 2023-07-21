import pymysql
from django.db import connection
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def add_transaction_history(transaction_obj):
    try:
        with connection.cursor() as cursor:
            sql_query = "INSERT INTO transaction_history (sender_uid, receiver_uid, transaction_amount, shagun_amount, " \
                        "greeting_card_id, transaction_fee, delivery_fee, transaction_id, payment_status, event_id, " \
                        "status, created_on) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (transaction_obj.sender_uid, transaction_obj.receiver_uid, transaction_obj.transaction_amount,
                      transaction_obj.shagun_amount, transaction_obj.greeting_card_id, transaction_obj.transaction_fee,
                      transaction_obj.delivery_fee, transaction_obj.transaction_id, transaction_obj.payment_status,
                      transaction_obj.event_id, transaction_obj.status, today)
            cursor.execute(sql_query, values)

            return {
                "status": True,
                "msg": "Transaction records added"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_sent_gift(gift_data_obj):
    if gift_data_obj.month != '1':
        # Use the provided month in the query
        month_filter = f"DATE_FORMAT(th.created_on, '%Y-%m') = '{gift_data_obj.month}'"
    else:
        # If 'month' is not provided, include all records (no filtering by month)
        month_filter = "1"
    try:
        with connection.cursor() as cursor:
            events_list_query = f"""
                                        SELECT id, event_type_name from events_type"""
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN st.transaction_id IS NOT NULL THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{gift_data_obj.uid}') AS total_amount,
                    u.name, bd.bank_name, bd.bank_logo, bd.account_number
                FROM transaction_history AS th
                JOIN users As u ON th.receiver_uid = u.uid
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN settlements AS st ON th.id = st.transaction_id
                LEFT JOIN bank_details AS bd ON st.receiver_bank_id = bd.id                
                WHERE th.sender_uid = '{gift_data_obj.uid}'AND et.event_type_name LIKE '{gift_data_obj.type}' AND 
                ({month_filter})"""
            cursor.execute(sent_gift_query)
            sent_gifts = cursor.fetchall()

            events_list = responseGenerator.generateResponse(events_data, EVENT_TYPE_LIST)
            total_gift_sent, sent_gift_list = responseGenerator.generateResponse(sent_gifts, GIFT_SENT)
            return {
                "status": True,
                "events_list": events_list,
                "total_gift_sent": total_gift_sent,
                "sent_gifts": sent_gift_list
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_received_gift(gift_data_obj):
    if gift_data_obj.month != '1':
        # Use the provided month in the query
        month_filter = f"DATE_FORMAT(th.created_on, '%Y-%m') = '{gift_data_obj.month}'"
    else:
        # If 'month' is not provided, include all records (no filtering by month)
        month_filter = "1"
    try:
        with connection.cursor() as cursor:
            events_list_query = f"""
                            SELECT id, event_type_name from events_type"""
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN st.transaction_id IS NOT NULL THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{gift_data_obj.uid}') AS total_amount,
                    u.name, bd.bank_name, bd.bank_logo, bd.account_number
                FROM transaction_history AS th
                JOIN users As u ON th.sender_uid = u.uid
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN settlements AS st ON th.id = st.transaction_id
                LEFT JOIN bank_details AS bd ON st.receiver_bank_id = bd.id  
                WHERE th.receiver_uid = '{gift_data_obj.uid}' AND et.event_type_name LIKE '{gift_data_obj.type}' AND 
                ({month_filter})"""
            cursor.execute(sent_gift_query)
            received_gifts = cursor.fetchall()
            events_list = responseGenerator.generateResponse(events_data, EVENT_TYPE_LIST)
            total_gift_received, received_gift_list = responseGenerator.generateResponse(received_gifts, GIFT_SENT)

            return {
                "status": True,
                "events_list": events_list,
                "total_received_gifts": total_gift_received,
                "received_gifts": received_gift_list
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
                                WHERE transaction_history.sender_uid = '{track_order_obj.uid}' 
                                AND transaction_history.event_id = '{track_order_obj.event_id}'
                                """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            return {
                "status": True,
                "track_data": responseGenerator.generateResponse(track, TRACK_ORDER)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
