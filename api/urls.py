from django.urls import path
from . import views
app_name = 'api'

urlpatterns = [
    path('userinfo/', views.get_user),
]