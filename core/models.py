from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from finances.models import Expense, Earnings

class SystemUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=300)
    last_name = models.CharField(max_length=300)
    expense = models.ManyToManyField(Expense)
    earnings = models.ManyToManyField(Earnings)
    created_at = models.DateTimeField(auto_now=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk)

    def full_name(self):
        return self.first_name +' '+ self.last_name



@receiver(post_save, sender=User)
def create_user_operator(sender, instance, created, **kwargs):
    if created:
        SystemUser.objects.create(user=instance)