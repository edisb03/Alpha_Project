# Use the official Python image as the base image.
FROM python:3.8

# Set the working directory in the container.
WORKDIR /app

# Copy the python_requirements.txt file to the container.
COPY python_requirements.txt .

# Install necessary packages and set up the environment.
RUN apt-get update && apt-get -y install chromium-driver \
    && curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@9.8.1 \
    && pip install --no-cache-dir --upgrade -r python_requirements.txt

# Copy the rest of your application files into the container.
COPY . .

# Initialize rfbrowser (assuming it's a CLI command provided by your application)
RUN rfbrowser init

# Your other commands and configuration here...

# Start your application (if it requires a server to run)
CMD ["python", "your_app.py"]