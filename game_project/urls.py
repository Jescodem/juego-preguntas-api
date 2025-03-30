from django.urls import path, include
from rest_framework.routers import DefaultRouter
from juego.views import UsuarioViewSet, SesionViewSet, PreguntaViewSet, RespuestaViewSet, ProgresoJugadorViewSet

# Configurar el Router
router = DefaultRouter()
router.register(r'usuarios', UsuarioViewSet)
router.register(r'sesiones', SesionViewSet)
router.register(r'preguntas', PreguntaViewSet)
router.register(r'respuestas', RespuestaViewSet)
router.register(r'progresos', ProgresoJugadorViewSet)

urlpatterns = [
    path('api/', include(router.urls)),  # Agregar todas las rutas del API
]
