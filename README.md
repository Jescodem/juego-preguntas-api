Proyecto Juego Educativo

Este proyecto es una API creada con Django REST Framework para un juego educativo. A continuación, se detallan los pasos para configurar y ejecutar el proyecto correctamente.

Requisitos previos

1. Tener Python instalado.
2. Tener MySQL instalado y en funcionamiento.
3. Tener VS Code instalado para editar el código.

Pasos para configurar el proyecto

1. Abrir el proyecto en VS Code

- Abre VS Code.
- Abre el proyecto en VS Code utilizando la opción "Abrir carpeta" o desde la terminal:

  code .

2. Crear un entorno virtual

Para gestionar las dependencias del proyecto, es recomendable utilizar un entorno virtual:

  python -m venv env

- Luego, activa el entorno virtual:

  - En Windows:
    .\env\Scripts\activate

  - En macOS/Linux:
    source env/bin/activate

3. Instalar los módulos necesarios

Una vez que el entorno virtual esté activo, instala los módulos necesarios utilizando pip:

  pip install pymysql cryptography djangorestframework

4. Configurar la base de datos en settings.py

Abre el archivo game_project/settings.py y configura la base de datos MySQL de acuerdo con la configuración de tu usuario. Añade o modifica la sección DATABASES como se muestra a continuación:

  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.mysql',
          'NAME': 'juego_educativo',  # Nombre de tu base de datos
          'USER': 'root',  # Tu usuario de MySQL
          'PASSWORD': 'root',  # Tu contraseña de MySQL
          'HOST': 'localhost',  # Host de la base de datos
          'PORT': '3307',  # Puerto de conexión de MySQL
          'OPTIONS': {
              'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
          }
      }
  }

5. Realizar migraciones

Ejecuta los siguientes comandos para crear las migraciones de la base de datos y aplicar los cambios:

  python manage.py makemigrations
  python manage.py migrate

6. Ejecutar el servidor

Una vez que las migraciones estén aplicadas, ejecuta el servidor Django con el siguiente comando:

  python manage.py runserver 8080

7. Abrir el servidor en el navegador

Abre tu navegador y ve a http://localhost:8080 para verificar que el servidor esté en funcionamiento.

8. Realizar pruebas en Postman

Con el servidor en funcionamiento, puedes realizar pruebas de los métodos HTTP (POST, GET, DELETE, PUT) usando Postman:

- POST: Para crear nuevos recursos.
- GET: Para obtener información.
- PUT: Para actualizar recursos existentes.
- DELETE: Para eliminar recursos.

Notas adicionales

- Asegúrate de tener la base de datos juego_educativo creada en MySQL antes de ejecutar las migraciones.
- Si deseas cambiar el puerto del servidor o la base de datos, ajusta las configuraciones en los archivos correspondientes (settings.py y runserver).
