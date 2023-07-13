import json

from Shagun_backend.util.constants import CHECK_USER, EVENT_LIST, SINGLE_EVENT, APP_COMPATIBILITY, USER_HOME_PAGE, \
    GIFT_SENT, GREETING_CARDS, TRACK_ORDER


class responseGenerator:
    @classmethod
    def generateResponse(cls, data, controller_type):
        if controller_type == CHECK_USER:
            return {
                "name": data[2],
                "email": data[3],
                "phone": data[4],
                "Kyc": data[6],
                "profile": data[7],
                "user_id": data[1],
                "created_on": data[8]
            }

        if controller_type == EVENT_LIST:
            event_list = []
            for events in data:
                event_list.append(
                    {
                        "event_date": events[0],
                        "event_name": events[2],
                        "admins": json.loads(events[1])
                    }
                )
            return event_list

        if controller_type == SINGLE_EVENT:
            return {
                "event_date": data[0],
                "event_note": data[2],
                "address_line1": data[3],
                "address_line2": data[4],
                "event_lat_lng": data[5],
                "admins": json.loads(data[1]),
                "sub_events": json.loads(data[6])
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
            transaction_sent_list = []
            transaction_recieved_list = []
            events_invite_list = []
            for sent in data[0]:
                total_sent_amount = sent[5]
                transaction_sent_list.append(
                    {
                        "amount_sent": sent[0],
                        "event_name": sent[1],
                        "sent_to": sent[2],
                        "event_id": sent[3],
                        "profile_pic": sent[4]

                    }
                )

            for recieved in data[1]:
                total_recieved_amount = recieved[5]
                transaction_recieved_list.append(
                    {
                        "amount_received": recieved[0],
                        "even_name": recieved[1],
                        "received_from": recieved[2],
                        "event_id": recieved[3],
                        "profile_pic": recieved[4]
                    }
                )

            for invites in data[2]:
                events_invite_list.append(
                    {
                        "event_name": invites[0],
                        "event_date": invites[1],
                        "event_id": invites[3],
                        "is_gifted": invites[4],
                        "event_admins": json.loads(invites[2])
                    }
                )

            return total_sent_amount, transaction_sent_list, total_recieved_amount, transaction_recieved_list, \
                events_invite_list

        if controller_type == GIFT_SENT:
            sent_gift = []
            for sent in data:
                sent_gift.append(
                    {
                        "receiver_uid": sent[0],
                        "sender_uid": sent[1],
                        "shagun_amount": sent[2],
                        "transaction_amount": sent[3],
                        "transaction_fee": sent[4],
                        "delivery_fee": sent[5],
                        "created_on": sent[6],
                        "card_price": sent[7],
                        "event_type_name": sent[8],
                        "id": sent[9],
                        "settlement_status": sent[10]
                    }
                )
            return sent_gift

        if controller_type == GREETING_CARDS:
            greeting_cards = []
            for cards in data:
                greeting_cards.append(
                    {
                        "card_name": cards[0],
                        "card_image_url": cards[1],
                        "card_price": cards[2]
                    }
                )
            return greeting_cards

        if controller_type == TRACK_ORDER:
            track_order = []
            for order in data:
                track_order.append(
                    {
                        "shagun_amount": order[0],
                        "track_status": order[1],
                        "is_gift_card_sent": order[2],
                        "shagun_gifted_on": order[3]
                    }
                )
            return track_order
