from django.conf.urls import url
from .views import *

app_name='login'

urlpatterns = [
    url('^$', login_view, name='login'),
    url('^logout$', logout_view, name='logout'),
]