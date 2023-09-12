FROM python:3

WORKDIR /workdir

COPY python_requirements.txt .

RUN pip install --no-cache-dir --upgrade -r python_requirements.txt \
    && apt-get -y update \
    && apt-get -y install chromium-driver \
    && apt-get -y install robot robotframework-yaml \
    # apt-get install google-chrome