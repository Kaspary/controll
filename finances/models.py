from django.db import models


class Expense(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField()
    date = models.DateTimeField()
    fixed = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class ExpensesCategory(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Earnings(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField(0)
    date = models.DateTimeField()
    fixed = models.BooleanField(default=True)
    category = models.ForeignKey(ExpensesCategory, null=True, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
