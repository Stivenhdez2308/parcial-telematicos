FROM python:3.10-slim

# Instalación de dependencias necesarias para mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY webapp/ /app/

# Instala mysqlclient y los demás paquetes
RUN pip install --no-cache-dir flask flask_sqlalchemy mysqlclient

EXPOSE 5000

# Script para esperar a que MySQL esté listo y crear las tablas
COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

CMD ["/wait-for-db.sh"]
