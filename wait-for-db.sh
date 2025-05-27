#!/bin/bash
set -e

echo "Esperando a que MySQL esté listo..."

# Esperar a que MySQL esté disponible
until python -c "
import MySQLdb
import os
import time
try:
    db_url = os.environ.get('DATABASE_URL', 'mysql://webappuser:webapppass@db:3306/miniwebapp')
    # Extraer componentes de la URL
    conn = MySQLdb.connect(
        host='db',
        user='webappuser',
        passwd='webapppass',
        db='miniwebapp'
    )
    conn.close()
    print('MySQL está listo!')
except Exception as e:
    print(f'MySQL no está listo aún: {e}')
    raise
"; do
  echo "MySQL no está listo - esperando..."
  sleep 2
done

echo "Iniciando la aplicación Flask..."
python run.py
