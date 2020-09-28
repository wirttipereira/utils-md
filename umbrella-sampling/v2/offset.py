'''
RGP 28.9.2020

Utilidade: aplicar offset a uma das colunas

Uso:
===

> python offset.py arquivo.entrada.gro

'''

import sys #para usar o argumento de entrada na linha de comando

def mensagem():
	print '##############################################################'
	print 'Use: python offset.py profile.file.xvg offset.number'
	print '-> ex: python offset.py profile-200.xvg  15.1 '
	print '##############################################################'


try:
	arquivo=sys.argv[1]
	zoffset=float(sys.argv[2])
	#option=sys.argv[3]
except:
	mensagem()
	sys.exit("arguments missing\n\n")



#arquivo de saida
file4 = open('out.gro','w')

aux = 0

with open(arquivo) as f:  #'teste.gro'
  data = f.readlines()
  for line in data[2:len(data)-1]:#faz skip das primeiras 2 linhas e da ultima
    aux = aux + 1
    if (line.startswith('#') or line.startswith('@')):
    	a=0
    else:
    	z = float(line[12:28])
    	file4.writelines(line[0:11] + '  ' + str(z+zoffset)+ '\n')
    	#file4.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z))

file4.close()