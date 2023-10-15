import pymysql
from django.db import connection

from Shagun_backend.controllers.credentials import get_credentials
from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import APP_COMPATIBILITY, getIndianTime

# def app_compatibility(app_obj):
#     try:
#         with connection.cursor() as cursor:
#             app_compatibility_query = """SELECT app_name, min_version, latest_version, platform, created, updated
#                                         FROM  version_details WHERE app_name = %s AND platform = %s"""
#             cursor.execute(app_compatibility_query, ([app_obj.app_name, app_obj.platform]))
#             response = cursor.fetchone()
#             return responsegenerator.responseGenerator.generateResponse(response, APP_COMPATIBILITY), 200
#
#     except pymysql.Error as e:
#         return {"status": False, "message": str(e)}, 301
#     except Exception as e:
#         return {"status": False, "message": str(e)}, 301


def app_compatibility(app_obj):
    try:
        app_data = get_credentials()
        if app_obj.platform == "android":
            return {
                "app_name": app_data.get('android_app_name'),
                "min_version": app_data.get('android_min_version'),
                "latest_version": app_data.get('android_max_version'),
                "platform": app_data.get('android'),
                "created": getIndianTime(),
                "updated": getIndianTime(),
            }, 200
        else:
            return {
                "app_name": app_data.get('ios_app_name'),
                "min_version": app_data.get('ios_min_version'),
                "latest_version": app_data.get('ios_max_version'),
                "platform": app_data.get('ios'),
                "created": getIndianTime(),
                "updated": getIndianTime(),
            }, 200

    except Exception as e:
        return {"status": False, "message": str(e)}, 301
