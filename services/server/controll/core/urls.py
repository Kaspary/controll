from django.conf.urls import url
from .views import *
app_name='core'

urlpatterns = [
    url(r'^$', index, name='index'),
]