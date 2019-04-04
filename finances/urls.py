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

    url(r'^save_expense', save_expense, name='save_expense'),
    url(r'^edit_expense', edit_expense, name='edit_expense'),
    url(r'^fix_expense', fix_expense, name='fix_expense'),
    url(r'^remove_expense', remove_expense, name='remove_expense'),
]