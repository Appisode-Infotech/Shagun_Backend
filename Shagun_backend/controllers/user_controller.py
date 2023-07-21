import json

import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import *
from Shagun_backend.util.responsegenerator import responseGenerator


def check_user_exist(username, fcm):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [username])
            result = cursor.fetchone()

            sql_query = "UPDATE users SET fcm_token = %s WHERE uid = %s"
            values = (fcm, username)
            cursor.execute(sql_query, values)

            if result is not None:
                return {
                    "status": True,
                    "user": responseGenerator.generateResponse(result, CHECK_USER)
                }, 200
            else:
                return {
                    "status": False,
                    "user": None
                }, 301
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def user_register(reg_obj):
    try:
        with connection.cursor() as cursor:
            sql_query = "INSERT INTO users (name, email, phone, kyc, profile_pic, uid, status, auth_type, role, fcm_token, city)" \
                        " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (reg_obj.name, reg_obj.email, reg_obj.phone, False, reg_obj.profile, reg_obj.uid, True,
                      reg_obj.auth_type, reg_obj.role, reg_obj.fcm_token, reg_obj.city)
            cursor.execute(sql_query, values)
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [reg_obj.uid])
            user_data = cursor.fetchone()
            return {
                "status": True,
                "message": "User added successfully",
                "user": responseGenerator.generateResponse(user_data, CHECK_USER)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e), "user": None}, 301
    except Exception as e:
        return {"status": False, "message": str(e), "user": None}, 301


