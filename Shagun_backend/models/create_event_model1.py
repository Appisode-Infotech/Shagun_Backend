import json
from datetime import datetime


# Helper function to convert date and time format
def convert_datetime(dt_str):
    # Parse the input time string into a datetime object
    input_format = '%Y-%m-%dT%H:%M'
    datetime_obj = datetime.strptime(dt_str, input_format)

    # Format the datetime object into the desired output format
    output_format = '%Y-%m-%d %H:%M:%S'
    formatted_time = datetime_obj.strftime(output_format)

    return formatted_time


def sub_events(data):
    sub_events_count = sum(key.startswith('sub_events[') for key in data.keys())
    sub_events_count //= 3
    sub_events_list = []
    for i in range(sub_events_count):
        sub_events_list.append({
            "sub_event_name": data[f'sub_events[{i}][sub_event_name]'],
            "start_time": convert_datetime(data[f'sub_events[{i}][start]']),
            "end_time": convert_datetime(data[f'sub_events[{i}][end]'])
        })

    return sub_events_list


def event_admins(data):
    event_admins_count = sum(key.startswith('event_admin[') for key in data.keys())
    event_admins_count //= 3
    event_admins_list = []
    for i in range(event_admins_count):
        event_admins_list.append({
            "name": data[f'event_admin[{i}][name]'],
            "role": data[f'event_admin[{i}][role]'],
            "uid": data[f'event_admin[{i}][uid]'],
            "profile": "profile url",
            "QR_code": "qr code"
        })

    return event_admins_list


# Transform data to the desired JSON format
def transform_data_to_json(data):
    result = {
        "created_by_uid": data['created_by_uid'],
        "event_type_id": data['event_type_id'],
        "city_id": data['city_id'],
        "address_line1": data['address_line1'],
        "address_line2": data['address_line2'],
        "event_lat_lng": data['event_lat_lng'],
        "sub_events": sub_events(data),
        "event_date": convert_datetime(data['event_date']),
        "event_note": data['event_note'],
        "event_admin": event_admins(data)
    }
    return result
