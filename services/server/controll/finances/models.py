from django.db import models
"""
this command reset all migrations (to the zeroth state)
python manage.py migrate --fake myappname zero
"""

class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class ExpensesCategory(BaseModel):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)

    def __str__(self):
        return self.title


class Expense(BaseModel):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField()
    date = models.DateTimeField()
    fixed = models.BooleanField(default=False)
    category = models.ForeignKey(ExpensesCategory, null=True, on_delete=models.PROTECT)

    def __str__(self):
        return self.title

class Earnings(BaseModel):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=300)
    value = models.FloatField(0)
    date = models.DateTimeField()
    fixed = models.BooleanField(default=False)

    def __str__(self):
        return self.title


""" Models qr code """

class Company(BaseModel):

    name = models.CharField(max_length=50)
    cnpj = models.CharField(max_length=50)
    state_registration = models.CharField(max_length=50)
    address = models.CharField(max_length=300)

    def __str__(self):
        return '{}\n{}\n{}\n{}'.format(self.name, self.cnpj, self.state_registration, self.address)


class Nfce(BaseModel):

    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    #products = models.Ma
    number_nfc_e = models.CharField(max_length=50)
    emission_date = models.DateTimeField()
    access_key = models.CharField(max_length=100)
    total_value = models.FloatField()
    discount_value = models.FloatField()
    payment_method = models.CharField(max_length=50)
    value_paid = models.FloatField()

    def __str__(self):
        return '{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}'.format(self.company, self.number_nfc_e, self.emission_date,
                                                           self.access_key, self.total_value,
                                                           self.discount_value, self.payment_method, self.value_paid)


class Product(BaseModel):

    nfce = models.ForeignKey(Nfce, on_delete=models.CASCADE)
    code = models.CharField(max_length=50)
    description = models.CharField(max_length=50)
    amount = models.FloatField()
    unity = models.CharField(max_length=50)
    value_per_unit = models.FloatField()
    value_total = models.FloatField()
    
    def __str__(self):
        return '{}\n{}\n{}\n{}\n{}\n{}\n'.format(self.code,self.description,self.amount,self.unity,self.value_per_unit,self.value_total)


class ErrorOnSaveSefaz(BaseModel):
    error = models.CharField(max_length=500, null=True, blank=True)
    view = models.CharField(max_length=100)
    url = models.CharField(max_length=500)