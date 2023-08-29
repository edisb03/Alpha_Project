import requests

def emri_api_status():
    """
    Sends an HTTP GET request to the API endpoint and prints the status code of the response.

    :return: None
    """
    # HTTP Status Codes:
    # 200 - OK (Success): The 200 status code indicates that the request was successful,
    # and the server has returned the expected response. This is the ideal outcome for most of our API interactions.
    # 404 - Not Found (Client Error): The 404 status code signifies that the requested resource could not be found on the server.
    # 500 - Internal Server Error (Server Error): The 500 status code indicates that something unexpected went wrong on the server's end.
    # 403 - Forbidden (Client Error): The 403 status code suggests that the client (user or application)
    # does not have permission to access the requested resource.
    
    api = "https://www.testbench.com/wp-content/uploads/resized/2020/04/1-1-hero-1280x0-c-default.jpg"
    response = requests.get(api)  # 200, 403, 404, 500
    print("API Response Status Code:", response.status_code)  #Expected status 200

# Call the function directly
emri_api_status()
