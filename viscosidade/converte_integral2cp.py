### Rafael Guimaraes Pereira - 19.Out.2020 #####################
#
# Calcula a viscosidade a partir do valor de integral
# obtido no plato (graficamente com o xmgrace).
# Primeiro se faz a ACF das pressoes, depois a integracao
# no xmgrace e depois se atribui visualmente o valor no plato.
# Este valor de integral eh convertido aqui em cP
################################################################

import sys
import json

def mensagem():
	print '##############################################################'
	print 'Use: python converte_integral2cp.py 25000'
	print '-> string: use "a" to all or the residue desired (ex. electr) '
	print '##############################################################'


with open('config.json','r') as file_json:
    data = json.load(file_json)
    integral = data['integral']
    temperatura = data['temperatura_K']
    xmed = data['xmed_nm']
    ymed = data['ymed_nm']
    zmed = data['zmed_nm']

    vol_med_cx 	= xmed * ymed * zmed * 1E-27   	#m3, volume medio da caixa
    conv 	    = integral/100
    kB			= 1.3806503E-23					#cte de Bolzman
    visc1		= (vol_med_cx * conv) / (kB * temperatura)
    visc2		= visc1 * 1000
    print('Kg/(m.s)', visc1)
    print('cP', visc2)