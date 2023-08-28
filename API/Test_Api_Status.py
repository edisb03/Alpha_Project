"""
Demonstrates making an API request and capturing the HTTP status code of the response.

This script sends an HTTP GET request to a specified API endpoint and prints the status code of the response.
The provided API URL is used as an example to showcase different possible status codes (404, 500, 403, and 200).

API Endpoint: https://www.testbench.com/wp-content/uploads/resized/2020/04/1-1-hero-1280x0-c-default.jpg
"""

import requests


def emri_metodes():
    """
    Sends an HTTP GET request to the API endpoint and prints the status code of the response.

    :return: None
    """
    api = "https://www.testbench.com/wp-content/uploads/resized/2020/04/1-1-hero-1280x0-c-default.jpg"
    response = requests.get(api)  # 404, 500, 403, 200
    print("API Response Status Code:", response.status_code)


# Call the function directly
emri_metodes()
