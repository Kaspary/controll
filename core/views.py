from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import SystemUser

@login_required(login_url='login:login')
def index(request):
    context = {
        'system_user': SystemUser.objects.get(user=request.user)
    }

    if request.method == 'POST':
        pass

    return render(request, 'index.html', context)