import json

from Shagun_backend.util.constants import *


class responseGenerator:
    @classmethod
    def generateResponse(cls, data, controller_type):
        if controller_type == CHECK_USER:
            return {
                "id": data[0],
                "name": data[2],
                "email": data[3],
                "phone": data[4],
                "Kyc": data[6],
                "profile": data[7],
                "user_id": data[1],
                "created_on": data[8],
                "user_status": data[9]
            }

        if controller_type == EMPLOYEE_BY_ID:
            return {
                "id": data[0],
                "uid": data[1],
                "name": data[2],
                "email": data[3],
                "phone": data[4],
                "profile_pic": data[5],
                "created_on": data[6],
                "status": data[7],
                "role": data[8],
                "city": data[9],
                "password": data[10]
            }

        if controller_type == EVENT_LIST:
            event_list = []
            for events in data:
                event_list.append(
                    {
                        "event_date": events[0],
                        "event_name": events[2],
                        "admins": json.loads(events[1]),
                        "event_id": events[3],
                        "is_approved": events[4],
                        "status": events[5],
                        "total_recieved_amount": events[6],
                        "total_senders_count": events[7]
                    }
                )
            return event_list

        if controller_type == DASHBOARD_EVENT_LIST:
            event_list = []
            for events in data:
                event_list.append(
                    {
                        "event_date": events[0],
                        "event_name": events[2],
                        "admins": json.loads(events[1]),
                        "event_id": events[3],
                        "is_approved": events[4],
                        "status": events[5]
                    }
                )
            return event_list

        if controller_type == SEARCH_EVENT_LIST:
            event_list = []
            for events in data:
                event_list.append(
                    {
                        "event_date": events[0],
                        "event_name": events[2],
                        "admins": json.loads(events[1]),
                        "event_id": events[3],
                        "is_approved": events[4],
                        "status": events[5],
                        "phone": events[6]
                    }
                )
            return event_list

        if controller_type == ALL_EVENT_LIST:
            event_list = []
            for events in data:
                event_list.append(
                    {
                        "event_date": events[0],
                        "event_name": events[2],
                        "admins": json.loads(events[1]),
                        "event_id": events[3],
                        "is_approved": events[4],
                        "status": events[5]
                    }
                )
            return event_list

        if controller_type == EVENT_ADMIN:
            return {
                "admins": json.loads(data[0])

            }

        if controller_type == ACTIVE_EVENT:
            active_event = []
            for events in data:
                active_event.append(
                    {
                        "id": events[0],
                        "created_by_uid": events[1],
                        "event_type_id": events[2],
                        "city_id": events[3],
                        "address_line1": events[4],
                        "address_line2": events[5],
                        "event_lat_lng": events[6],
                        "created_on": events[7],
                        "sub_events": json.loads(events[8]),
                        "event_date": events[9],
                        "event_note": events[10],
                        "event_admin": json.loads(events[11]),
                        "is_approved": events[12],
                        "approved_by": events[13],
                        "printer_id": events[14],
                        "approved_date_time": events[15],
                        "status": events[16],
                        "total_received_amount": round(events[18], 2),
                        "balance_shagun_amount": round(events[19], 2),
                        "settled_amount": round(events[20], 2),
                        "event_type_name": events[21]
                    }
                )
            return active_event

        if controller_type == EVENT_BY_ID:
            return {
                "id": data[0],
                "created_by_uid": data[1],
                "event_type_id": data[2],
                "city_id": data[3],
                "address_line1": data[4],
                "address_line2": data[5],
                "event_lat_lng": data[6],
                "created_on": data[7],
                "sub_events": json.loads(data[8]),
                "event_date": data[9].strftime('%Y-%m-%dT%H:%M'),
                "event_note": data[10],
                "event_admin": json.loads(data[11]),
                "is_approved": data[12],
                "approved_by": data[13],
                "printer_id": data[14],
                "approved_date_time": data[15],
                "status": data[16],
                "delivery_fee": data[17],
                "event_type_name": data[18],
                "city_name": data[19],
                "store_name": data[20]
            }

        if controller_type == GIFT_EVENT:
            return {
                "id": data[0],
                "created_by_uid": data[1],
                "event_type_id": data[2],
                "city_id": data[3],
                "address_line1": data[4],
                "address_line2": data[5],
                "event_lat_lng": data[6],
                "created_on": data[7],
                "sub_events": json.loads(data[8]),
                "event_date": data[9],
                "event_note": data[10],
                "event_admin": json.loads(data[11]),
                "is_approved": data[12],
                "approved_by": data[13],
                "printer_id": data[14],
                "approved_date_time": data[15],
                "status": data[16],
                "uid": data[17]
            }

        if controller_type == EVENT_TYPE_LIST:
            event_type_list = []
            for event_type in data:
                event_type_list.append(
                    {
                        "id": event_type[0],
                        "event_type_name": event_type[1]
                    })
            return event_type_list

        if controller_type == EVENT_TYPE_BY_ID:
            return {
                "id": data[0],
                "event_type_name": data[1]
            }

        if controller_type == APP_COMPATIBILITY:
            return {
                "app_name": data[0],
                "min_version": data[1],
                "latest_version": data[2],
                "platform": data[3],
                "created": data[4],
                "updated": data[5],
            }

        if controller_type == USER_HOME_PAGE:
            total_recieved_amount = 0
            total_sent_amount = 0
            events_invite_list = []
            for invites in data:
                events_invite_list.append(
                    {
                        "event_name": invites[0],
                        "event_date": invites[1],
                        "event_id": invites[3],
                        "is_gifted": invites[4],
                        "event_admins": json.loads(invites[2]),
                        "invited_by": invites[5],
                        "invited_by_name": invites[6],
                        "invited_by_profile": invites[7]
                    }
                )

            return total_sent_amount, total_recieved_amount, events_invite_list

        if controller_type == GIFT_SENT:
            sent_gift = []
            total_gift_amount = 0
            for sent in data:
                total_gift_amount = sent[11]
                sent_gift.append(
                    {
                        "receiver_uid": sent[0],
                        "sender_uid": sent[1],
                        "name": sent[12],
                        "shagun_amount": sent[2],
                        "transaction_amount": sent[3],
                        "transaction_fee": sent[4],
                        "delivery_fee": sent[5],
                        "created_on": sent[6],
                        "card_price": sent[7],
                        "event_type_name": sent[8],
                        "id": sent[9],
                        "settlement_status": sent[10],
                        "bank_name": sent[13],
                        "bank_logo": sent[14],
                        "acc_no": sent[15],
                        "profile_pic": sent[16]
                    }
                )
            return total_gift_amount, sent_gift

        if controller_type == GREETING_CARDS:
            greeting_cards = []
            for cards in data:
                greeting_cards.append(
                    {
                        "card_name": cards[0],
                        "card_image_url": cards[1],
                        "card_price": cards[2],
                        "card_id": cards[3],
                        "card_status": cards[4]
                    }
                )
            return greeting_cards

        if controller_type == GREETING_CARDS_BY_ID:
            return {
                "id": data[0],
                "card_name": data[1]
            }

        if controller_type == TRACK_ORDER:
            track_order = []
            for order in data:
                track_order.append(
                    {
                        "tid": order[1],
                        "status": order[2],
                        "date": order[3]
                    }
                )
            return track_order

        if controller_type == ALL_EVENT_TYPE_LIST:
            event_type_lists = []
            for event_type in data:
                event_type_lists.append(
                    {
                        "event_type_id": event_type[0],
                        "event_type_name": event_type[1],
                        "status": event_type[2]
                    }
                )
            return event_type_lists

        if controller_type == ALL_LOCATION_LIST:
            location_lists = []
            for event_type in data:
                location_lists.append(
                    {
                        "location_id": event_type[0],
                        "location_name": event_type[1],
                        "status": event_type[2]
                    }
                )
            return location_lists

        if controller_type == LOCATION_BY_ID:
            return {
                "id": data[0],
                "city_name": data[1]
            }

        if controller_type == ALL_KYC_DATA:
            kyc_data = []
            for kyc in data:
                kyc_data.append(
                    {
                        "id": kyc[0],
                        "uid": kyc[1],
                        "full_name": kyc[2],
                        "dob": kyc[3],
                        "permanent_address": kyc[4],
                        "identification_proof1": kyc[5],
                        "identification_proof2": kyc[6],
                        "identification_number1": kyc[7],
                        "identification_number2": kyc[8],
                        "identification_doc1": kyc[9],
                        "identification_doc2": kyc[10],
                        "verification_status": kyc[11],
                        "profile_pic": kyc[12]

                    }
                )
            return kyc_data

        if controller_type == KYC_BY_ID:
            return {
                "id": data[0],
                "uid": data[1],
                "full_name": data[2],
                "dob": data[3],
                "gender": data[4],
                "address_line1": data[5],
                "address_line2": data[6],
                "city": data[7],
                "state": data[8],
                "postcode": data[9],
                "country": data[10],
                "identification_proof1": data[11],
                "identification_proof2": data[12],
                "identification_number1": data[13],
                "identification_number2": data[14],
                "identification_doc1": data[15],
                "identification_doc2": data[16],
                "verification_status": data[17],
                "created_on": data[18],
                "created_by": data[19],
                "updated_by": data[20],
                "updated_on": data[21],
                "approved_by": data[22],
                "approved_on": data[23],
                "username": data[24]
            }

        if controller_type == ALL_BANK_DATA:
            bank_data = []
            for bank in data:
                bank_data.append(
                    {
                        "id": bank[0],
                        "uid": bank[1],
                        "ifsc_code": bank[2],
                        "bank_name": bank[3],
                        "account_holder_name": bank[4],
                        "account_number": bank[5],
                        "status": bank[6],
                        "profile_pic": bank[7]

                    }
                )
            return bank_data

        if controller_type == BANK_DETAILS_BY_ID:
            return {
                "id": data[0],
                "uid": data[1],
                "bank_name": data[2],
                "bank_logo": data[3],
                "ifsc_code": data[4],
                "account_holder_name": data[5],
                "account_number": data[6],
                "status": data[7],
                "created_on": data[8],
                "added_by": data[9],
                "modified_on": data[10],
                "modified_by": data[11],
                "name": data[12]

            }

        if controller_type == ALL_USERS_DATA:
            user_data = []
            for user in data:
                user_data.append(
                    {
                        "id": user[0],
                        "uid": user[1],
                        "name": user[2],
                        "email": user[3],
                        "phone": user[4],
                        "auth_type": user[5],
                        "kyc": user[6],
                        "profile_pic": user[7],
                        "created_on": user[8],
                        "status": user[9],
                        "role": user[10]

                    }
                )
            return user_data

        if controller_type == GET_USERS_BY_NAME_OR_PHONE:
            get_users_by_name_or_phone = []
            for user in data:
                get_users_by_name_or_phone.append(
                    {
                        "id": user[0],
                        "uid": user[1],
                        "name": user[2],
                        "phone": user[4],
                        "profile_pic": user[7]

                    }
                )
            return get_users_by_name_or_phone

        if controller_type == ALL_PRINTERS_DATA:
            printer_data = []
            for printer in data:
                printer_data.append(
                    {
                        "id": printer[0],
                        "store_name": printer[1],
                        "city": printer[2],
                        "address": printer[3],
                        "status": printer[4],
                        "gst_no": printer[5],
                        "store_owner": printer[6],
                        "contact_number": printer[7]
                    }

                )
            return printer_data

        if controller_type == PRINTER_BY_ID:
            return {
                "id": data[0],
                "store_name": data[1],
                "city": data[2],
                "address": data[3],
                "lat_lng": data[4],
                "status": data[5],
                "gst_no": data[6],
                "store_owner": data[7],
                "contact_number": data[8],
                "printer_user_name": data[9],
                "printer_password": data[10],
                "city_name": data[11]

            }
        if controller_type == DELIVERY_VENDOR_DATA:
            return {
                "id": data[0],
                "delivery_vendor_name": data[1],
                "city": data[2],
                "address": data[3],
                "lat_lng": data[4],
                "status": data[5],
                "gst_no": data[6],
                "delivery_vendor_owner": data[7],
                "contact_number": data[8],
                "created_by": data[9],
                "created_on": data[10],
                "city_name": data[11]
            }

        if controller_type == ALL_JOBS:
            jobs_data = []
            for jobs in data:
                jobs_data.append(
                    {
                        "id": jobs[0],
                        "transaction_id": jobs[1],
                        "printer_id": jobs[2],
                        "card_id": jobs[3],
                        "status": jobs[4],
                        "created_on": jobs[5],
                        "last_modified": jobs[6],
                        "billing_amount": jobs[7],
                        "event_id": jobs[8],
                        "wish": jobs[9],
                        "store_name": jobs[10],
                        "event_type_name": jobs[11],
                        "card_name": jobs[12],
                        "card_image_url": jobs[13],
                        "card_price": jobs[14],
                        "event_date": jobs[15]

                    }
                )
            return jobs_data

        if controller_type == INVITED_EVENT_LIST:
            events_invite_list = []
            for invites in data:
                events_invite_list.append(
                    {
                        "event_name": invites[0],
                        "event_date": invites[1],
                        "event_id": invites[3],
                        "is_gifted": invites[4],
                        "event_admins": json.loads(invites[2]),
                        "invited_by": invites[5],
                        "invited_by_name": invites[6],
                        "invited_by_profile": invites[7]
                    }
                )
            return events_invite_list

        if controller_type == GET_BANK_DATA:
            bank_data = []
            for bank in data:
                bank_data.append(
                    {
                        "bank_name": bank[0],
                        "acc_no": bank[1],
                        "ifsc_code": bank[2],
                        "status": bank[3]
                    }

                )
            return bank_data

        if controller_type == GET_KYC_DATA:
            if data:
                return {
                    'doc_name': data[0][0],
                    'doc_num': data[0][2],
                    'doc_name1': data[0][1],
                    'doc_num1': data[0][3],
                    'status': data[0][4]
                }
            else:
                return {}

        if controller_type == BANK_LISTS:
            bank_lists = []
            for bank in data:
                bank_lists.append(
                    {
                        "bank_id": bank[0],
                        "bank_name": bank[1],
                        "bank_logo": bank[2],
                        "bank_status": bank[3]
                    }

                )
            return bank_lists

        if controller_type == ACTIVE_LOCATIONS_LIST:
            locations_lists = []
            for bank in data:
                locations_lists.append(
                    {
                        "city_id": bank[0],
                        "city_name": bank[1]
                    }

                )
            return locations_lists

        if controller_type == SINGLE_EVENT:
            return {
                "event_date": data[0],
                "event_note": data[2],
                "address_line1": data[3],
                "address_line2": data[4],
                "event_lat_lng": data[5],
                "event_type": data[7],
                "uid": data[8],
                "name": data[9],
                "event_id": data[10],
                "admins": json.loads(data[1]),
                "sub_events": json.loads(data[6]),
                "delivery_fee": data[11],
            }

        if controller_type == REQUEST_LIST:
            req_list = []
            for req in data:
                req_list.append(
                    {
                        "name": req[0],
                        "phone": req[1],
                        "profile": req[2],
                        "type": req[3],
                        "status": req[4],
                        "created_on": req[5],
                        "id": req[6],
                        "event_date": req[7],
                        "event_type": req[8],
                        "city_name": req[9],
                        "email": req[10],
                    }
                )
            return req_list

        if controller_type == Transaction_DATA:
            transaction_list = []
            for trans in data:
                transaction_list.append({
                    "id": trans[0],
                    "sender_uid": trans[1],
                    "receiver_uid": trans[2],
                    "transaction_amount": trans[3],
                    "shagun_amount": trans[4],
                    "greeting_card_id": trans[5],
                    "transaction_fee": trans[6],
                    "delivery_fee": trans[7],
                    "transaction_id": trans[8],
                    "payment_status": trans[9],
                    "event_id": trans[10],
                    "status": trans[11],
                    "is_settled": trans[12],
                    "receiver_bank_id": trans[13],
                    "created_on": trans[14],
                    "gifter_name": trans[15],
                    "card_price": trans[16],
                    "event_date": trans[17],
                    "event_type": trans[18],
                    "sender_name": trans[19],
                    "receiver_name": trans[20]
                }
                )
            return transaction_list

        if controller_type == INVITED_USERS_LIST:
            invited_users = []
            for users in data:
                invited_users.append(
                    {
                        "invited_to": users[0],
                        "invited_by": users[1],
                        "invite_msg": users[2],
                        "invited_on": users[3]
                    }
                )
            return invited_users

        if controller_type == INVITED_EVENTS_LIST:
            invited_events_list = []
            for invites in data:
                invited_events_list.append(
                    {
                        "event_name": invites[0],
                        "event_date": invites[1],
                        "event_id": invites[3],
                        "is_gifted": invites[4],
                        "event_admins": json.loads(invites[2]),
                        "invited_by": invites[5],
                        "invited_by_name": invites[6],
                        "invited_by_profile": invites[7]
                    }
                )
            return invited_events_list

        if controller_type == NOTIFICATION_LIST:
            notification_list = []
            for invites in data:
                notification_list.append(
                    {
                        "id": invites[0],
                        "uid": invites[1],
                        "type": invites[2],
                        "title": invites[3],
                        "message": invites[4],
                        "created_on": invites[5]
                    }
                )
            return notification_list
