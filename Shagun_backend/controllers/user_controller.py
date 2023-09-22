import json
import bcrypt
import pymysql
from django.db import connection

from Shagun_backend.controllers.event_controller import send_push_notification
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


def user_register(reg_obj, file_name):
    try:
        with connection.cursor() as cursor:
            sql_query = """INSERT INTO users (name, email, phone, kyc, profile_pic, uid, status, auth_type, role, 
                            fcm_token, city) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            values = (
                reg_obj['name'], reg_obj['email'], reg_obj['phone'], False, file_name, reg_obj['uid'], True,
                reg_obj['auth_type'], reg_obj['role'], reg_obj['fcm_token'], reg_obj['city'])
            cursor.execute(sql_query, values)
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [reg_obj['uid']])
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


def edit_user(edit_reg_obj, file_name):
    try:
        with connection.cursor() as cursor:
            if file_name == '':
                sql_query = "UPDATE users SET name = %s, email = %s, phone = %s WHERE uid = %s"
                values = (
                edit_reg_obj['name'], edit_reg_obj['email'], edit_reg_obj['phone'], edit_reg_obj['uid'])
                cursor.execute(sql_query, values)

            else:
                sql_query = "UPDATE users SET name = %s, email = %s, phone = %s, profile_pic = %s WHERE uid = %s"
                values = (
                edit_reg_obj['name'], edit_reg_obj['email'], edit_reg_obj['phone'], file_name, edit_reg_obj['uid'])
                cursor.execute(sql_query, values)


            return {
                "status": True,
                "message": "User edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_users(kyc):
    try:
        with connection.cursor() as cursor:
            users_data_query = f""" SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 3 AND kyc LIKE '{kyc}' ORDER BY created_on DESC  """
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


def filter_users(status):
    try:
        with connection.cursor() as cursor:
            users_data_query = f""" SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 3 AND status LIKE '{status}' ORDER BY created_on DESC"""
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


def get_users_by_name_or_phone(search):
    try:
        with connection.cursor() as cursor:
            sql_query = f""" SELECT * FROM users
                        WHERE (role = 3)
                        AND (name LIKE '%{search}%' OR phone LIKE '%{search}%')
                        AND ('{search}' <> ''); ORDER BY created_on DESC"""
            cursor.execute(sql_query)
            user_data = cursor.fetchall()
            return {
                "status": True,
                "user": responseGenerator.generateResponse(user_data, GET_USERS_BY_NAME_OR_PHONE)
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
            print(user)
            if user is not None:
                sql_query = """
                INSERT INTO user_kyc (uid, full_name, dob, address_line1, identification_proof1,
                    identification_proof2, identification_number1, identification_number2,
                    identification_doc1, identification_doc2, verification_status, created_on,
                    gender, address_line2, city, state, postcode, country, updated_on, created_by, updated_by)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE
                full_name = VALUES(full_name),
                dob = VALUES(dob),
                address_line1 = VALUES(address_line1),
                identification_proof1 = VALUES(identification_proof1),
                identification_proof2 = VALUES(identification_proof2),
                identification_number1 = VALUES(identification_number1),
                identification_number2 = VALUES(identification_number2),
                identification_doc1 = VALUES(identification_doc1),
                identification_doc2 = VALUES(identification_doc2),
                verification_status = VALUES(verification_status),
                created_on = VALUES(created_on),
                gender = VALUES(gender),
                address_line2 = VALUES(address_line2),
                city = VALUES(city),
                state = VALUES(state),
                postcode = VALUES(postcode),
                country = VALUES(country),
                updated_on = VALUES(updated_on),
                created_by = VALUES(created_by),
                updated_by = VALUES(updated_by)
                """
                values = (kyc_obj.uid, kyc_obj.full_name, kyc_obj.dob, kyc_obj.adress1,
                          kyc_obj.identification_proof1, kyc_obj.identification_proof2, kyc_obj.identification_number1,
                          kyc_obj.identification_number2, kyc_obj.identification_doc1, kyc_obj.identification_doc2,
                          0, today, kyc_obj.gender, kyc_obj.adress2, kyc_obj.city, kyc_obj.state,
                          kyc_obj.postcode, kyc_obj.country, today, kyc_obj.created_by_uid, kyc_obj.created_by_uid)
                cursor.execute(sql_query, values)

                KYC_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
                            VALUES ('{kyc_obj.uid}', 'KYC',
                            'KYC Completed for {kyc_obj.full_name}',
                            'KYC added for {kyc_obj.identification_proof1}:{kyc_obj.identification_number1} and {kyc_obj.identification_proof2}:{kyc_obj.identification_number2}')"""
                cursor.execute(KYC_notification_query)

                fcm_query = f"""SELECT fcm_token FROM users WHERE uid = '{kyc_obj.uid}' """
                cursor.execute(fcm_query)
                fcm_token = cursor.fetchone()
                title = f"KYC Completed"
                message = f""" KYC added for {kyc_obj.identification_proof1}:{kyc_obj.identification_number1} and 
                                {kyc_obj.identification_proof2}:{kyc_obj.identification_number2} """
                send_push_notification(fcm_token[0], title, message)

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
                    update_query = """UPDATE user_kyc SET full_name = %s, dob = %s, permanent_address = %s, 
                                    identification_proof1 = %s, identification_proof2 = %s, identification_number1 = %s,
                                    identification_number2 = %s , identification_doc1 = %s, identification_doc2 = %s , 
                                    updated_on = %s  WHERE uid = %s """

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


