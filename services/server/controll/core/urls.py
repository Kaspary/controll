from django.conf.urls import url
from .views import *
app_name='core'

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^register_user$', register_user, name='register_user'),
]