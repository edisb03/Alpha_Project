FROM python:3
# # Use the official Python image as the base image.
# FROM python:3.8

# # Set the working directory in the container.
# WORKDIR /app

# # Copy the python_requirements.txt file to the container.
COPY python_requirements.txt .

# # Install necessary packages and set up the environment.
RUN apt-get update && apt-get -y install chromium-driver \
    && curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@9.8.1 \
    && pip install --no-cache-dir --upgrade -r python_requirements.txt

# # Copy the rest of your application files into the container.
# COPY . .

# # Initialize rfbrowser (assuming it's a CLI command provided by your application)
# RUN rfbrowser init

# # Your other commands and configuration here...

# # Start your application (if it requires a server to run)
# CMD ["python", "your_app.py"]

# # Use the official Robot Framework base image
# FROM robotframework/robotframework:latest

# # Install any additional dependencies your tests may need (e.g., browser drivers, etc.)

# # Set the working directory inside the container
# WORKDIR /opt/robotframework/tests

# # Copy your Robot Framework test files to the container
# COPY ./First_Project_IMBUS/TestCases/*.robot .

# # Set the entrypoint to run the tests using Robot Framework
# ENTRYPOINT ["robot"]