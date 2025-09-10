FROM python:3.12.1-slim-bookworm

WORKDIR /app

RUN apt-get update \
  && apt-get install -y -q \
  gcc libssl-dev libpq-dev python3-dev default-libmysqlclient-dev build-essential \
  pkg-config libffi-dev git-core curl sqlite3 default-mysql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install uv==0.6.16 pytest-xdist==3.6.1 pymysql cryptography mysqlclient

CMD ["./bin/run_server_locally", "keycloak"]
