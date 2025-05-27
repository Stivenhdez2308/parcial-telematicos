import os

class Config:
    # Configuración de la base de datos
    DATABASE_URL = os.environ.get('DATABASE_URL') or 'mysql://webappuser:webapppass@db:3306/miniwebapp'
    SQLALCHEMY_DATABASE_URI = DATABASE_URL
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Otras configuraciones
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-secret-key-change-in-production'
