import re
import requests
from bs4 import BeautifulSoup


class Product:
    """
    Código
    Descrição
    Quantidade
    Unidade
    Valor por Unidade
    Valor total
    """
    
    def __init__(self, code, description, amount, unity, value_per_unit, value_total):
        self.code = code
        self.description = description
        self.amount = amount
        self.unity = unity
        self.value_per_unit = value_per_unit
        self.value_total = value_total
    
    def __str__(self):
        return '{}\n{}\n{}\n{}\n{}\n{}\n'.format(self.code,self.description,self.amount,self.unity,self.value_per_unit,self.value_total)
   

class Company:
    """
    Empresa
    CNPJ
    Inscrição Estadual
    Endereço
    """
    
    def __init__(self , name, cnpj, state_registration, address):
        self.name = name
        self.cnpj = cnpj
        self.state_registration = state_registration
        self.address = address
        
    def __str__(self):
        return '{}\n{}\n{}\n{}'.format(self.name,self.cnpj,self.state_registration,self.address)


class Nfce:
    """
    Empresinsa
    Número NFC-e
    Data de emissão
    Chave de acesso
    Produtos[]
    Valor total nota
    Valor descontos
    Forma de pagamento
    Valor pago
    """
    
    def __init__(self, company, products, number_nfc_e, emission_date, access_key, total_value, discount_value, payment_method, value_paid):
        self.company = company
        self.number_nfc_e = number_nfc_e
        self.emission_date = emission_date
        self.access_key = access_key
        self.products = products
        self.total_value = total_value
        self.discount_value = discount_value
        self.payment_method = payment_method
        self.value_paid = value_paid

    def __str__(self):
        return '{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}\n{}'.format(self.company, self.number_nfc_e, self.emission_date, self.access_key, self.products, self.total_value, self.discount_value, self.payment_method, self.value_paid)

def save_expanse_by_sefaz(url):

	headers = {"Accept": "application/json"}

	response = requests.get(url, headers=headers)
	soup = BeautifulSoup(response.content, 'html.parser')
	url = soup.find_all(id='iframeConteudo')[0]['src']
	response = requests.get(url, headers=headers)
	soup = BeautifulSoup(response.content, 'html.parser')
	tables_list = soup.find(id='respostaWS').find('table').find('table').find('table').find_all('table')

	# get company informations

	name = tables_list[0].find(class_='NFCCabecalho_SubTitulo').text

	tmp = tables_list[0].find(class_='NFCCabecalho_SubTitulo1').text
	cnpj = re.search('[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}', tmp).group()
	state_registration = re.search('[0-9]{10}', tmp).group()
	address = tables_list[1].find(class_='NFCCabecalho_SubTitulo1').text
	address = ' '.join(address.split())
	company = Company(name, cnpj, state_registration, address)

	print(company)

	# get products informations

	tr_products_list = tables_list[5].find_all('tr')[1:]

	products = []

	for product in tr_products_list:
	    
	    values = product.find_all('td')
	    
	    code = values[0].text
	    description = values[1].text
	    amount = values[2].text
	    unity = values[3].text
	    value_per_unit = values[4].text
	    value_total = values[5].text
	    
	    products.append(Product(code, description, amount, unity, value_per_unit, value_total))

	print(len(products))

	# get nfc-e informations

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


	nfce = Nfce(company, products, number_nfc_e, emission_date, access_key, total_value, discount_value, payment_method, value_paid)

	print(nfce)

	return nfce