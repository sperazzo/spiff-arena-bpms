FROM python:3.12.1-slim-bookworm

WORKDIR /app
COPY . .
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -e .

RUN apt-get update \
  && apt-get install -y -q \
  gcc libssl-dev libpq-dev default-libmysqlclient-dev build-essential \
  pkg-config libffi-dev git-core curl sqlite3 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

FROM ghcr.io/sartography/spiffworkflow-backend:latest
RUN apt-get update \
 && apt-get install -y --no-install-recommends default-mysql-client \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install uv==0.6.16 pytest-xdist==3.6.1

CMD ["./bin/run_server_locally"]