def enable_disable_kyc(kyc_id, v_status):
    try:
        with connection.cursor() as cursor:
            sql_query = f"""UPDATE user_kyc AS uk
                JOIN users AS u ON uk.uid = u.uid
                SET uk.verification_status = '{v_status}', u.kyc = '{v_status}'
                WHERE uk.id = '{kyc_id}' """
            cursor.execute(sql_query)
            return {''
                    "status": True,
                    "message": "User Kyc status changed successfully"
                    }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_kyc_data(status):
    try:
        with connection.cursor() as cursor:
            kyc_data_query = f""" SELECT 
                kyc.id, kyc.uid, kyc.full_name, kyc.dob, kyc.address_line1, 
                kyc.identification_proof1, kyc.identification_proof2, kyc.identification_number1, 
                kyc.identification_number2, kyc.identification_doc1, kyc.identification_doc2, 
                kyc.verification_status, users.profile_pic
                FROM user_kyc AS kyc
                INNER JOIN users ON kyc.uid = users.uid WHERE verification_status LIKE '{status}' ORDER BY 
                kyc.created_on DESC """

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


def filter_kyc():
    try:
        with connection.cursor() as cursor:
            kyc_data_query = """ SELECT 
                kyc.id, kyc.uid, kyc.full_name, kyc.dob, kyc.address_line1, 
                kyc.identification_proof1, kyc.identification_proof2, kyc.identification_number1, 
                kyc.identification_number2, kyc.identification_doc1, kyc.identification_doc2, 
                kyc.verification_status, users.profile_pic
                FROM user_kyc AS kyc
                INNER JOIN users ON kyc.uid = users.uid ORDER BY kyc.created_on DESC"""

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


