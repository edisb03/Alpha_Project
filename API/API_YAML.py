import requests
import yaml

def get_info_data():
    """
    Retrieves 'info' data from an OpenAPI YAML file.

    Returns:
        dict: The 'info' section of the OpenAPI data.
              Returns None if there was an issue.
    """
    api_url = "https://cloud01-eu.testbench.com/doc/attachments/openapi.yaml"
    response = requests.get(api_url)

    if response.status_code == 200:
        openapi_yaml = response.text

        try:
            # Load the YAML content
            openapi_data = yaml.safe_load(openapi_yaml)

            # Access the 'info' section
            info_section = openapi_data.get("info", {})

            return info_section
        except yaml.YAMLError as e:
            print("Error loading YAML:", e)

    return None  # Return None if there was an issue

if __name__ == "__main__":
    info_data = get_info_data()
    if info_data:
        for key, value in info_data.items():
            print(f"{key}: {value}")
    else:
        print("Failed to retrieve info section data.")
