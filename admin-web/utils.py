import os
import requests
from flask import session

FASTAPI_URL = os.getenv("FASTAPI_URL", "http://localhost:8000")


def get_headers():
    token = session.get("token")
    if token:
        return {"Authorization": f"Bearer {token}"}
    return {}


def api_get(endpoint, default=None):
    try:
        res = requests.get(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), timeout=10)
        if res.status_code == 200:
            return res.json()
        if res.status_code == 401:
            session.pop("token", None)
            return default
        return default
    except requests.exceptions.RequestException:
        return default


def api_post(endpoint, data=None, json_data=None, files=None):
    try:
        if json_data:
            return requests.post(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), json=json_data, timeout=10)
        if files:
            return requests.post(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), data=data, files=files, timeout=10)
        return requests.post(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), data=data, timeout=10)
    except requests.exceptions.RequestException:
        return None


def api_put(endpoint, data=None, json_data=None, files=None):
    try:
        if json_data:
            return requests.put(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), json=json_data, timeout=10)
        if files:
            return requests.put(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), data=data, files=files, timeout=10)
        return requests.put(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), data=data, timeout=10)
    except requests.exceptions.RequestException:
        return None


def api_delete(endpoint):
    try:
        return requests.delete(f"{FASTAPI_URL}{endpoint}", headers=get_headers(), timeout=10)
    except requests.exceptions.RequestException:
        return None
