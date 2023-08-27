import json

import pymysql
from django.db import connection



def event_admin(event_id):
    try:
        with connection.cursor() as cursor:
            event_admin_query = f"""SELECT event.event_admin FROM event
                        WHERE  id = '{event_id}'"""
            cursor.execute(event_admin_query)
            admin = cursor.fetchone()
            event_admins = json.loads(admin[0])
            for item in event_admins:
                uid = item["uid"]
                phone_query = f"""SELECT phone FROM users
                                        WHERE  uid = '{uid}'"""
                cursor.execute(phone_query)
                phone = cursor.fetchone()
                item["qr_code"] = str(event_id) + "_" + phone[0]

            update_qr_sql = f"""UPDATE event SET event_admin = '{json.dumps(event_admins)}' WHERE id = '{event_id}' """
            cursor.execute(update_qr_sql)
            return {
                "status": True,
                "msg": event_admins
                # "event_admin": responsegenerator.responseGenerator.generateResponse(admin, EVENT_ADMIN)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def save_event_guest_invite(invited_by, invited_to, e_id, invite_message):
    try:
        with connection.cursor() as cursor:
            invite_query = """INSERT INTO event_guest_invite (invited_by, invited_to, event_id, invite_message) VALUES (%s, %s, %s, %s)"""
            data_list = [(invited_by, invited_to, e_id, invite_message) for invited_to in invited_to]
            print(data_list)
            cursor.executemany(invite_query, data_list)
            return {
                "status": True,
                "msg": "Inserted successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301
