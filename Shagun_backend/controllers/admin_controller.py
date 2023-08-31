import pymysql
from django.db import connection
from Shagun_backend.util import responsegenerator

from Shagun_backend.util.constants import *


def admin_dashboard(uid):
    try:
        with connection.cursor() as cursor:
            transaction_stats_query = f"""
                SELECT 
                    SUM(CASE WHEN DATE(created_on) = '{today.date()}' THEN transaction_amount ELSE 0 END) AS sum_today,
                    SUM(transaction_amount) AS total_sum,
                    SUM(shagun_amount) AS total_shagun_amount,
                    SUM(transaction_fee) AS total_transaction_fee,
                    SUM(CASE WHEN DATE(created_on) = '{today}' THEN shagun_amount ELSE 0 END) AS shagun_today
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
                            SELECT event.event_date, event.event_admin, et.event_type_name, event.id,
                            event.is_approved, event.status FROM event
                            LEFT JOIN events_type AS et ON event.event_type_id = et.id
                             WHERE DATE(event_date) = '{today.date()}' ORDER BY event.created_on DESC;
                            """
            cursor.execute(today_events_query)
            today_event_stats = cursor.fetchall()

            jobs_sql = """
                    SELECT
                        SUM(CASE WHEN `status` = 1 THEN 1 ELSE 0 END) AS new_count,
                        SUM(CASE WHEN `status` IN (2, 3, 4) THEN 1 ELSE 0 END) AS in_progress_count,
                        SUM(CASE WHEN `status` = 5 THEN 1 ELSE 0 END) AS completed_count,
                        COUNT(*) AS total_jobs
                    FROM
                        `print_jobs`
                    """

            cursor.execute(jobs_sql)
            job_stats = cursor.fetchone()

            events_sql = """
                        SELECT
                            SUM(CASE WHEN is_approved = 0 THEN 1 ELSE 0 END) AS pending_events,
                            SUM(CASE WHEN is_approved = 1 THEN 1 ELSE 0 END) AS approved_events,
                            SUM(CASE WHEN is_approved = 2 THEN 1 ELSE 0 END) AS rejected_events,
                            COUNT(*) AS total_events
                        FROM
                            event;
                        """
            cursor.execute(events_sql)
            events_stat = cursor.fetchone()

            vendors_sql = """
                        SELECT
                            (SELECT COUNT(*) FROM printer WHERE status = 1) AS active_printers,
                            (SELECT COUNT(*) FROM printer WHERE status = 0) AS inactive_printers,
                            (SELECT COUNT(*) FROM delivery_vendors WHERE status = 1) AS active_delivery_vendors,
                            (SELECT COUNT(*) FROM delivery_vendors WHERE status = 0) AS inactive_delivery_vendors;
                        """
            cursor.execute(vendors_sql)
            vendors_stat = cursor.fetchone()

            return {
                "status": True,
                "todays_transactions": round(transaction_stats[0], 2),
                "total_transactions": round(transaction_stats[1], 2),
                "total_shagun": round(transaction_stats[2], 2),
                "total_fees": round(transaction_stats[3], 2),
                "today_shagun": round(transaction_stats[4], 2),
                "today_created_events": event_stats[1],
                "events": responsegenerator.responseGenerator.generateResponse(today_event_stats, DASHBOARD_EVENT_LIST),
                "new_jobs": job_stats[0],
                "open_jobs": job_stats[1],
                "completed": job_stats[2],
                "total_jobs": job_stats[3],
                "pending_events": events_stat[0],
                "approved_events": events_stat[1],
                "rejected_events": events_stat[2],
                "total_events": events_stat[3],
                "active_printers": vendors_stat[0],
                "inactive_printers": vendors_stat[1],
                "active_delivery_vendors": vendors_stat[2],
                "inactive_delivery_vendors": vendors_stat[3]
            }, 200
    except pymysql.Error as e:
        return {"status": False, "message": str(e)}, 301
    except Exception as e:
        return {"status": False, "message": str(e)}, 301
