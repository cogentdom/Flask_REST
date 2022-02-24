FROM python:3.9-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY requirements.txt ./

# Install production dependencies.
RUN pip install --no-cache-dir -r requirements.txt

COPY application.py ./
ENV FLASK_APP=application.py
ENV FLASK_ENV=development
ENV FLASK_RUN_PORT=5000

COPY gen_data.py ./
CMD ["python", "gen_data.py"]

ENTRYPOINT [ "flask" ]
CMD [ "run" ]