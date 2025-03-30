from django.urls import path, include
from django.contrib import admin
from rest_framework.routers import DefaultRouter
from .views import UsuarioViewSet, SesionViewSet, PreguntaViewSet, RespuestaViewSet, ProgresoJugadorViewSet

router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet)
router.register(r'sesiones', SesionViewSet)
router.register(r'preguntas', PreguntaViewSet)
router.register(r'respuestas', RespuestaViewSet)
router.register(r'progreso', ProgresoJugadorViewSet)

urlpatterns = [
    path('', include(router.urls)),
]