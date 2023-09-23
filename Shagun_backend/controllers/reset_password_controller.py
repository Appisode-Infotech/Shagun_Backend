import json

import bcrypt
import pymysql
from django.db import connection
import random
import string
import requests

def generate_random_string(length=8):
    characters = string.ascii_letters + string.digits
    random_pwd = ''.join(random.choice(characters) for _ in range(length))

    return random_pwd


def reset_password(email, user):
    try:
        with connection.cursor() as cursor:
            new_pwd = generate_random_string()
            hashed_password = bcrypt.hashpw(new_pwd.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
            if user == 'manage_printers':
                print("reset pwd for printing vendor")
                sql_query = f"""UPDATE printer SET printer_password	 = '{hashed_password}' WHERE email = '{email}' """
                cursor.execute(sql_query)

            else:
                print("reset pwd for shagun staff")
                sql_query = f"""UPDATE users SET password = '{hashed_password}' WHERE email = '{email}' """
                cursor.execute(sql_query)

            url = 'https://api.emailjs.com/api/v1.0/email/send'
            data = {
                'service_id': 'default_service',
                'template_id': 'template_ycnjmqh',
                'user_id': 'qbWAgwqHOFbcgoJRF',
                'template_params': {
                    'to_email': email,
                    'new_password': new_pwd,
                    'g-recaptcha-response': '03AHJ_ASjnLA214KSNKFJAK12sfKASfehbmfd...'
                }
            }

            headers = {'Content-Type': 'application/json'}

            response = requests.post(url, data=json.dumps(data), headers=headers)

            return {
                "status": True,
                "message": "Password reset successful, please click Ok to login using new password"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301