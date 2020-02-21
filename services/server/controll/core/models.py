from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from controll.finances.models import Expense, Earnings, ExpensesCategory

class SystemUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=300)
    last_name = models.CharField(max_length=300)
    expense = models.ManyToManyField(Expense)
    expense_category = models.ManyToManyField(ExpensesCategory)
    earnings = models.ManyToManyField(Earnings)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk)

    def full_name(self):
        return self.first_name +' '+ self.last_name


class DateUpdated(models.Model): 
    date = models.DateField(auto_now=False, auto_now_add=False, null=True)
    system_user = models.ForeignKey(SystemUser, on_delete=models.CASCADE, related_name='date_updated')



@receiver(post_save, sender=User)
def create_user_operator(sender, instance, created, **kwargs):
    if created:
        systemUser = SystemUser.objects.create(user=instance, first_name=instance.username)
        systemUser.expense_category.add(
            ExpensesCategory.objects.create(title='Outros'),
            ExpensesCategory.objects.create(title='Alimentação'),
            ExpensesCategory.objects.create(title='Saúde'),
            ExpensesCategory.objects.create(title='Transporte'),
        )
