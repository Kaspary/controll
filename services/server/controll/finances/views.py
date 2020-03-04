import json
from datetime import datetime, date as datetime_date
from django.http import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.db.models import Sum
from django.utils import timezone
from .models import *
from controll.core.models import SystemUser
from .utils import save_expanse_by_sefaz, get_last_month

@login_required(login_url='login:login')
def finances_management(request):
    context = {
        'system_user': SystemUser.objects.get(user=request.user)
    }

    return render(request, 'finances_management.html', context)

@login_required(login_url='login:login')
def qr_scanner(request):
    context = {
        'system_user': SystemUser.objects.get(user=request.user)
    }

    return render(request, 'qr_scanner.html', context)

def save_expense_of_qr_code(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))
            url = request.POST.get('url')
            nfce = save_expanse_by_sefaz(url)

            if nfce:

                if nfce.in_contingency:
                    return JsonResponse({'status': 'warning', 'message_title': 'Nota físcal emitida em contingência', 'message_text': 'Assim que possível esta nota fiscal será salva'})

                expense=Expense.objects.create(
                    title=nfce.company.name,
                    value=nfce.total_value,
                    category=SystemUser.objects.get(user=request.user).expense_category.first(),
                    date=nfce.emission_date)
                SystemUser.objects.get(user=request.user).expense.add(expense)

                category = list(SystemUser.objects.get(user=request.user).expense_category.all().values('id', 'title'))

                return JsonResponse({
                    'status': 'success',
                    'message_title': 'Salvo com sucesso',
                    'expense':{
                        'expense':{
                            'id': expense.pk,
                            'title': expense.title,
                            'value': float(expense.value),
                            'category': expense.category.pk,
                            'fixed': expense.fixed,
                            'date': expense.date
                        },
                        'category': category,
                        'total': _get_total_expense(d, request.user)
                    }
                })

            else:
                ErrorOnSaveSefaz.objects.create(
                    url = url,
                    view = save_expense_of_qr_code)
                return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar', 'error': 'Nfce null'})

        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar', 'error': str(e)})



def get_finances(request):

    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))

            _set_fixed_earnings_and_expense(d, request.user)
            _verify_nfce_in_contingency(request.user)    

            earnings = list(SystemUser.objects.get(user=request.user).earnings.filter(date__year=d['year'], date__month=d['month']).order_by('created_at').values('id', 'title', 'value', 'fixed'))
            expense = list(SystemUser.objects.get(user=request.user).expense.filter(date__year=d['year'], date__month=d['month']).order_by('created_at').values('id', 'title', 'value', 'category', 'fixed'))
            category = list(SystemUser.objects.get(user=request.user).expense_category.all().values('id', 'title'))

            return JsonResponse({
                'status': 'success',
                'message_title': 'Finanças iniciadas',
                'earnings': {
                    'earnings': earnings,
                    'total': _get_total_earnings(d, request.user)
                },
                'expense': {
                    'expense':expense,
                    'category': category,
                    'total': _get_total_expense(d, request.user)
                }
            })
        except Exception as e:
            print('ERROR: ', str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao iniciar finanças'})


def get_expenses_category(request):
    if request.method == 'POST' and request.is_ajax():
        category = list(SystemUser.objects.get(user=request.user).expense_category.all().values('id', 'title'))

        return JsonResponse({
            'status': 'success',
            'message_title': 'Categorias',
            'category':category
        })



def save_earnings(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))

            earning=Earnings.objects.create(
                title=request.POST['title'],
                value=request.POST['value'],
                date=datetime_date(d['year'], d['month'], d['day'])
            )

            SystemUser.objects.get(user=request.user).earnings.add(earning)

            return JsonResponse({
                'status': 'success',
                'message_title': 'Salvo com sucesso',
                'earning':{
                    'earning':{
                        'id': earning.pk,
                        'title': earning.title,
                        'value': float(earning.value),
                        'fixed': earning.fixed,
                        'date': earning.date
                    },
                    'total': _get_total_earnings(d, request.user)
                }
            })

        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar'})

