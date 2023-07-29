import pymysql
from django.db import connection

from Shagun_backend.util import responsegenerator
from Shagun_backend.util.constants import APP_COMPATIBILITY


def app_compatibility(app_obj):
    try:
        with connection.cursor() as cursor:
            app_compatibility_query = "SELECT app_name, min_version, latest_version, platform, created, updated FROM  " \
                        " version_details WHERE app_name = %s AND platform = %s"
            cursor.execute(app_compatibility_query, ([app_obj.app_name, app_obj.platform]))
            response = cursor.fetchone()
            return responsegenerator.responseGenerator.generateResponse(response, APP_COMPATIBILITY), 200

    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
