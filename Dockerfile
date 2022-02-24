FROM python:3.9-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY requirements.txt ./

# Install production dependencies.
RUN pip install -r requirements.txt

COPY main.py ./
ENV FLASK_APP=main.py
ENV FLASK_ENV=development
ENV FLASK_RUN_PORT=5000

COPY data.db ./

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app