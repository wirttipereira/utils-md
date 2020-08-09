#!/usr/bin/python

#Rafael Guimaraes Pereira - 9.Aug.2020
#wirttipereira@hotmail.com
#####################################


#--- configurar ---
# numero de configuracos .gro, ajustar no final deste arquivo
#zr=[0,16.70,19.80,28.24,31.34,48.5] #sulfonio
zr=[0,17.04,20.15,27.85,30.95,48.5] #amonio, fosfonio
ultima_linha="   3.42600   4.50000  48.50000"
# ---> ajustar mais no final o range dos arquivos em ns



import numpy as np

def build_raw_matrix(arq_in):
	v=[]
	with open(arq_in) as fa:
		data_fa = fa.readlines()
		for line_fa in data_fa[2:len(data_fa)-1]:
			#print line_fa[48:49]
			try:
				#aux = aux + 1
	  	  		z = float(line_fa[37:44])
	  	  		if ((z<zr[1]) or (z>zr[4])): 	#fase gas
	  	  			label = 0
	  	  		elif ((z>=zr[1]) and (z<=zr[2])):	#eletrodo esquerdo
					label = 1
		  		elif ((z>=zr[3]) and (z<=zr[4])):	#eletrodo direita
					label = 2
				elif ((z>zr[2]) and (z<zr[3])):	#bulk
					label = 9
				v.append(label)
				#v.append(str(z))
				#print aux_fa
			except:
				#print "vazio"
				v.append(-1)

		M = np.array(v)
	return M



def correct_matrix(rawM):
	#z = float(line_fa[37:44])
	
	linhas,colunas=rawM.shape
	print linhas, colunas
	
	for i in range(linhas):
		left=0
		right=0
		gas=0
		for j in range(colunas):
			#print i, j, rawM[i,j]
			if(rawM[i,j]==9):
				#print "xxxxxx"
				#print rawM[i-1,j]
				#print "xxxxxx"
				rawM[i,j]=rawM[i-1,j]
				if(rawM[i-1,j]==1):
					left = left + 1
				elif(rawM[i-1,j]==2):
					right = right + 1
				elif(rawM[i-1,j]==0):
					gas = gas + 1
		print i, left, right, left+right, gas, left+right+gas
	return rawM#, left, right, gas


#v0=build_raw_matrix('ns0.gro')
#v1=build_raw_matrix('ns1.gro')
#v2=build_raw_matrix('ns2.gro')
#M=np.array([v0,v1,v2])

v=[]
for i in range(0,101):
	arq='ns'+str(i)+'.gro'
	v.append(build_raw_matrix(arq))
V=np.array(v)
#print V


#print M[1,0:500]
#print(type(M))
#print M.shape
#np.save('m.txt',M)

#CM, left, right, gas=correct_matrix(M)
CM =correct_matrix(V)
#print left, right, gas
np.save('m.txt',CM)


'''
import sys #para usar o argumento de entrada na linha de comando
from numpy import array


#--- configurar ---
# numero de configuracos .gro, ajustar no final deste arquivo
#zr=[0,16.70,19.80,28.24,31.34,48.5] #sulfonio
zr=[0,17.04,20.15,27.85,30.95,48.5] #amonio, fosfonio
ultima_linha="   3.42600   4.50000  48.50000"
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

    	fo.writelines(ultima_linha)
    	fo.close()
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
		cont_outros=0
	  	for line in data[2:len(data)-1]:	#faz skip das primeiras 2 linhas e da ultima
	  	  z = float(line[37:44])
	  	  if ((z>zr[2]) and (z<zr[3])):	#bulk
			if(v1[aux]=='1'):
				#print v1[aux]
	  	  		cont_esq = cont_esq + 1 #eletrodo esq
	  	  	if(v1[aux]=='2'):
				#print v1[aux]
	  	  		cont_dir = cont_dir + 1 #eletrodo dir
			#else:
			if(v1[aux]=='0'):
				#print v1[aux]
				cont_outros = cont_outros + 1
	  	  aux = aux + 1
	#return cont_esq/3, cont_dir/3, cont_outros/3
	return cont_esq, cont_dir, cont_outros

def salva(v_left,v_right,v_outros):
	with open ('data.bulk','w') as f:
		f.writelines('left right\n')
		cont=0
		for i in range(len(v_left)):
			c=str(cont)
			l=str(v_left[cont])
			r=str(v_right[cont])
			lr=str(v_left[cont]+v_right[cont])
			vo=str(v_outros[cont])
			f.writelines(c+' '+l+' '+r+' '+lr+' '+vo+'\n')
			cont=cont+1
	f.close()

ns = [] #cria lista para armazenar vetores
ns.append(escreve_labels('ns0.gro','out0.txt'))
v_left=[] #vetor resposta esquerda
v_right=[] #vetor resposta direita
v_outros=[]

for i in range(1,101): #---> AJUSTAR AQUI <---- de acordo com o numero de arquivos
	arq='ns'+str(i)+'.gro'
	out='out'+str(i)+'.txt'
	ns.append(escreve_labels(arq,out))
	#print str(i)
	#print ns[i][50:60]
	ns[i]=ajusta(ns[i-1],ns[i])
	#print ns[i][50:60]
	e,d,o=conta(arq,ns[i])
	v_left.append(e)
	v_right.append(d)
	v_outros.append(o)

salva(v_left,v_right,v_outros)
'''