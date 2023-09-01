import requests

def emri_api_status():
    """
    Sends an HTTP GET request to the API endpoint and prints the response status code.

    :return: None
    """
    # HTTP Status Codes:

    # 200 - OK (Success):
    # If the status code is 200, a message indicating that the request was successful (OK) is printed.
    # This is the ideal outcome for most of our API interactions.
    # Additional actions for a successful response (200) can be added here.

    # 403 - Forbidden:
    # If the status code is 403, a message indicating that the request is forbidden (Forbidden) is printed.
    # Additional actions for a forbidden response (403) can be added here.

    # 404 - Not Found:
    # If the status code is 404, a message indicating that the requested resource was not found (Not Found) is printed.
    # Additional actions for a not found response (404) can be added here.

    # 500 - Internal Server Error:
    # If the status code is 500, a message indicating that an unexpected error occurred on the server (Internal Server Error) is printed.
    # Additional actions for a server error response (500) can be added here.

    # Otherwise:
    # If the status code doesn't match any of the above, a message indicating an unknown status code is printed.
    # Handle any other unexpected status codes here.

    api = "https://www.testbench.com/"
    response = requests.get(api)  # 200(OK), 403(Forbidden), 404(Not Found), 500(Internal Server Error)

    if response.status_code == 200:
        print("API Response Status Code: Success (200)")

    elif response.status_code == 403:
        print("API Response Status Code: Forbidden (403)")

    elif response.status_code == 404:
        print("API Response Status Code: Not Found (404)")

    elif response.status_code == 500:
        print("API Response Status Code: Internal Server Error (500)")

    else:
        print("API Response Status Code: Unknown Status")


# Call the function directly
emri_api_status()
