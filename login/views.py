from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse


def login_view(request):
    print('LOGIN')
    if request.user.is_authenticated:
        return HttpResponseRedirect(reverse('core:index'))
    else:
        if request.method == 'POST':
            return _login_method(request)
        else:
            return render(request, 'login.html')


def logout_view(request):
    print('LOGOUT')
    logout(request)
    return HttpResponseRedirect(reverse('login:login'))


def _login_method(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(request, username=username, password=password)
    if user is not None:
        login(request, user)
        return HttpResponseRedirect(reverse('core:index'))
    else:
        context = {'message': 'Usuário ou senha não correspondem'}
        return render(request, 'login.html', context)