def edit_user(edit_reg_obj):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE users SET name = %s, email = %s, phone = %s, profile_pic = %s WHERE uid = %s"
            values = (edit_reg_obj.name, edit_reg_obj.email, edit_reg_obj.phone, edit_reg_obj.profile, edit_reg_obj.uid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "User edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def deactivate_user(uid, esstatus):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE users SET status = %s WHERE uid = %s"
            values = (esstatus, uid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "User status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_user_kyc(kyc_obj):
    try:
        with connection.cursor() as cursor:
            # query to check if uid exist or not and then execute if loop if user exist
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [kyc_obj.uid])
            user = cursor.fetchone()
            if user is not None:
                sql_query = "INSERT INTO user_kyc (uid, full_name, dob, permanent_address, identification_proof1, " \
                            "identification_proof2, identification_number1, identification_number2, identification_doc1, " \
                            "identification_doc2, verification_status, created_on) " \
                            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                values = (kyc_obj.uid, kyc_obj.full_name, kyc_obj.dob, kyc_obj.permanent_address,
                          kyc_obj.identification_proof1, kyc_obj.identification_proof2, kyc_obj.identification_number1,
                          kyc_obj.identification_number2, kyc_obj.identification_doc1, kyc_obj.identification_doc2,
                          'pending', today)
                cursor.execute(sql_query, values)
                return {
                    "status": True,
                    "message": "User KYC inserted"
                }, 200
            else:
                return {
                    "status": False,
                    "message": "UID invalid"
                }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def update_user_kyc(kyc_obj):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [kyc_obj.uid])
            user = cursor.fetchone()
            if user is not None:
                # Query to check if the UID exists in the kyc_users table
                query = "SELECT * FROM user_kyc WHERE uid = %s;"
                cursor.execute(query, [kyc_obj.uid])
                existing_user = cursor.fetchone()

                if existing_user is not None:
                    # Query to update the KYC details for the user
                    update_query = "UPDATE user_kyc SET full_name = %s, dob = %s, permanent_address = %s, " \
                                   "identification_proof1 = %s, identification_proof2 = %s, identification_number1 = " \
                                   "%s,identification_number2 = %s , identification_doc1 = %s, identification_doc2 = " \
                                   "%s , updated_on = %s  WHERE uid = %s "

                    values = (kyc_obj.full_name, kyc_obj.dob, kyc_obj.permanent_address,
                              kyc_obj.identification_proof1, kyc_obj.identification_proof2,
                              kyc_obj.identification_number1, kyc_obj.identification_number2,
                              kyc_obj.identification_doc1, kyc_obj.identification_doc2,
                              today, kyc_obj.uid)

                    cursor.execute(update_query, values)
                    return {
                        "status": True,
                        "message": "KYC details updated successfully"
                    }, 200
                else:
                    return {
                        "status": False,
                        "message": "UID not found in KYC records"
                    }, 200
            else:
                return {
                    "status": False,
                    "message": "UID invalid"
                }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def enable_disable_kyc(uid, v_status):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE user_kyc SET verification_status = %s WHERE uid = %s"
            values = (v_status, uid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "User Kyc status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_kyc_data():
    try:
        with connection.cursor() as cursor:
            kyc_data_query = """ SELECT 
                kyc.id, kyc.uid, kyc.full_name, kyc.dob, kyc.permanent_address, 
                kyc.identification_proof1, kyc.identification_proof2, kyc.identification_number1, 
                kyc.identification_number2, kyc.identification_doc1, kyc.identification_doc2, 
                kyc.verification_status, users.profile_pic
                FROM user_kyc AS kyc
                INNER JOIN users ON kyc.uid = users.uid """

            cursor.execute(kyc_data_query)
            kyc_data = cursor.fetchall()
            return {
                "status": True,
                "kyc_data": responsegenerator.responseGenerator.generateResponse(kyc_data, ALL_KYC_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_bank_details(bank_obj):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [bank_obj.uid])
            user = cursor.fetchone()
            if user is not None:
                sql_query = "INSERT INTO bank_details (uid, bank_name, ifsc_code, account_holder_name, account_number," \
                            "status, added_by, modified_on) " \
                            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                values = (bank_obj.uid, bank_obj.bank_name, bank_obj.ifsc_code, bank_obj.account_holder_name,
                          bank_obj.account_number,
                          True, bank_obj.added_by, today)
                cursor.execute(sql_query, values)
                return {
                    "status": True,
                    "message": "Bank Details added successfully"
                }, 200

            else:
                return {
                    "status": False,
                    "message": "UID invalid"
                }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def update_bank_details(bank_obj):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [bank_obj.uid])
            user = cursor.fetchone()
            if user is not None:
                sql_query = "UPDATE bank_details SET bank_name = %s, ifsc_code = %s, account_holder_name = %s, " \
                            "account_number = %s, status = %s, added_by = %s, modified_on = %s WHERE uid = %s"
                values = (bank_obj.bank_name, bank_obj.ifsc_code, bank_obj.account_holder_name, bank_obj.account_number,
                          True, bank_obj.added_by, today, bank_obj.uid)
                cursor.execute(sql_query, values)

                return {
                    "status": True,
                    "message": "Bank Details Updated successfully"
                }, 200

            else:
                return {
                    "status": False,
                    "message": "UID invalid"
                }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_bank_data():
    try:
        with connection.cursor() as cursor:
            bank_data_query = """ SELECT bnk.id, bnk.uid, bnk.ifsc_code, bnk.bank_name, bnk.account_holder_name,
                bnk.account_number, bnk.status, users.profile_pic
                FROM bank_details AS bnk
                LEFT JOIN users ON bnk.uid = users.uid """
            cursor.execute(bank_data_query)
            bank_data_query = cursor.fetchall()
            return {
                "status": True,
                "bank_data": responsegenerator.responseGenerator.generateResponse(bank_data_query, ALL_BANK_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_users():
    try:
        with connection.cursor() as cursor:
            users_data_query = """ SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status
                FROM users WHERE role = 3"""
            cursor.execute(users_data_query)
            user_data = cursor.fetchall()
            return {
                "status": True,
                "user_data": responsegenerator.responseGenerator.generateResponse(user_data, ALL_USERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def add_employee(emp_obj):
    try:
        with connection.cursor() as cursor:
            add_emp_query = "INSERT INTO users (uid, name, email, phone, created_on, status, role, city, password)" \
                            " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (emp_obj.email, emp_obj.name, emp_obj.email, emp_obj.phone, today, True, 2,
                      emp_obj.city, emp_obj.password)
            cursor.execute(add_emp_query, values)
            # query = "SELECT * FROM users WHERE role = %s;"
            # cursor.execute(query, 2)
            # user_data = cursor.fetchone()
            return {
                "status": True,
                "message": "Employee added successfully"
                # "user": responseGenerator.generateResponse(user_data, CHECK_USER)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e), "user": None}, 301
    except Exception as e:
        return {"status": False, "message": str(e), "user": None}, 301


def enable_disable_employee(uid, e_status):
    try:
        with connection.cursor() as cursor:
            sql_query = "UPDATE users SET status = %s WHERE uid = %s"
            values = (e_status, uid)
            cursor.execute(sql_query, values)
            return {
                "status": True,
                "message": "Employee status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_employees():
    try:
        with connection.cursor() as cursor:
            users_data_query = """ SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status
                FROM users WHERE role = 2"""
            cursor.execute(users_data_query)
            user_data = cursor.fetchall()
            return {
                "status": True,
                "user_data": responsegenerator.responseGenerator.generateResponse(user_data, ALL_USERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def employee_login(uname, pwd):
    with connection.cursor() as cursor:
        query = "SELECT password, name, profile_pic FROM users WHERE uid = %s;"
        cursor.execute(query, [uname])
        result = cursor.fetchone()
        if result is not None and result[0] == pwd:
            return {
                "msg": "Success",
                "data": result[0],
                "name": result[1],
                "profile_pic": result[2]
            }

        if result is not None and result[0] != pwd:
            return {
                "msg": "wrong password",
            }

        else:
            return {
                "msg": "user not exist, Please register",
            }


def get_user_profile(uid):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [uid])
            user_data = cursor.fetchone()

            sql_query_events = f"""
                            SELECT count(*) FROM event 
                            JOIN events_type ON event.event_type_id = events_type.id
                            WHERE JSON_CONTAINS(event_admin, %(uid_json)s)
                        """
            uid_json = json.dumps({'uid': uid})
            cursor.execute(sql_query_events, {'uid_json': uid_json})
            events_count = cursor.fetchone()

            count_sql_query = f"""
                    SELECT
                        COUNT(DISTINCT bank_details.id) AS bank_details_count,
                        COALESCE((SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{uid}'), 0) AS total_sent_amount,
                        COALESCE((SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{uid}'), 0) AS total_received_amount
                    FROM bank_details
                    WHERE bank_details.uid = '{uid}'
                """
            cursor.execute(count_sql_query)
            counts = cursor.fetchone()

            kyc_sql_query = f"""
                                SELECT uk.identification_proof1, uk.identification_proof2, uk.identification_number1, 
                                uk.identification_number2, uk.verification_status
                                FROM user_kyc uk WHERE uk.uid = '{uid}'
                            """
            cursor.execute(kyc_sql_query)
            kyc_data = cursor.fetchall()

            bank_sql_query = f"""
                                SELECT bd.bank_name, bd.account_number, bd.ifsc_code
                                FROM bank_details bd
                                WHERE bd.uid = '{uid}'
                            """
            cursor.execute(bank_sql_query)
            bank_data = cursor.fetchall()

            return {
                "status": True,
                "message": "User found",
                "events_count": events_count[0],
                "bank_count": counts[0],
                "total_amount_sent": counts[1],
                "total_amount_received": counts[2],
                "user": responseGenerator.generateResponse(user_data, CHECK_USER),
                "bank_data": responseGenerator.generateResponse(bank_data, GET_BANK_DATA),
                "kyc_data": responseGenerator.generateResponse(kyc_data, GET_KYC_DATA)
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e), "user": None}, 301
    except Exception as e:
        return {"status": False, "message": str(e), "user": None}, 301
