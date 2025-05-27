from flask import Flask, render_template
from users.controllers.user_controller import user_controller
from users.models.db import db

app = Flask(__name__)
app.config.from_object('config.Config')
db.init_app(app)

# Crear las tablas automáticamente
with app.app_context():
    # Importar todos los modelos para que SQLAlchemy los conozca
    from users.models.user_model import Users
    db.create_all()
    print("Tablas de base de datos creadas correctamente")

# Registrando el blueprint del controlador de usuarios
app.register_blueprint(user_controller)

# Ruta para renderizar el template index.html
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/edit/<string:id>')
def edit_user(id):
    print("id recibido",id)
    return render_template('edit.html', id=id)

if __name__ == '__main__':
    app.run()
