from django.db import models

"""
this command reset all migrations (to the zeroth state)
python manage.py migrate --fake myappname zero
"""


class ExpensesCategory(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Expense(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField()
    date = models.DateTimeField()
    fixed = models.BooleanField(default=False)
    category = models.ForeignKey(ExpensesCategory, null=True, on_delete=models.PROTECT)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

class Earnings(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField(0)
    date = models.DateTimeField()
    fixed = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title