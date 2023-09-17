import hashlib

import pymysql
from django.db import connection

from Shagun_backend.controllers.event_controller import send_push_notification
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

            cursor.execute(transaction_history_query)
            transaction_id = cursor.lastrowid
            print(transaction_id)

            event_type_query = f"""SELECT et.event_type_name FROM event AS e
                                            LEFT JOIN events_type AS et ON e.event_type_id = et.id
                                             WHERE e.id = '{transaction_obj.event_id}' """
            cursor.execute(event_type_query)
            event_type = cursor.fetchone()
            print(event_type)

            reciever_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
            VALUES ('{transaction_obj.receiver_uid}', 'Shagun',
            '{transaction_obj.gifter_name} sent you Shagun amount: {transaction_obj.shagun_amount} ',
            'For your {event_type[0]} event')"""
            cursor.execute(reciever_notification_query)

            printer_query = f"""SELECT printer_id FROM event 
                                 WHERE id = '{transaction_obj.event_id}' """
            cursor.execute(printer_query)
            printer = cursor.fetchone()
            print(printer)

            printer_jobs_query = f""" INSERT INTO print_jobs(transaction_id, printer_id, card_id, status,
             created_on, last_modified, billing_amount, event_id, wish)
              VALUES('{transaction_id}', '{printer[0]}', '{transaction_obj.greeting_card_id}',
               1,'{today}', '{today}', '{transaction_obj.greeting_card_price}', '{transaction_obj.event_id}', '{transaction_obj.wish}' )"""

            cursor.execute(printer_jobs_query)

            add_printer_query = """INSERT INTO order_status (transaction_id, status) 
                                                         VALUES (%s, %s)"""
            cursor.execute(add_printer_query, [transaction_id, 1])

            fcm_query = f"""SELECT fcm_token FROM users 
                                             WHERE uid = '{transaction_obj.receiver_uid}' """
            cursor.execute(fcm_query)
            fcm_token = cursor.fetchone()
            print(fcm_token)
            title = f"Order {transaction_id} status: Job Created"
            message = "Your transaction is created and pending for further processing."
            send_push_notification(fcm_token[0], title, message)
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
                WHERE th.event_id = '{event_id}' ORDER BY th.created_on DESC;
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
        month_filter = f"DATE_FORMAT(th.created_on, '%Y-%m') = '{gift_data_obj.month}'"
    else:
        month_filter = "1"
    try:
        with connection.cursor() as cursor:
            events_list_query = """ SELECT id, event_type_name from events_type """
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, th.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{gift_data_obj.uid}')
                     AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number, u.profile_pic
                FROM transaction_history AS th
                LEFT JOIN users As u ON th.receiver_uid = u.uid
                LEFT JOIN event AS ev ON th.event_id = ev.id
                LEFT JOIN events_type AS et ON ev.event_type_id = et.id
                LEFT JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN bank_details AS bd ON th.reciever_bank_id = bd.id
                WHERE th.sender_uid = '{gift_data_obj.uid}'AND et.event_type_name LIKE '{gift_data_obj.type}' AND 
                ({month_filter}) ORDER BY th.created_on DESC"""
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
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, th.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{gift_data_obj.uid}') 
                    AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number, u.profile_pic
                FROM transaction_history AS th
                LEFT JOIN users As u ON th.sender_uid = u.uid
                LEFT JOIN event AS ev ON th.event_id = ev.id
                LEFT JOIN events_type AS et ON ev.event_type_id = et.id
                LEFT JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN bank_details AS bd ON th.reciever_bank_id = bd.id
                WHERE th.receiver_uid = '{gift_data_obj.uid}' AND et.event_type_name LIKE '{gift_data_obj.type}' AND 
                ({month_filter}) ORDER BY th.created_on DESC"""
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


def get_received_gift_for_event(uid, eid):
    try:
        with connection.cursor() as cursor:
            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, th.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{uid}' AND event_id = '{eid}') 
                    AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number, u.profile_pic
                FROM transaction_history AS th
                LEFT JOIN users As u ON th.sender_uid = u.uid
                LEFT JOIN event AS ev ON th.event_id = ev.id
                LEFT JOIN events_type AS et ON ev.event_type_id = et.id
                LEFT JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN bank_details AS bd ON th.reciever_bank_id = bd.id
                WHERE th.receiver_uid = '{uid}' AND th.event_id = '{eid}' ORDER BY th.created_on DESC"""
            cursor.execute(sent_gift_query)
            received_gifts = cursor.fetchall()
            total_gift_received, received_gift_list = responseGenerator.generateResponse(received_gifts, GIFT_SENT)

            return {
                "status": True,
                "total_received_gifts": total_gift_received,
                "received_gifts": received_gift_list
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
            LEFT JOIN users As sender ON th.sender_uid = sender.uid
            LEFT JOIN users As receiver ON th.receiver_uid = receiver.uid
            WHERE th.event_id = '{event_id}' AND is_settled LIKE '{status}' ORDER BY th.created_on DESC """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            return {
                "status": True,
                "message": "Transaction Completed",
                "transactions": responseGenerator.generateResponse(track, Transaction_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def search_transaction_list(event_id, search):
    try:
        with connection.cursor() as cursor:
            track_order_query = f""" SELECT th.*, e.event_date, et.event_type_name,sender.name, receiver.name
            FROM transaction_history AS th
            LEFT JOIN event As e ON th.event_id = e.id
            LEFT JOIN events_type As et ON e.event_type_id = et.id
            LEFT JOIN users As sender ON th.sender_uid = sender.uid
            LEFT JOIN users As receiver ON th.receiver_uid = receiver.uid
            WHERE th.event_id = '{event_id}' AND (th.transaction_id LIKE '%%{search}%%' OR th.gifter_name LIKE '%%{search}%%' 
                                    OR LOWER(sender.name) LIKE LOWER('%%{search}%%')) ORDER BY th.created_on DESC """
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


def settle_payment(transactions_list):
    try:
        with connection.cursor() as cursor:
            transactions_string = ', '.join(transactions_list)
            settlement_data_query = f"""SELECT th.receiver_uid, th.shagun_amount, u.name AS sender_name FROM transaction_history AS th
                                        LEFT JOIN users AS u ON u.id = th.sender_uid
                                        WHERE th.id IN ({transactions_string})"""
            cursor.execute(settlement_data_query)
            settlement_data = cursor.fetchall()
            print(settlement_data)
            user_totals = {}

            for receiver, amount, sender_name in settlement_data:
                if receiver in user_totals:
                    user_totals[receiver]['amount'] += amount
                    user_totals[receiver]['sender_name'] = sender_name
                else:
                    user_totals[receiver] = {'amount': amount, 'sender_name': sender_name}

            for receiver, data in user_totals.items():
                total_amount = data['amount']
                sender_name = data['sender_name']
                print(f"Receiver: {receiver}, Total Amount: {total_amount}, Sender: {sender_name}")
                bank_data_query = f"""SELECT bk.bank_name, bk.ifsc_code, bk.account_holder_name, bk.account_number,
                                        u.name, u.fcm_token FROM bank_details AS bk 
                                        LEFT JOIN users AS u ON bk.uid = u.uid 
                                        WHERE bk.uid = '{receiver}' """
                cursor.execute(bank_data_query)
                bank_data = cursor.fetchall()
                print(bank_data)
                for row in bank_data:
                    bank_name, ifsc_code, account_holder_name, account_number, receiver_name, fcm_token = row
                    invite_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
                                                    VALUES ('{receiver}', 'shagun',
                                                    'Shagun amount {total_amount} credited by {sender_name}',
                                                    'Shagun amount of {total_amount} INR has been successfully 
                                                    transferred to {bank_name} Bank for the account ending with 
                                                    {'*' * (len(str(account_number)) - 4) + str(account_number)[-4:]}')"""
                    cursor.execute(invite_notification_query)
                    title = f"""Shagun amount {total_amount} credited from {sender_name}"""
                    message = f""" Shagun amount of {total_amount} INR has been successfully transferred to {bank_name} Bank for the account ending with {'*' * (len(str(account_number)) - 4) + str(account_number)[-4:]} """
                    send_push_notification(fcm_token, title, message)

        return {
            "status": True,
            "message": "Amount Transfer Completed",
        }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def update_transactions(transactions_list):
    try:
        with connection.cursor() as cursor:
            transactions_string = ', '.join(transactions_list)
            track_order_query = f"""UPDATE transaction_history SET is_settled = 1 
                                    WHERE id IN ({transactions_string})"""
            cursor.execute(track_order_query)

            sql = "INSERT INTO order_status (transaction_id, status) VALUES (%s, %s)"
            values = [(transaction_id, 6) for transaction_id in transactions_list]
            cursor.executemany(sql, values)

            return {
                "status": True,
                "message": "Transaction Completed"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


# def settle_payment(receivers_list, transactions_list, amount_list):
#     user_totals = {}
#
#     for username, user_amount in zip(receivers_list, amount_list):
#         user_amount_float = float(user_amount)
#         if username in user_totals:
#             user_totals[username] += user_amount_float
#         else:
#             user_totals[username] = user_amount_float
#
#     for username, user_total in user_totals.items():
#         print(f"The user {username} should get a total of {user_total:.2f}")
#
#         import requests
#         import hmac
#         # python code to implement payment gateway and sent the respective amount to respective users
#         print(f"Total amount for '{username}': {user_total:.2f}")
#         try:
#             with connection.cursor() as cursor:
#                 track_order_query = " UPDATE transaction_history SET is_settled = 1 WHERE id IN ({})".format(
#                     ','.join(transactions_list))
#                 cursor.execute(track_order_query)
#
#                 sql = "INSERT INTO order_status (transaction_id, status) VALUES (%s, %s)"
#                 values = [(transaction_id, 6) for transaction_id in transactions_list]
#                 cursor.executemany(sql, values)
#
#                 return {
#                     "status": True,
#                     "msg": "done"
#                 }, 200
#
#         except pymysql.Error as e:
#             return {"status": False, "message": str(e)}, 301
#         except Exception as e:
#             return {"status": False, "message": str(e)}, 301
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


def get_transaction_track(tid):
    try:
        with connection.cursor() as cursor:
            track_order_query = f""" SELECT * from order_status WHERE transaction_id = {tid} """
            cursor.execute(track_order_query)
            track = cursor.fetchall()
            print(track)
            return {
                "status": True,
                "track_transaction": responseGenerator.generateResponse(track, TRACK_ORDER)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def search_sent_gift(gift_data_obj):
    try:
        with connection.cursor() as cursor:
            events_list_query = """ SELECT id, event_type_name from events_type """
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, th.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{gift_data_obj.uid}')
                     AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number, u.profile_pic
                FROM transaction_history AS th
                LEFT JOIN users As u ON th.receiver_uid = u.uid
                LEFT JOIN event AS ev ON th.event_id = ev.id
                LEFT JOIN events_type AS et ON ev.event_type_id = et.id
                LEFT JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN bank_details AS bd ON th.reciever_bank_id = bd.id
                WHERE th.sender_uid = '{gift_data_obj.uid}' 
                AND ( u.name LIKE '%{gift_data_obj.search}%' OR u.phone LIKE '%{gift_data_obj.search}%') 
                ORDER BY th.created_on DESC"""
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


def search_received_gift(gift_data_obj):
    try:
        with connection.cursor() as cursor:
            events_list_query = """SELECT id, event_type_name from events_type"""
            cursor.execute(events_list_query)
            events_data = cursor.fetchall()

            sent_gift_query = f"""
                SELECT th.receiver_uid, th.sender_uid, th.shagun_amount, th.transaction_amount,
                    th.transaction_fee, th.delivery_fee, th.created_on, gc.card_price, et.event_type_name, th.id, 
                    CASE WHEN th.is_settled <> 0 THEN True ELSE False END AS settlement_status,
                    (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{gift_data_obj.uid}') 
                    AS total_amount, u.name, bd.bank_name, bd.bank_logo, bd.account_number, u.profile_pic
                FROM transaction_history AS th
                LEFT JOIN users As u ON th.sender_uid = u.uid
                LEFT JOIN event AS ev ON th.event_id = ev.id
                LEFT JOIN events_type AS et ON ev.event_type_id = et.id
                LEFT JOIN greeting_cards AS gc ON th.greeting_card_id = gc.id
                LEFT JOIN bank_details AS bd ON th.reciever_bank_id = bd.id
                WHERE th.receiver_uid = '{gift_data_obj.uid}' 
                AND ( u.name LIKE '%{gift_data_obj.search}%' OR u.phone LIKE '%{gift_data_obj.search}%') 
                ORDER BY th.created_on DESC"""
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
