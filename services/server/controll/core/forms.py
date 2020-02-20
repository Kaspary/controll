from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm


# class UserForm(ModelForm):
# 	class Meta:
# 		model = User
# 		fields = ['username', 'email', 'password']


class UserForm(UserCreationForm):
    """
    Register a new user 
    """
    password1 = forms.CharField(
        required=True,
        widget=forms.PasswordInput,
        error_messages={'required': 'O campo senha é obrigatório.'})
    
    class Meta:
        model = User
        fields = ['email', 'username']
        error_messages = {
            'email': {
                'required': 'O campo email é obrigatório.',
                'invalid': 'Email inválido.',
            }
        }
        
    def __init__(self, *args, **kwargs):
        super(UserForm, self).__init__(*args, **kwargs)
        # the password2 field is set by django
        del self.fields['password2']
        self.fields['email'].widget.attrs.update({'class': 'form-control', 'placeholder': 'exemplo@email.com'})
        self.fields['username'].widget.attrs.update({'class': 'form-control', 'placeholder': 'usuário'})
        
    def save(self, commit=True):
        user = super(UserForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        user.username = self.cleaned_data['username']
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user