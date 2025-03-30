from rest_framework import serializers
from .models import Usuario, Sesion, Pregunta, Respuesta, ProgresoJugador

class UsuarioSerializer(serializers.ModelSerializer):    

    class Meta:
        model = Usuario
        fields = ['id', 'nombre', 'correo', 'contraseña', 'rol', 'fecha_creacion']
        #extra_kwargs = {'contraseña': {'write_only': True}}  # Oculta la contraseña en las respuestas

class SesionSerializer(serializers.ModelSerializer):
    maestro = serializers.PrimaryKeyRelatedField(queryset = Usuario.objects.filter(rol='maestro'))  

    class Meta:
        model = Sesion
        fields = '__all__'

class PreguntaSerializer(serializers.ModelSerializer):
    sesion = SesionSerializer(read_only=True)

    class Meta:
        model = Pregunta
        fields = '__all__'

class RespuestaSerializer(serializers.ModelSerializer):
    pregunta = PreguntaSerializer(read_only=True)
    jugador = UsuarioSerializer(read_only=True)

    class Meta:
        model = Respuesta
        fields = '__all__'

class ProgresoJugadorSerializer(serializers.ModelSerializer):
    jugador = UsuarioSerializer(read_only=True)
    sesion = SesionSerializer(read_only=True)

    class Meta:
        model = ProgresoJugador
        fields = '__all__'
