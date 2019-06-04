from django.conf.urls import url
from .views import *

app_name='login'

urlpatterns = [
    url('^logout$', logout_view, name='logout'),
    url('^login$', login_view, name='login'),
]