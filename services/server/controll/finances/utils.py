import re
import requests
import pytz
from datetime import datetime
from bs4 import BeautifulSoup
from controll.finances.models import Company, Nfce, Product


def save_expanse_by_sefaz(url):
    """ get data from html sefaz """
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')
    url = soup.find_all(id='iframeConteudo')[0]['src']
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')
    try:
        tables_list = soup.find(id='respostaWS').find('table').find('table').find('table').find_all('table')
    except Exception as e:
        print(str(e))
        return None

    nfce = None

    company = get_company(tables_list)
    if company:
        nfce = get_nfce(tables_list, company)
        if nfce:
            get_products(tables_list, nfce)

    return nfce


def get_company(tables_list):
    """ get company informations """
    name = tables_list[0].find(class_='NFCCabecalho_SubTitulo').text.lower().capitalize()
    tmp = tables_list[0].find(class_='NFCCabecalho_SubTitulo1').text
    cnpj = re.search('[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}', tmp).group()
    state_registration = re.search('[0-9]{10}', tmp).group()
    address = tables_list[1].find(class_='NFCCabecalho_SubTitulo1').text
    address = ' '.join(address.split()).title()

    #save company
    try:
        company = Company.objects.create(
            name = name, 
            cnpj = cnpj, 
            state_registration = state_registration, 
            address = address)
    except Exception as e:
        print(str(e))
        return None

    return company


def get_nfce(tables_list, company):
    """get nfc-e informations"""
    values = tables_list[3].find_all(class_='NFCCabecalho_SubTitulo')
    tmp = [' '.join(v.split()) for v in values[0].text.strip().split('\n')]
    number_nfc_e = tmp[0].split(':', 1)[1].strip()
    emission_date = tmp[2].split(':', 1)[1].strip()
    access_key = values[3].text

    values = tables_list[6].find_all('tr')

    total_value = values[0].find_all('td')[1].text
    discount_value = values[1].find_all('td')[1].text
    payment_method = values[3].find_all('td')[0].text
    value_paid = values[3].find_all('td')[1].text

    #save nfce
    try:
        nfce = Nfce.objects.create(
            company = company, 
            number_nfc_e = number_nfc_e, 
            emission_date = datetime.strptime(emission_date, '%d/%m/%Y %H:%M:%S').replace(tzinfo=pytz.UTC),
            access_key = access_key, 
            total_value = float(total_value.replace(',','.')), 
            discount_value = float(discount_value.replace(',','.')), 
            payment_method = payment_method, 
            value_paid = float(value_paid.replace(',','.')) if value_paid!='NaN' else 0)
    except Exception as e:
        print(str(e))
        return None

    return nfce

def get_products(tables_list, nfce):
    """get products informations"""
    tr_products_list = tables_list[5].find_all('tr')[1:]
    for product in tr_products_list:
        values = product.find_all('td')
        code = values[0].text
        description = values[1].text
        amount = values[2].text
        unity = values[3].text
        value_per_unit = values[4].text
        value_total = values[5].text
        
        Product.objects.create(
            nfce = nfce,
            code = code,
            description = description.lower().capitalize(),
            amount = float(amount.replace(',','.')),
            unity = unity,
            value_per_unit = float(value_per_unit.replace(',','.')), 
            value_total = float(value_total.replace(',','.')))
    return