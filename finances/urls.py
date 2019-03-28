from django.conf.urls import url
from .views import *
app_name='finances'

urlpatterns = [
    url(r'^finances_management$', finances_management, name='finances_management'),

    #AJAX METHODS
    url(r'^get_finances', get_finances, name='get_finances'),

    url(r'^save_earnings', save_earnings, name='save_earnings'),
    url(r'^edit_earnings', edit_earnings, name='edit_earnings'),
    url(r'^fix_earnings', fix_earnings, name='fix_earnings'),
    url(r'^remove_earnings', remove_earnings, name='remove_earnings'),

    url(r'^save_expanse', save_expanse, name='save_expanse'),
    url(r'^edit_expanse', edit_expanse, name='edit_expanse'),
    url(r'^remove_expanse', remove_expanse, name='remove_expanse'),
]