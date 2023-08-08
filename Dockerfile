FROM python:3

COPY python_requirements.txt .

RUN pip install --no-cache-dir --upgrade -r python_requirements.txt \
    && apt-get -y update \
    && apt-get -y install chromium-driver \
    && curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest\
    && rfbrowser init