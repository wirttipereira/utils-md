### Rafael Guimaraes Pereira - 19.Out.2020 #####################
#
# Calcula a viscosidade a partir do valor de integral
# obtido no plato (graficamente com o xmgrace).
# Primeiro se faz a ACF das pressoes, depois a integracao
# no xmgrace e depois se atribui visualmente o valor no plato.
# Este valor de integral eh convertido aqui em cP
################################################################

import sys

def mensagem():
	print '##############################################################'
	print 'Use: python converte_integral2cp.py 25000'
	print '-> string: use "a" to all or the residue desired (ex. electr) '
	print '##############################################################'


try:
	integral=float(sys.argv[1])
except:
	mensagem()
	sys.exit("arguments missing\n\n")


xmed = 3.97082
ymed = 3.97082
zmed = 5.15206

vol_med_cx 	= xmed * ymed * zmed * 1E-27   	#m3, volume medio da caixa
print(vol_med_cx)
temperatura = 400 							#K
conv 	    = integral/100
kB			= 1.3806503E-23					#cte de Bolzman
visc1		= (vol_med_cx * conv) / (kB * temperatura)
visc2		= visc1 * 1000
print('Kg/(m.s)', visc1)
print('cP', visc2)