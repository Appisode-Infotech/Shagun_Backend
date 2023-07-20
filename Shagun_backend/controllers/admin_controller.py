import pymysql
from django.db import connection
from Shagun_backend.util import responsegenerator

from Shagun_backend.util.constants import today, EVENT_LIST


def admin_dashboard(uid):
    try:
        with connection.cursor() as cursor:
            transaction_stats_query = f"""
                SELECT 
                    SUM(CASE WHEN DATE(created_on) = '{today.date()}' THEN transaction_amount ELSE 0 END) AS sum_today,
                    SUM(transaction_amount) AS total_sum,
                    SUM(shagun_amount) AS total_shagun_amount,
                    SUM(transaction_fee) AS total_transaction_fee
                FROM transaction_history;
                """
            cursor.execute(transaction_stats_query)
            transaction_stats = cursor.fetchone()

            event_stats_query = f"""
                SELECT 
                    COUNT(*) AS total_events,
                    CAST(SUM(DATE(event_date) = '{today.date()}') AS SIGNED) AS events_created_today
                FROM event;
                """
            cursor.execute(event_stats_query)
            event_stats = cursor.fetchone()

            today_events_query = f"""
                            SELECT event.event_date, event.event_admin, events_type.event_type_name, event.id,
                            event.is_approved, event.status FROM event 
                            JOIN events_type ON event.event_type_id = events_type.id 
                            WHERE DATE(event_date) = '{today.date()}';
                            """
            cursor.execute(today_events_query)
            today_event_stats = cursor.fetchall()

            return {
                "status": True,
                "todays_transactions": transaction_stats[0],
                "total_transactions": transaction_stats[1],
                "total_shagun": transaction_stats[2],
                "total_fees": transaction_stats[3],
                "total_events": event_stats[0],
                "today_created_events": event_stats[1],
                "events": responsegenerator.responseGenerator.generateResponse(today_event_stats, EVENT_LIST)

            }
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
