import pymysql
from django.db import connection
import random

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import quotes, USER_HOME_PAGE


def home_page_data(uid):
    try:
        with connection.cursor() as cursor:
            phone_query = f"""SELECT phone FROM users WHERE uid = '{uid}'"""
            cursor.execute(phone_query)
            phone = cursor.fetchone()[0]
            sent_transactions_query = f"""
                SELECT th.shagun_amount, et.event_type_name, u.name, e.id, u.profile_pic, 
                (SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{uid}') AS total_amount
                FROM transaction_history AS th
                JOIN event AS e ON th.event_id = e.id
                JOIN events_type AS et ON e.event_type_id = et.id
                JOIN users AS u ON th.receiver_uid = u.uid
                WHERE th.sender_uid = '{uid}' ORDER BY th.created_on DESC 
                LIMIT 5
            """
            cursor.execute(sent_transactions_query)
            sent_transactions = cursor.fetchall()

            received_transactions_query = f"""
                SELECT th.shagun_amount, et.event_type_name, u.name, e.id, u.profile_pic,
                (SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{uid}') AS total_amount
                FROM transaction_history AS th
                JOIN event AS e ON th.event_id = e.id
                JOIN events_type AS et ON e.event_type_id = et.id
                JOIN users AS u ON th.sender_uid = u.uid
                WHERE th.receiver_uid = '{uid}'
                ORDER BY th.created_on DESC
                LIMIT 5
            """
            cursor.execute(received_transactions_query)
            received_transactions = cursor.fetchall()

            invited_events_query = f"""
                SELECT et.event_type_name, e.event_date, e.event_admin, e.id, egi.status, u_invited_by.phone AS invited_by_phone
                FROM event_guest_invite AS egi
                JOIN users AS u ON u.phone = egi.invited_to
                JOIN event AS e ON egi.event_id = e.id
                JOIN events_type AS et ON e.event_type_id = et.id
                LEFT JOIN users AS u_invited_by ON u_invited_by.uid = egi.invited_by
                WHERE egi.invited_to = '{phone}' AND e.status = 1
                ORDER BY egi.created_at DESC
                LIMIT 5
            """
            cursor.execute(invited_events_query)
            invited_events = cursor.fetchall()

            get_kyc_query = f"SELECT kyc FROM users WHERE uid = '{uid}'"
            cursor.execute(get_kyc_query)
            kyc_status = cursor.fetchone()

            home_page = sent_transactions, received_transactions, invited_events
            response = responsegenerator.responseGenerator.generateResponse(home_page, USER_HOME_PAGE)

            return {
                "status": True,
                "kyc_status": kyc_status[0],
                "total_sent_amount": response[0],
                "total_recieved_amount": response[2],
                "transaction_sent_list": response[1],
                "transaction_recieved_list": response[3],
                "events_invite_list": response[4],
                "random_quote": random.choice(quotes)
            }, 200


    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
