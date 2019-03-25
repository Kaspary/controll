from django.conf.urls import url
from .views import *
app_name='finances'

urlpatterns = [
    url(r'^finances_management$', finances_management, name='finances_management'),
]