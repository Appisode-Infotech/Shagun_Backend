import json

def get_credentials():
    try:
        with open('Shagun_backend/util/credentials.json', 'r') as json_file:
            data = json.load(json_file)
            return data
    except FileNotFoundError:
        print("Credentials file not found.")
        return {}
