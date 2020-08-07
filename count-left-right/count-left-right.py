#from numpy import array
import sys #para usar o argumento de entrada na linha de comando
from numpy import array
#--- configurar ---
zr=[0,16.7,19.8,28.24,31.34,48.5]
# ---> ajustar mais no final o range dos arquivos em ns


def le_labels(arq_in):
	v=[]
	with open(arq_in) as fa:
		data_fa = fa.readlines()
		for line_fa in data_fa[2:len(data_fa)-1]:
			#print line_fa[48:49]
			try:
				aux_fa = int(line_fa[48:49])
				v.append(aux_fa)
				#print aux_fa
			except:
				#print "vazio"
				v.append(9)
	return v

def escreve_labels(arq_in, arq_out): #retorna um vetor
	aux=0
	label=""
	ultima_linha="   3.42600   4.50000  48.50000"
	v=[]
	fo = open(arq_out,'w')
	#primeiras 2 linhas do .gro
	fo.writelines('RGP - count-left-right.py\n')
	fo.writelines('3328'+'\n')
	with open(arq_in) as f:  
		#zr=[0,16.7,19.8,28.24,31.34,48.5]
		data = f.readlines()
	  	for line in data[2:len(data)-1]:	#faz skip das primeiras 2 linhas e da ultima
	  	  aux = aux + 1
	  	  #print aux
	  	  z = float(line[37:44])
	  	  if ((z<zr[1]) or (z>zr[4])):
	  	  	label = "0"
	  	  if ((z>=zr[1]) and (z<=zr[2])):	#eletrodo esquerdo
			label = "1"
		  if ((z>=zr[3]) and (z<=zr[4])):	#eletrodo direita
			label = "2"
		  fo.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}{:>5}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z,label))
		  v.append(label)

    #fo.writelines(ultima_linha)
    #fo.close()
	return v    

def ajusta(v0,v1):
	cont_esq=0
	cont_dir=0
	aux=0
	for i in v1:
		if(i==''): #se estiver no bulk
			v1[aux]=v0[aux]
		#if(i=='1'):#eletrodo esq
		#	cont_esq = cont_esq + 1
		#if(i=='2'):#eletrodo dir
		#	cont_dir = cont_dir + 1
		aux = aux + 1
	return v1#, cont_esq, cont_dir


def conta(arq_in,v1):
	with open(arq_in) as f:
		data = f.readlines()
	  	aux = 0
	  	cont_esq=0
	  	cont_dir=0
	  	for line in data[2:len(data)-1]:	#faz skip das primeiras 2 linhas e da ultima
	  	  #print aux
	  	  z = float(line[37:44])
	  	  if ((z>zr[2]) and (z<zr[3])):	#bulk
	  	  	if(v1[aux]=='1'):
	  	  		cont_esq = cont_esq + 1 #eletrodo esq
	  	  	if(v1[aux]=='2'):
	  	  		cont_dir = cont_dir + 1 #eletrodo dir
	  	  aux = aux + 1
	return cont_esq, cont_dir


ns = [] #cria lista para armazenar vetores
ns.append(escreve_labels('ns0.gro','out.txt'))
#print ns[0][0:10]

for i in range(1,5): # ---> AJUSTAR AQUI <---- de acordo com o numero de arquivos
	arq='ns'+str(i)+'.gro'
	#print arq
	ns.append(escreve_labels(arq,'out.txt'))
	#ns[i],e,d=ajusta(ns[i-1],ns[i])
	ns[i]=ajusta(ns[i-1],ns[i])
	#print ns[i][0:10]
	e,d=conta(arq,ns[i])
	print e, d

#print ns[0][0:10]
#print ns[1][0:10]






'''
ns0= escreve_labels('ns0.gro','out.txt')

ns1= escreve_labels('ns1.gro','out.txt')
ns1, e, d= ajusta(ns0, ns1)

ns2= escreve_labels('ns2.gro','out.txt')
ns2, e, d= ajusta(ns1, ns2)

ns3= escreve_labels('ns3.gro','out.txt')
ns3, e, d= ajusta(ns2, ns3)

print ns0[0:10]
print ns1[0:10]
print ns2[0:10]
print ns3[0:10]
'''

'''
    if ((z>zr[2]) and (z<zr[3])):	#bulk
    	if(anterior[1]==1):
    		total_esq = total_esq + 1
    		label = 1
    	if(anterior[1]==2):
    		total_dir = total_dir + 1
    		label = 2
    	#temp=0
'''
#debug
#print anterior
#print len(anterior)