#Rafael Guimaraes Pereira - 7.Aug.2020
#wirttipereira@hotmail.com
#####################################

import sys #para usar o argumento de entrada na linha de comando
from numpy import array
#--- configurar ---
# numero de configuracos .gro, ajustar no final deste arquivo
#zr=[0,16.70,19.80,28.24,31.34,48.5] #sulfonio
zr=[0,17.04,20.15,27.85,30.95,48.5] #amonio, fosfonio
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
		data = f.readlines()
	  	for line in data[2:len(data)-1]:	#faz skip das primeiras 2 linhas e da ultima
	  	  aux = aux + 1
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
		aux = aux + 1
	return v1


def conta(arq_in,v1):
	with open(arq_in) as f:
		data = f.readlines()
	  	aux = 0
	  	cont_esq=0
	  	cont_dir=0
	  	for line in data[2:len(data)-1]:	#faz skip das primeiras 2 linhas e da ultima
	  	  z = float(line[37:44])
	  	  if ((z>zr[2]) and (z<zr[3])):	#bulk
	  	  	if(v1[aux]=='1'):
	  	  		cont_esq = cont_esq + 1 #eletrodo esq
	  	  	if(v1[aux]=='2'):
	  	  		cont_dir = cont_dir + 1 #eletrodo dir
	  	  aux = aux + 1
	return cont_esq/3, cont_dir/3


def salva(v_left,v_right):
	with open ('data.bulk','w') as f:
		f.writelines('left right\n')
		cont=0
		for i in range(len(v_left)):
			c=str(cont)
			l=str(v_left[cont])
			r=str(v_right[cont])
			lr=str(v_left[cont]+v_right[cont])
			f.writelines(c+' '+l+' '+r+' '+lr+'\n')
			cont=cont+1
	f.close()

ns = [] #cria lista para armazenar vetores
ns.append(escreve_labels('ns0.gro','out.txt'))
v_left=[] #vetor resposta esquerda
v_right=[] #vetor resposta direita

for i in range(1,101): #---> AJUSTAR AQUI <---- de acordo com o numero de arquivos
	arq='ns'+str(i)+'.gro'
	ns.append(escreve_labels(arq,'out.txt'))
	ns[i]=ajusta(ns[i-1],ns[i])
	e,d=conta(arq,ns[i])
	v_left.append(e)
	v_right.append(d)

salva(v_left,v_right)

