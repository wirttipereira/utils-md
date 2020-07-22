'''
Rafael Guimaraes Pereira - 5.Jul.2020

Algoritmo
---------
Le arquivo .csv
Filtra linhas entre z1 e z2
Calcula a media aritmetica de Y neste intervalo

Chamando o programa
-------------------
$ python density-region.py arquivo.csv z1 z2
'''

from numpy import array
import re #regular expression, usado aqui para tirar espacos duplicados
import sys#para usar o argumento de entrada na linha de comando

def media_z1z2(arq,z1,z2):
	sum_y=0
	contador=0
	with open(arq,'r') as f:
		data = f.readlines()
		
		for line in data:
			if (line.startswith('#') or line.startswith('@')):
				a=0
				#print '# ou @'
			else:	
				line = re.sub(' +',' ',line) #tira espacos duplicados
				line = line.strip() #tira espaco no inicio
				parts = line.split(" ") # split line into parts
				#print parts[0]
				z = float(parts[0])
				y = float(parts[5])
				if (z>=z1 and z<z2):
					sum_y = sum_y + y
					contador = contador + 1
	#print sum_y
	#print contador

	if (contador>0):
		return sum_y#/contador #nao dividir pelo contator pois ficaria ymedmed, a media das medias do slice. Melhor o somatorio das medias que da o numero de co2 dentro do intervalo setado (bulk)
	else:
		return 0.

#armazena em variaveis locais os argumentos passados na linha de comando
arquivo = sys.argv[1]
z1 = float(sys.argv[2])
z2 = float(sys.argv[3])
#print media_z1z2(arquivo,z1,z2)

#arquivo = 'ns20.xvg'#'teste.txt'
#print media_z1z2(arquivo,19.,30.)
print media_z1z2(arquivo,z1,z2)
