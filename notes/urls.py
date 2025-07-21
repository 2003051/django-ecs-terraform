
from django.urls import path, include # type: ignore
from rest_framework.routers import DefaultRouter # type: ignore
from .views import NoteViewSet

router = DefaultRouter()
router.register(r'notes', NoteViewSet)

urlpatterns = [
    path('', include(router.urls)),
]