def edit_earnings(request):
    if request.method == 'POST' and request.is_ajax():
        try:

            d = json.loads(request.POST.get('date', None))

            Earnings.objects.filter(id=request.POST['id']).update(title=request.POST['title'], value=request.POST['value'])

            return JsonResponse({
                'status': 'success',
                'message_title': 'Editado com sucesso',
                'earning':{
                    'earning': {
                        'id': request.POST['id'],
                        'title': request.POST['title'],
                        'value': float(request.POST['value']),
                    },
                    'total': _get_total_earnings(d, request.user)
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao editar'})

def fix_earnings(request):

    if request.method == 'POST' and request.is_ajax():
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
                    'earning': {
                        'id': request.POST['id'],
                        'fixed': request.POST['fixed']
                    }
                }

            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao ficar'})

def remove_earnings(request):
    if request.method == 'POST' and request.is_ajax():
        try:

            d = json.loads(request.POST.get('date', None))

            Earnings.objects.get(id=request.POST['id']).delete()
            return JsonResponse({
                'status': 'success',
                'message_title': 'Excluido com sucesso',
                'earning':{
                    'earning': {
                        'id': request.POST['id'],
                    },
                    'total': _get_total_earnings(d, request.user)
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao excluir'})

def save_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))

            expense=Expense.objects.create(
                title=request.POST['title'],
                value=request.POST['value'],
                category=ExpensesCategory.objects.get(id=request.POST['category']),
                date=datetime_date(d['year'], d['month'], d['day'])
            )

            SystemUser.objects.get(user=request.user).expense.add(expense)

            category = list(SystemUser.objects.get(user=request.user).expense_category.all().values('id', 'title'))

            return JsonResponse({
                'status': 'success',
                'message_title': 'Salvo com sucesso',
                'expense':{
                    'expense':{
                        'id': expense.pk,
                        'title': expense.title,
                        'value': float(expense.value),
                        'category': expense.category.pk,
                        'fixed': expense.fixed,
                        'date': expense.date
                    },
                    'category': category,
                    'total': _get_total_expense(d, request.user)
                }
            })

        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar'})

def edit_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))
            Expense.objects.filter(id=request.POST['id']).update(
                title=request.POST['title'],
                value=request.POST['value'],
                category=ExpensesCategory.objects.get(id=request.POST['category']))

            return JsonResponse({
                'status': 'success',
                'message_title': 'Editado com sucesso',
                'expense':{
                    'expense':{
                        'id': request.POST['id'],
                        'title': request.POST['title'],
                        'value': float(request.POST['value']),
                        'category': request.POST['category'],
                    },
                    'total': _get_total_expense(d, request.user)
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao editar'})

def fix_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            if request.POST['fixed'] == 'true':
                Expense.objects.filter(id=request.POST['id']).update(fixed=True)
                message_title = 'Fixado com sucesso'
            else:
                Expense.objects.filter(id=request.POST['id']).update(fixed=False)
                message_title = 'Desfixado com sucesso'

            return JsonResponse({
                'status': 'success',
                'message_title': message_title,
                'expense': {
                    'expense': {
                        'id': request.POST['id'],
                        'fixed': request.POST['fixed']
                    }
                }

            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao ficar'})

def remove_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            d = json.loads(request.POST.get('date', None))
            Expense.objects.get(id=request.POST['id']).delete()
            return JsonResponse({
                'status': 'success',
                'message_title': 'Excluido com sucesso',
                'expense':{
                    'expense':{
                        'id': request.POST['id'],
                    },
                    'total': _get_total_expense(d, request.user)
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao excluir'})


def save_category_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            category=ExpensesCategory.objects.create(
                title=request.POST['title'],
            )

            SystemUser.objects.get(user=request.user).expense_category.add(category)

            return JsonResponse({
                'status': 'success',
                'message_title': 'Salvo com sucesso',
                'category':{
                    'id':category.id,
                    'title':category.title,
                }
            })

        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao salvar'})

def edit_category_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            ExpensesCategory.objects.filter(id=request.POST['id']).update(
                title=request.POST['title']
            )

            return JsonResponse({
                'status': 'success',
                'message_title': 'Editado com sucesso',
                'category': {
                    'id': request.POST['id'],
                    'title': request.POST['title'],
                }
            })
        except Exception as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao editar'})

def remove_category_expense(request):
    if request.method == 'POST' and request.is_ajax():
        try:
            ExpensesCategory.objects.get(id=request.POST['id']).delete()
            return JsonResponse({
                'status': 'success',
                'message_title': 'Excluido com sucesso',
                'category': {
                    'id': request.POST['id'],
                }
            })
        except models.ProtectedError as e:
            print('ERROR: ',str(e))
            return JsonResponse({'status': 'error', 'message_title': 'Erro ao excluir', 'message_text': 'Esta categoria esta sendo utilizada, exclua o gasto primeiro.'})

        return JsonResponse({'status': 'error', 'message_title': 'Erro ao excluir'})





def _get_total_earnings(date, user):
    try:
        total_value = SystemUser.objects.get(user=user).earnings.filter(date__year=date['year'], date__month=date['month']).aggregate(Sum('value'))
        return total_value['value__sum'] or 0.0
    except Exception as e:
        print('ERROR: ', str(e))
        return 0.0


def _get_total_expense(date, user):
    try:
        total_value = SystemUser.objects.get(user=user).expense.filter(date__year=date['year'], date__month=date['month']).aggregate(Sum('value'))
        return total_value['value__sum'] or 0.0
    except Exception as e:
        print('ERROR: ', str(e))
        return 0.0

def _verify_nfce_in_contingency(user):
    if Nfce.objects.filter(in_contingency=True).exists():
        for nfce in Nfce.objects.filter(in_contingency=True):
            new_nfce = save_expanse_by_sefaz(nfce.url)
            if new_nfce:
                #TODO: Não salvar a nova nota fiscal, retornar a nfce sem salvar e fazer update da nfce antiga
                nfce.delete()
                expense=Expense.objects.create(
                    title=new_nfce.company.name,
                    value=new_nfce.total_value,
                    category=SystemUser.objects.get(user=user).expense_category.first(),
                    date=new_nfce.emission_date)
                SystemUser.objects.get(user=user).expense.add(expense)


def _set_fixed_earnings_and_expense(date, user):
    try: 

        month, year = get_last_month(date['month'], date['year'])
        system_user = SystemUser.objects.get(user=user)

        if system_user.earnings.filter(date__month=month, date__year=year, fixed=True, fixed_copied=False).exists():
            earnings_fixed = system_user.earnings.filter(date__year=year, date__month=month, fixed=True, fixed_copied=False)
            for earning in earnings_fixed:
                earning = Earnings.objects.create(
                    title=earning.title,
                    value=earning.value,
                    fixed=earning.fixed,
                    description=earning.description,
                    date=timezone.make_aware(datetime(date['year'],date['month'], date['day']))
                )
                system_user.earnings.add(earning)
                earnings_fixed.update(fixed_copied=True)

        if system_user.expense.filter(date__month=month, date__year=year, fixed=True, fixed_copied=False).exists():
            expenses_fixed = system_user.expense.filter(date__year=year, date__month=month, fixed=True, fixed_copied=False)
            for expense in expenses_fixed:
                expense = Expense.objects.create(
                    title = expense.title,
                    description = expense.description,
                    value = expense.value,
                    fixed = expense.fixed,
                    category = expense.category,
                    date = timezone.make_aware(datetime(date['year'],date['month'], date['day']))
                )
                system_user.expense.add(expense)
                expenses_fixed.update(fixed_copied=True)

    except Exception as e:
        print('ERROR: ', str(e))