def get_kyc_by_id(kyc_id):
    try:
        with connection.cursor() as cursor:
            sql_query = f""" SELECT uk.*, u.name FROM user_kyc AS uk 
            LEFT JOIN users AS u ON uk.uid = u.uid
            WHERE uk.id = '{kyc_id}'"""
            cursor.execute(sql_query)
            kyc_data = cursor.fetchone()
            if kyc_data is not None:
                return {
                    "status": True,
                    "kyc": responsegenerator.responseGenerator.generateResponse(kyc_data, KYC_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "KYC": None
                }, 301
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
                cursor.execute('UPDATE bank_details SET status = 0 WHERE uid = %s AND status = 1',
                               (bank_obj.uid,))
                sql_query = """
                INSERT INTO bank_details (uid, bank_name, ifsc_code, account_holder_name, account_number, 
                    status, added_by, modified_on, modified_by)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE
                bank_name = VALUES(bank_name),
                ifsc_code = VALUES(ifsc_code),
                account_holder_name = VALUES(account_holder_name),
                account_number = VALUES(account_number),
                status = VALUES(status),
                added_by = VALUES(added_by),
                modified_on = VALUES(modified_on),
                modified_by = VALUES(modified_by)
                """
                values = (bank_obj.uid, bank_obj.bank_name, bank_obj.ifsc_code, bank_obj.account_holder_name,
                          bank_obj.account_number, True, bank_obj.added_by, today, bank_obj.added_by)
                cursor.execute(sql_query, values)

                KYC_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
                                            VALUES ('{bank_obj.uid}', 'KYC',
                                            'Linked {bank_obj.bank_name} Bank for {bank_obj.account_holder_name}',
                                            'Your {bank_obj.bank_name} bank with acc no: {bank_obj.account_number} is linked ')"""
                cursor.execute(KYC_notification_query)

                fcm_query = f"""SELECT fcm_token FROM users WHERE uid = '{bank_obj.uid}' """
                cursor.execute(fcm_query)
                fcm_token = cursor.fetchone()
                title = f"Bank Linked"
                message = f""" Your {bank_obj.bank_name} bank with acc no: {bank_obj.account_number} is linked """
                send_push_notification(fcm_token[0], title, message)

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


def edit_bank_details(bank_obj):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [bank_obj.uid])
            user = cursor.fetchone()
            if user is not None:
                edit_bank_query = """UPDATE bank_details SET bank_name = %s, ifsc_code = %s, account_holder_name = %s, 
                                account_number = %s, modified_on = %s, modified_by = %s WHERE uid = %s"""
                values = (bank_obj.bank_name, bank_obj.ifsc_code, bank_obj.account_holder_name, bank_obj.account_number,
                          today, bank_obj.modified_by, bank_obj.uid)
                cursor.execute(edit_bank_query, values)

                KYC_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
                                                            VALUES ('{bank_obj.uid}', 'KYC',
                                                            'Linked {bank_obj.bank_name} Bank for {bank_obj.account_holder_name}',
                                                            'Your {bank_obj.bank_name} bank with acc no: {bank_obj.account_number} is linked ')"""
                cursor.execute(KYC_notification_query)

                fcm_query = f"""SELECT fcm_token FROM users WHERE uid = '{bank_obj.uid}' """
                cursor.execute(fcm_query)
                fcm_token = cursor.fetchone()
                title = f"Bank Updated"
                message = f""" Your {bank_obj.bank_name} bank with acc no: {bank_obj.account_number} is Updated """
                send_push_notification(fcm_token[0], title, message)

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


def get_bank_by_id(bnk_id):
    try:
        with connection.cursor() as cursor:
            bank_data_query = f""" SELECT bd.* ,u.name  FROM bank_details AS bd 
            LEFT JOIN users AS u ON bd.uid = u.uid
             WHERE bd.id = '{bnk_id}'"""
            cursor.execute(bank_data_query)
            bank_data = cursor.fetchone()
            if bank_data is not None:
                return {
                    "status": True,
                    "banks": responsegenerator.responseGenerator.generateResponse(bank_data, BANK_DETAILS_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "bank_details": None
                }, 301
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_all_bank_data(status):
    try:
        with connection.cursor() as cursor:
            bank_data_query = f""" SELECT bnk.id, bnk.uid, bnk.ifsc_code, bnk.bank_name, bnk.account_holder_name,
                bnk.account_number, bnk.status, users.profile_pic
                FROM bank_details AS bnk
                LEFT JOIN users ON bnk.uid = users.uid WHERE bnk.status LIKE '{status}' ORDER BY bnk.created_on DESC """
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


def add_employee(emp_obj):
    # Hash the password using bcrypt
    hashed_password = bcrypt.hashpw(emp_obj.password.encode('utf-8'), bcrypt.gensalt())
    try:
        with connection.cursor() as cursor:
            add_emp_query = """INSERT INTO users (uid, name, email, phone, created_on, status, role, city, password, profile_pic) 
                                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            values = (emp_obj.email, emp_obj.name, emp_obj.email, emp_obj.phone, today, True, 2,
                      emp_obj.city, hashed_password , 'images/profile_pic/profile.png')
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


def add_admin(emp_obj):
    # Hash the password using bcrypt
    hashed_password = bcrypt.hashpw(emp_obj.password.encode('utf-8'), bcrypt.gensalt())
    try:
        with connection.cursor() as cursor:
            add_emp_query = """INSERT INTO users (uid, name, email, phone, created_on, status, role, city, password, profile_pic) 
                                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
            values = (emp_obj.email, emp_obj.name, emp_obj.email, emp_obj.phone, today, True, 1,
                      emp_obj.city, hashed_password, 'images/profile_pic/profile.png')
            cursor.execute(add_emp_query, values)
            return {
                "status": True,
                "message": "Admin added successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e), "user": None}, 301
    except Exception as e:
        return {"status": False, "message": str(e), "user": None}, 301


def edit_employee(emp_obj, user_id):
    try:
        with connection.cursor() as cursor:
            edit_emp_query = f"""UPDATE users SET name = '{emp_obj.name}', email = '{emp_obj.email}', 
                                phone = '{emp_obj.phone}', city = '{emp_obj.city}'
                                WHERE id = '{user_id}'"""
            cursor.execute(edit_emp_query)
            return {
                "status": True,
                "message": "Employee edited successfully"
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def enable_disable_employee(uid, status):
    try:
        with connection.cursor() as cursor:
            disable_emp_query = "UPDATE users SET status = %s WHERE id = %s"
            values = (status, uid)
            cursor.execute(disable_emp_query, values)
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
            users_data_query = """ SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 2 ORDER BY created_on DESC"""
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


def get_all_admins():
    try:
        with connection.cursor() as cursor:
            users_data_query = """ SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 1 ORDER BY created_on DESC """
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


def dashboard_search_employee(search):
    try:
        with connection.cursor() as cursor:
            users_data_query = f""" SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 2 AND ( id LIKE '%{search}%' OR name LIKE '%{search}%' OR phone 
                LIKE '%{search}%') ORDER BY created_on DESC"""
            cursor.execute(users_data_query)
            user_data = cursor.fetchall()
            print(user_data)
            return {
                "status": True,
                "user_data": responsegenerator.responseGenerator.generateResponse(user_data, ALL_USERS_DATA)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def dashboard_search_employee_status(status):
    try:
        with connection.cursor() as cursor:
            users_data_query = f""" SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 2 AND status = '{status}' ORDER BY created_on DESC"""
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
        emp_login_query = """SELECT password, name, profile_pic, role FROM users WHERE uid = %s AND 
                            ( role = 2 OR role = 1 );"""
        cursor.execute(emp_login_query, [uname])
        result = cursor.fetchone()
        print(result)
        if result is not None:
            stored_password = result[0].encode('utf-8')
            if bcrypt.checkpw(pwd.encode('utf-8'), stored_password):
                return {
                    "msg": "Success",
                    "data": result[0],
                    "name": result[1],
                    "profile_pic": result[2],
                    "role": result[3]
                }
            else:
                return {
                    "msg": "Invalid Password, please try again"
                }
        else:
            return {
                "msg": "Invalid Credentials, please try again"
            }


def get_employee_by_id(emp_id):
    try:
        with connection.cursor() as cursor:
            emp_data_query = f""" SELECT id,uid,name,email,phone,profile_pic,created_on,status,role,city
             FROM users WHERE id = '{emp_id}'"""
            cursor.execute(emp_data_query)
            emp_data = cursor.fetchone()
            if emp_data is not None:
                return {
                    "status": True,
                    "emp": responsegenerator.responseGenerator.generateResponse(emp_data, EMPLOYEE_BY_ID)
                }, 200
            else:
                return {
                    "status": False,
                    "employee": None
                }, 301
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_user_profile(uid):
    try:
        with connection.cursor() as cursor:
            user_data_query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(user_data_query, [uid])
            user_data = cursor.fetchone()

            sql_query_events = f"""
                            SELECT count(*) FROM event 
                            WHERE JSON_CONTAINS(event_admin, %(uid_json)s)
                        """
            uid_json = json.dumps({'uid': uid})
            cursor.execute(sql_query_events, {'uid_json': uid_json})
            events_count = cursor.fetchone()

            count_sql_query = f"""
                    SELECT
                        COUNT(DISTINCT bank_details.id) AS bank_details_count,
                        COALESCE((SELECT SUM(shagun_amount) FROM transaction_history WHERE sender_uid = '{uid}'), 0) 
                        AS total_sent_amount,
                        COALESCE((SELECT SUM(shagun_amount) FROM transaction_history WHERE receiver_uid = '{uid}'), 0) 
                        AS total_received_amount
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
                                SELECT bd.bank_name, bd.account_number, bd.ifsc_code, bd.status
                                FROM bank_details bd
                                WHERE bd.uid = '{uid}'
                            """
            cursor.execute(bank_sql_query)
            bank_data = cursor.fetchall()

            get_kyc_request_query = f"SELECT * FROM user_callback_request WHERE uid = '{uid}' AND status = 0 AND type = 'KYC' "
            cursor.execute(get_kyc_request_query)
            kyc_request = cursor.fetchone()
            if kyc_request:
                is_active_kyc_request = True
            else:
                is_active_kyc_request = False

            return {
                "status": True,
                "message": "User found",
                "events_count": events_count[0],
                "is_active_kyc_request": is_active_kyc_request,
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


def disable_bank(bank_id, status):
    try:
        with connection.cursor() as cursor:
            disable_bank_query = "UPDATE bank_details SET status = %s WHERE id = %s"

            if status == 1:
                cursor.execute('UPDATE bank_details SET status = 0 WHERE uid = %s AND status = 1',
                               (bank_id,))

            values = (status, bank_id)
            cursor.execute(disable_bank_query, values)
            return {
                "status": True,
                "message": "Bank status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def edit_user_kyc(obj):
    try:
        with connection.cursor() as cursor:
            # Prepare the SQL query for updating the data
            sql = "UPDATE user_kyc SET "
            values = []

            # Check each field in the object and update the SQL query accordingly
            if obj.identification_doc1 is None and obj.identification_doc2 is None:
                sql += "full_name=%s, gender=%s, dob=%s, identification_proof1=%s, identification_number1=%s, "
                sql += "identification_proof2=%s, identification_number2=%s, address_line1=%s, state=%s,  "
                sql += "address_line2=%s, postcode=%s, city=%s, country=%s, updated_by=%s,updated_on=%s WHERE id=%s"
                values.extend([
                    obj.full_name, obj.gender, obj.dob, obj.identification_proof1, obj.identification_number1,
                    obj.identification_proof2, obj.identification_number2, obj.adress1, obj.state, obj.adress2,
                    obj.postcode, obj.city, obj.country, obj.modified_by_uid, today.now(), obj.id
                ])
            elif obj.identification_doc1 is None:
                sql += "full_name=%s, gender=%s, dob=%s, identification_proof1=%s, identification_number1=%s, "
                sql += "address_line1=%s, state=%s, address_line2=%s, postcode=%s, city=%s, country=%s,  "
                sql += "identification_doc2=%s, updated_by=%s,updated_on=%s WHERE id=%s"
                values.extend([
                    obj.full_name, obj.gender, obj.dob, obj.identification_proof1, obj.identification_number1,
                    obj.adress1, obj.state, obj.adress2, obj.postcode, obj.city, obj.country,
                    obj.identification_doc2, obj.modified_by_uid, today.now(), obj.id
                ])
            elif obj.identification_doc2 is None:
                sql += "full_name=%s, gender=%s, dob=%s, identification_proof1=%s, identification_number1=%s, "
                sql += "identification_proof2=%s, identification_number2=%s, address_line1=%s, state=%s, address_line2=%s, "
                sql += "postcode=%s, city=%s, country=%s, identification_doc1=%s, updated_by=%s,updated_on=%s WHERE id=%s"
                values.extend([
                    obj.full_name, obj.gender, obj.dob, obj.identification_proof1, obj.identification_number1,
                    obj.identification_proof2, obj.identification_number2, obj.adress1, obj.state, obj.adress2,
                    obj.postcode, obj.city, obj.country, obj.identification_doc1, obj.modified_by_uid, today.now(),
                    obj.id
                ])
            else:
                # Handle the case where both identification_doc1 and identification_doc2 are not None
                sql += "full_name=%s, gender=%s, dob=%s, identification_proof1=%s, identification_number1=%s, "
                sql += "identification_proof2=%s, identification_number2=%s, address_line1=%s, state=%s, address_line2=%s, "
                sql += "postcode=%s, city=%s, country=%s, identification_doc1=%s, identification_doc2=%s, updated_by=%s,updated_on=%s WHERE id=%s"
                values.extend([
                    obj.full_name, obj.gender, obj.dob, obj.identification_proof1, obj.identification_number1,
                    obj.identification_proof2, obj.identification_number2, obj.adress1, obj.state, obj.adress2,
                    obj.postcode, obj.city, obj.country, obj.identification_doc1, obj.identification_doc2,
                    obj.modified_by_uid, today.now(), obj.id
                ])

            cursor.execute(sql, values)
            KYC_notification_query = f"""INSERT INTO notification (uid, type, title, message) 
                                        VALUES ('{obj.uid}', 'KYC',
                                        'KYC Updated for {obj.full_name}',
                                        'KYC updated with {obj.identification_proof1}:{obj.identification_number1} and {obj.identification_proof2}:{obj.identification_number2}')"""
            cursor.execute(KYC_notification_query)

            fcm_query = f"""SELECT fcm_token FROM users WHERE uid = '{obj.uid}' """
            cursor.execute(fcm_query)
            fcm_token = cursor.fetchone()
            title = f"KYC Updated"
            message = f""" KYC Updated with {obj.identification_proof1}:{obj.identification_number1} and 
                                            {obj.identification_proof2}:{obj.identification_number2} """
            send_push_notification(fcm_token[0], title, message)
            connection.commit()
            return {
                "status": True,
                "message": "KYC status changed successfully"
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301

    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def get_user_requests(param):
    print(param)
    try:
        with connection.cursor() as cursor:
            request_query = f"""
                            SELECT
                                u.name, u.phone, u.profile_pic, ucr.type,
                                ucr.status, ucr.created_on, ucr.id,
                                ucr.event_date, ucr.event_type, l.city_name, u.email
                            FROM
                                user_callback_request AS ucr
                            LEFT JOIN
                                users AS u ON ucr.uid = u.uid
                            LEFT JOIN
                                locations AS l ON ucr.city = l.id
                            WHERE
                                ucr.type = '{param}' AND u.role = 3 ORDER BY ucr.status ASC ;
                        """

            cursor.execute(request_query)
            reso = request_list = cursor.fetchall()
            print(reso)
            return {
                "status": True,
                "req_list": responsegenerator.responseGenerator.generateResponse(request_list, REQUEST_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def search_user_requests(param, search):
    try:
        with connection.cursor() as cursor:
            request_query = f"""
                            SELECT
                                u.name, u.phone, u.profile_pic, ucr.type,
                                ucr.status, ucr.created_on, ucr.id,
                                ucr.event_date, ucr.event_type, l.city_name, u.email
                            FROM
                                user_callback_request AS ucr
                            LEFT JOIN
                                users AS u ON ucr.uid = u.uid
                            LEFT JOIN
                                locations AS l ON ucr.city = l.id
                            WHERE
                                ucr.type = '{param}' AND u.role = 3 AND ( u.name LIKE '%{search}%' OR 
                                u.phone LIKE '%{search}%' OR u.email LIKE '%{search}%') ORDER BY ucr.created_on DESC;
                        """

            cursor.execute(request_query)
            request_list = cursor.fetchall()
            return {
                "status": True,
                "req_list": responsegenerator.responseGenerator.generateResponse(request_list, REQUEST_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def filter_user_requests(param, status):
    try:
        with connection.cursor() as cursor:
            request_query = f"""
                            SELECT
                                u.name, u.phone, u.profile_pic, ucr.type,
                                ucr.status, ucr.created_on, ucr.id,
                                ucr.event_date, ucr.event_type, l.city_name, u.email
                            FROM
                                user_callback_request AS ucr
                            LEFT JOIN
                                users AS u ON ucr.uid = u.uid
                            LEFT JOIN
                                locations AS l ON ucr.city = l.id
                            WHERE
                                ucr.type = '{param}' AND u.role = 3 AND ucr.status = '{status}' 
                                ORDER BY ucr.created_on DESC;
                        """

            cursor.execute(request_query)
            request_list = cursor.fetchall()
            return {
                "status": True,
                "req_list": responsegenerator.responseGenerator.generateResponse(request_list, REQUEST_LIST)
            }, 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


def search_kyc_data(search):
    try:
        with connection.cursor() as cursor:
            kyc_data_query = f""" SELECT 
                kyc.id, kyc.uid, kyc.full_name, kyc.dob, kyc.address_line1, 
                kyc.identification_proof1, kyc.identification_proof2, kyc.identification_number1, 
                kyc.identification_number2, kyc.identification_doc1, kyc.identification_doc2, 
                kyc.verification_status, users.profile_pic
                FROM user_kyc AS kyc
                INNER JOIN users ON kyc.uid = users.uid WHERE ( kyc.id LIKE '%{search}%' OR kyc.full_name LIKE '%{search}%' OR 
                kyc.identification_number1 LIKE '%{search}%' OR kyc.identification_number2 LIKE '%{search}%') 
                ORDER BY kyc.created_on DESC"""

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


def dashboard_search_bank(search):
    try:
        with connection.cursor() as cursor:
            bank_data_query = f""" SELECT bnk.id, bnk.uid, bnk.ifsc_code, bnk.bank_name, bnk.account_holder_name,
                bnk.account_number, bnk.status, users.profile_pic
                FROM bank_details AS bnk
                LEFT JOIN users ON bnk.uid = users.uid WHERE bnk.id = '{search}' OR ( ifsc_code LIKE '%{search}%' OR 
                account_holder_name LIKE '%{search}%' OR account_number LIKE '%{search}%') ORDER BY bnk.created_on DESC"""
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


def dashboard_search_user(search):
    try:
        with connection.cursor() as cursor:
            users_data_query = f""" SELECT id, uid, name, email, phone, auth_type, kyc, profile_pic, created_on, status, role
                FROM users WHERE role = 3 AND ( name LIKE '%{search}%' OR 
                email LIKE '%{search}%' OR phone LIKE '%{search}%') ORDER BY created_on DESC"""
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
