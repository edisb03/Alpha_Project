import requests

def check_api_status():
    """
    Sends an HTTP GET request to the API endpoint and prints the response status code.

    :return: None
    """
    api = "https://www.testbench.com/"
    response = requests.get(api)
    return response.status_code

# Call the function directly
check_api_status()
