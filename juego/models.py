from django.db import models

class Usuario(models.Model):
    ROLES = [('jugador', 'Jugador'), ('maestro', 'Maestro')]

    nombre = models.CharField(max_length=100)
    correo = models.EmailField(unique=True)
    contraseña = models.CharField(max_length=255)
    rol = models.CharField(max_length=10, choices=ROLES)
    fecha_creacion = models.DateTimeField(auto_now_add=True)

class Sesion(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    maestro = models.ForeignKey(Usuario, on_delete=models.CASCADE, limit_choices_to={'rol': 'maestro'})

class Pregunta(models.Model):
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)
    texto = models.TextField()
    respuesta_correcta = models.CharField(max_length=255)

class Respuesta(models.Model):
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)
    jugador = models.ForeignKey(Usuario, on_delete=models.CASCADE, limit_choices_to={'rol': 'jugador'})
    respuesta = models.CharField(max_length=255)
    es_correcta = models.BooleanField(default=False)
    fecha_respuesta = models.DateTimeField(auto_now_add=True)

class ProgresoJugador(models.Model):
    jugador = models.ForeignKey(Usuario, on_delete=models.CASCADE, limit_choices_to={'rol': 'jugador'})
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)
    preguntas_correctas = models.IntegerField(default=0)
    preguntas_totales = models.IntegerField(default=0)
