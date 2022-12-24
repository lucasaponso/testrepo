
import requests
response = requests.get("https://api.openaq.org/v1/measurements?city=Paris&parameter=pm25")
response.status_code
200
response_json = response.json()