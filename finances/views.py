import json
from datetime import date
from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import *
from core.models import SystemUser


@login_required(login_url='login:login')
def finances_management(request):
    context = {
        'system_user': SystemUser.objects.get(user=request.user)
    }

    if request.method == 'POST':
        pass

    return render(request, 'finances_management.html', context)


def get_finances(request):

    if request.method == 'POST':
        try:

            d = json.loads(request.POST.get('date', None))

            earnings = SystemUser.objects.get(user=request.user).earnings.filter(date__year=d['year'], date__month=d['month'])
            earnings_json=[]
            for e in earnings:
                earnings_json.append({
                    'id': e.id,
                    'title': e.title,
                    'value': float(e.value),
                    'fixed': e.fixed
                })

            expense = SystemUser.objects.get(user=request.user).expense.filter(date__year=d['year'], date__month=d['month'])
            expense_json=[]
            for e in expense:
                expense_json.append({
                    'id': e.id,
                    'title': e.title,
                    'value': float(e.value),
                    'category': e.category.id,
                    'fixed': e.fixed
                })

            category = SystemUser.objects.get(user=request.user).expense_category.all()
            category_json=[]
            for c in category:
                category_json.append({
                    'id': c.id,
                    'title': c.title,
                })

            return JsonResponse({
                'status': 'success',
                'message_title': 'Finanças iniciadas',
                'earnings': earnings_json,
                'expense': {'expense':expense_json, 'category': category_json}
            })
        except Exception as e:
            print('ERROR: ', str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao iniciar finanças'})



def save_earnings(request):
    if request.method == 'POST':
        try:
            d = json.loads(request.POST.get('date', None))

            earning=Earnings.objects.create(
                title=request.POST['title'],
                value=request.POST['value'],
                date=date(d['year'], d['month'], d['day'])
            )

            SystemUser.objects.get(user=request.user).earnings.add(earning)

            return JsonResponse({
                'status': 'success',
                'message_title': 'Salvo com sucesso',
                'earning':{
                    'id': earning.pk,
                    'title': earning.title,
                    'value': float(earning.value),
                    'fixed': earning.fixed,
                    'date': earning.date
                }
            })

        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar'})


def edit_earnings(request):
    if request.method == 'POST':
        try:

            Earnings.objects.filter(id=request.POST['id']).update(title=request.POST['title'], value=request.POST['value'])

            return JsonResponse({
                'status': 'success',
                'message_title': 'Editado com sucesso',
                'earning':{
                    'id': request.POST['id'],
                    'title': request.POST['title'],
                    'value': float(request.POST['value']),
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao editar'})


def fix_earnings(request):
    if request.method == 'POST':
        try:
            if request.POST['fixed'] == 'true':
                Earnings.objects.filter(id=request.POST['id']).update(fixed=True)
                message_title = 'Fixado com sucesso'
            else:
                Earnings.objects.filter(id=request.POST['id']).update(fixed=False)
                message_title = 'Desfixado com sucesso'

            return JsonResponse({
                'status': 'success',
                'message_title': message_title,
                'earning': {
                    'id': request.POST['id'],
                    'fixed': request.POST['fixed']
                }

            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao ficar'})


def remove_earnings(request):
    if request.method == 'POST':
        try:
            earning = Earnings.objects.get(id=request.POST['id']).delete()
            return JsonResponse({
                'status': 'success',
                'message_title': 'Excluido com sucesso',
                'earning_id': request.POST['id']
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao excluir'})



def save_expanse(request):

    try:
        pass
    except Exception as e:
        print('ERROR: ',str(e))

    return JsonResponse({'status': 'success'})

def edit_expanse(request):

    try:
        pass
    except Exception as e:
        print('ERROR: ',str(e))

    return JsonResponse({'status': 'success'})

def remove_expanse(request):

    try:
        pass
    except Exception as e:
        print('ERROR: ',str(e))

    return JsonResponse({'status': 'success'})