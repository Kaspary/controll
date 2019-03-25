from django.urls import path
from .views import *

app_name='login'

urlpatterns = [
    path('logout', logout_view, name='logout'),
    path('login', login_view, name='login'),
]