from django.contrib import admin
from .models import *

admin.site.register(Expense)
admin.site.register(Earnings)
admin.site.register(ExpensesCategory)