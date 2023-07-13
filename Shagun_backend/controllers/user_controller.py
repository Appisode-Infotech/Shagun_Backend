import pymysql
from django.db import connection
from datetime import datetime
from Shagun_backend.util.constants import CHECK_USER
from Shagun_backend.util.responsegenerator import responseGenerator


def check_user_exist(username):
    try:
        with connection.cursor() as cursor:
            query = "SELECT * FROM users WHERE uid = %s;"
            cursor.execute(query, [username])
            result = cursor.fetchone()
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
            sql_query = "INSERT INTO users (name, email, phone, kyc, profile_pic, uid, status, auth_type, role)" \
                        " VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (reg_obj.name, reg_obj.email, reg_obj.phone, False, reg_obj.profile, reg_obj.uid, True,
                      reg_obj.auth_type, reg_obj.role)
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
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301


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
                          'pending', datetime.now())
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
                              datetime.now(), kyc_obj.uid)

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
                          True, bank_obj.added_by, datetime.now())
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
                          True, bank_obj.added_by, datetime.now(), bank_obj.uid)
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

