import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import USER_HOME_PAGE


def home_page_data(uid):
    try:
        with connection.cursor() as cursor:
            phone_query = f"""SELECT * FROM users WHERE uid = '{uid}'"""
            cursor.execute(phone_query)
            user_data = cursor.fetchone()
            phone = user_data[4]
            user_status = user_data[9]
            kyc_status = user_data[6]

            sent_transactions_query = f"""
                SELECT COALESCE(SUM(shagun_amount), 0) AS total_amount
                FROM transaction_history
                WHERE sender_uid = '{uid}'
            """
            cursor.execute(sent_transactions_query)
            sent_transactions = cursor.fetchone()

            received_transactions_query = f"""
                SELECT COALESCE(SUM(shagun_amount), 0) AS total_amount
                FROM transaction_history
                WHERE receiver_uid = '{uid}'
            """
            cursor.execute(received_transactions_query)
            received_transactions = cursor.fetchone()

            invited_events_query = f"""
                SELECT et.event_type_name, e.event_date, e.event_admin, e.id, egi.status, u_invited_by.phone,
                u_invited_by.name, u_invited_by.profile_pic
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

            get_kyc_query = f"SELECT count(*) FROM user_kyc WHERE uid = '{uid}'"
            cursor.execute(get_kyc_query)
            kyc_count = cursor.fetchone()[0]

            get_kyc_request_query = f"SELECT * FROM user_callback_request WHERE uid = '{uid}' AND status = 0 AND type = 'KYC' "
            cursor.execute(get_kyc_request_query)
            kyc_request = cursor.fetchone()
            if kyc_request:
                is_active_kyc_request = True
            else:
                is_active_kyc_request = False

            home_page = invited_events
            response = responsegenerator.responseGenerator.generateResponse(home_page, USER_HOME_PAGE)

            return {
                "status": True,
                "kyc_status": kyc_status,
                "kyc_count": kyc_count,
                "user_status": user_status,
                "is_active_kyc_request": is_active_kyc_request,
                "total_sent_amount": round(sent_transactions[0]),
                "total_recieved_amount": round(received_transactions[0]),
                "events_invite_list": response[2],
            }, 200


    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
