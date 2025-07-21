from django.shortcuts import render # type: ignore

# Create your views here.
from rest_framework import viewsets # type: ignore
from .models import Note
from .serializers import NoteSerializer

class NoteViewSet(viewsets.ModelViewSet):
    queryset = Note.objects.all()
    serializer_class = NoteSerializer
