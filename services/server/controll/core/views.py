from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login as django_login
from .models import SystemUser
from controll.core.forms import UserForm

@login_required(login_url='login:login')
def index(request):
	context = {
	'system_user': SystemUser.objects.get(user=request.user)
	}

	return render(request, 'index.html', context)


def register_user(request):	
	# If user is already logged in, redirect to index
	if request.user.is_authenticated:
		return redirect('core:index')

	if request.method == 'POST':
		form = UserForm(request.POST)
		if form.is_valid():
			user = form.save()
			user = authenticate(
				username=form.cleaned_data['username'], 
				password=form.cleaned_data['password1'])
			if user is not None:
				django_login(request, user)
				return redirect('core:index')

	return redirect('login:login')
