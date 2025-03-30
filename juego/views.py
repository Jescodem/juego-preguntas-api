from rest_framework import generics, viewsets
from .models import Usuario, Sesion, Pregunta, Respuesta, ProgresoJugador
from .serializers import UsuarioSerializer, SesionSerializer, PreguntaSerializer, RespuestaSerializer, ProgresoJugadorSerializer

class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer

class SesionViewSet(viewsets.ModelViewSet):
    queryset = Sesion.objects.all()
    serializer_class = SesionSerializer

class PreguntaViewSet(viewsets.ModelViewSet):
    queryset = Pregunta.objects.all()
    serializer_class = PreguntaSerializer

class RespuestaViewSet(viewsets.ModelViewSet):
    queryset = Respuesta.objects.all()
    serializer_class = RespuestaSerializer

class ProgresoJugadorViewSet(viewsets.ModelViewSet):
    queryset = ProgresoJugador.objects.all()
    serializer_class = ProgresoJugadorSerializer
