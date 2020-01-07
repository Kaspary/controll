from django.contrib import admin
from django.urls import include
from django.conf.urls import url


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include('controll.core.urls')),
    url(r'^login/', include('controll.login.urls')),
    url(r'^finances/', include('controll.finances.urls')),
]

