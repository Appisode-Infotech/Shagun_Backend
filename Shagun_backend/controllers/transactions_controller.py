import hashlib

import pymysql
from django.db import connection
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def add_transaction_history(transaction_obj):
    try:
        with connection.cursor() as cursor:
            transaction_history_query = f"""INSERT INTO transaction_history (sender_uid, receiver_uid, 
            transaction_amount, shagun_amount, greeting_card_id, transaction_fee, delivery_fee, transaction_id, 
            payment_status, event_id, status, created_on, gifter_name) 
            VALUES ('{transaction_obj.uid}', '{transaction_obj.receiver_uid}', 
            '{transaction_obj.transaction_amount}', '{transaction_obj.shagun_amount}', '{transaction_obj.greeting_card_id}',
            '{transaction_obj.transaction_fee}', '{transaction_obj.delivery_fee}', '{transaction_obj.transaction_id}',
            '{transaction_obj.payment_status}', '{transaction_obj.event_id}', {transaction_obj.status}, '{today}', '{transaction_obj.gifter_name}')"""

            print(cursor.execute(transaction_history_query))

            printer_query = f"""SELECT printer_id FROM event 
                                 WHERE id = '{transaction_obj.event_id}' """
            cursor.execute(printer_query)
            printer = cursor.fetchone()

            printer_jobs_query = f""" INSERT INTO print_jobs(transaction_id, printer_id, card_id, status,
             created_on, last_modified, billing_amount, event_id, wish)
              VALUES('{transaction_obj.transaction_id}', '{printer[0]}', '{transaction_obj.greeting_card_id}',
               1,'{today}', '{today}', '{transaction_obj.greeting_card_price}', '{transaction_obj.event_id}', '{transaction_obj.wish}' )"""

            print(cursor.execute(printer_jobs_query))

            return {
                "status": True,
                "msg": "Transaction records added"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def event_settlement(event_id):
    try:
        with connection.cursor() as cursor:
            event_settlement_query = f"""
                SELECT SUM(CASE WHEN th.is_settled = 0 THEN shagun_amount ELSE 0 END) 
                AS total_shagun_amount, 
                SUM(CASE WHEN th.is_settled <> 0 THEN shagun_amount ELSE 0 END)
                AS settled_amount,
                SUM(shagun_amount) AS total_received_amount 
                FROM transaction_history th
                LEFT JOIN 
                WHERE th.event_id = '{event_id}' ;
            """
            cursor.execute(event_settlement_query)
            amount = cursor.fetchone()

            return {
                "status": True,
                "total_shagun": amount[2],
                "settled_amount": amount[1],
                "unsettled_shagun_amount": amount[0]
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
            events_list_query = """ SELECT id, event_type_name from events_type """
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{gift_data_obj.uid}')
                     AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number
                FROM transaction_history AS th
                JOIN users As u ON th.receiver_uid = u.uid
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
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
            events_list_query = """SELECT id, event_type_name from events_type"""
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, ev.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{gift_data_obj.uid}') 
                    AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number
                FROM transaction_history AS th
                JOIN users As u ON th.sender_uid = u.uid
                JOIN event AS ev ON th.event_id = ev.id
                JOIN events_type AS et ON ev.id = et.id
                JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
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


def get_transaction_list(event_id, status):
    try:
        with connection.cursor() as cursor:
            track_order_query = f""" SELECT th.*, e.event_date, et.event_type_name,sender.name, receiver.name
            FROM transaction_history AS th
            LEFT JOIN event As e ON th.event_id = e.id
            LEFT JOIN events_type As et ON e.event_type_id = et.id
            LEFT JOIN users As sender ON th.sender_uid = sender.id
            LEFT JOIN users As receiver ON th.receiver_uid = receiver.id
            WHERE th.event_id = '{event_id}' """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            return {
                "status": True,
                "transactions": responseGenerator.generateResponse(track, Transaction_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_transaction_list(event_id, status):
    try:
        with connection.cursor() as cursor:
            track_order_query = f""" SELECT th.*, e.event_date, et.event_type_name,sender.name, receiver.name
            FROM transaction_history AS th
            LEFT JOIN event As e ON th.event_id = e.id
            LEFT JOIN events_type As et ON e.event_type_id = et.id
            LEFT JOIN users As sender ON th.sender_uid = sender.id
            LEFT JOIN users As receiver ON th.receiver_uid = receiver.id
            WHERE th.event_id = '{event_id}' AND is_settled LIKE '{status}' """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            return {
                "status": True,
                "transactions": responseGenerator.generateResponse(track, Transaction_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def settle_payment(receivers_list, transactions_list, amount_list):
    user_totals = {}

    for username, user_amount in zip(receivers_list, amount_list):
        user_amount_float = float(user_amount)
        if username in user_totals:
            user_totals[username] += user_amount_float
        else:
            user_totals[username] = user_amount_float

    total_amount = sum(user_totals.values())

    for username, user_total in user_totals.items():
        import requests
        import hmac
        # python code to implement payment gateway and sent the respective amount to respective users
        print(f"Total amount for '{username}': {user_total:.2f}")
        try:
            with connection.cursor() as cursor:
                track_order_query = " UPDATE transaction_history SET is_settled = 1 WHERE id IN ({})".format(
                    ','.join(transactions_list))
                cursor.execute(track_order_query)
                return {
                    "status": True,
                    "msg": "done"
                }, 200

        except pymysql.Error as e:
            return {"status": False, "message": str(e)}, 301
        except Exception as e:
            return {"status": False, "message": str(e)}, 301

        # import requests
        # import random, string;
        # order_id = ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(6))
        #
        # url = "https://sandbox.cashfree.com/pg/orders"
        #
        # payload = {
        #     "customer_details": {
        #         "customer_id": "7112AGAA812234",
        #         "customer_email": "john@cashfree.com",
        #         "customer_phone": "9738505213",
        #         "customer_bank_account_number": "1518121112",
        #         "customer_bank_ifsc": "CITI0000001",
        #         "customer_bank_code": 3333
        #     },
        #     "order_meta": {
        #         "return_url": "http://127.0.0.1:8000/order_id={order_id}",
        #         "notify_url": "http://127.0.0.1:8000"
        #     },
        #     "order_tags": {"additionalProp": "string"},
        #     "order_id": order_id,
        #     "order_amount": 10.15,
        #     "order_currency": "INR",
        #     "order_expiry_time": "2023-08-29T00:00:00Z",
        #     "order_note": "Test order",
        # }
        # headers = {
        #     "accept": "application/json",
        #     "x-client-id": "TEST37487412eaae6cfeadaf419081478473",
        #     "x-client-secret": "TEST9a606fd25cb197a28767534be96a55e8aa19af5b",
        #     "x-api-version": "2022-09-01",
        #     "content-type": "application/json"
        # }
        #
        # response = requests.post(url, json=payload, headers=headers)
        #
        # print(response.text)

        # Parse the JSON response
        # response_data = response.json()
        # if response_data.get('status') == 'OK':
        #     payment_link = response_data.get('paymentLink')
        #     print(f"Payment success")
        #     try:
        #         with connection.cursor() as cursor:
        #             track_order_query = " UPDATE transaction_history SET is_settled = 1 WHERE id IN ({})".format(
        #                 ','.join(transactions_list))
        #             cursor.execute(track_order_query)
        #             return {
        #                 "status": True,
        #                 "msg": "done"
        #             }, 200
        #
        #     except pymysql.Error as e:
        #         return {"status": False, "message": str(e)}, 301
        #     except Exception as e:
        #         return {"status": False, "message": str(e)}, 301
        # else:
        #     print("Payment request failed.")
