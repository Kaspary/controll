from django.shortcuts import render
from django.contrib.auth.decorators import login_required

@login_required(login_url='login:login')
def index(request):
    context = {
    }

    if request.method == 'POST':
        pass

    return render(request, 'index.html', context)