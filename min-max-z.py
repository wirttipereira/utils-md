#RGP - 20.8.2020

import sys

def mensagem():
	print '##############################################################'
	print 'Use: python min-max.py file.gro box_width option'
	print '-> string: use "a" to all or the residue desired (ex. electr) '
	print '##############################################################'


try:
	arq_in=sys.argv[1]
	box_width=float(sys.argv[2])
	option=sys.argv[3]
except:
	mensagem()
	sys.exit("arguments missing\n\n")


minimo=999
maximo=-999



with open(arq_in) as f:
	data_f = f.readlines()
	for line_f in data_f[2:len(data_f)-1]:
		#z = float(line_f[0:8])
		z = float(line_f[37:44])
		if(option=='h'):
				sys.exit("bye bye")	
		if(option=='a'):
			if(z>maximo):
				maximo = z
			if(z<minimo):
				minimo = z
		else:
			residue=line_f[5:10]
		#	print option, residue
			if(option==residue):
				if(z>maximo):
					maximo = z
				if(z<minimo):
					minimo = z
			
			


larg_eletr = maximo-minimo
d = box_width/2 - larg_eletr/2 - minimo

print 'min:',minimo,'  max:',maximo,'  eletrodo:',larg_eletr,'   deslocar em z: ',d
print 'gmx editconf -f ',arq_in, '  -translate  0.  0.  ',d
