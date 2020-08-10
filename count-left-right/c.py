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
			try:
	  	  		z = float(line_fa[37:44])
	  	  		if ((z<zr[1]) or (z>zr[4])): 		#fase gas
	  	  			label = 0
	  	  		elif ((z>=zr[1]) and (z<=zr[2])):	#eletrodo esquerdo
					label = 1
		  		elif ((z>=zr[3]) and (z<=zr[4])):	#eletrodo direita
					label = 2
				elif ((z>zr[2]) and (z<zr[3])):		#bulk
					label = 9
				v.append(label)
			except:
				v.append(-1)

		M = np.array(v)
	return M

def correct_matrix(rawM):
	linhas,colunas=rawM.shape
	print linhas, colunas
	
	for i in range(linhas):
		left=0
		right=0
		gas=0
		for j in range(colunas):
			if(rawM[i,j]==9):
				rawM[i,j]=rawM[i-1,j]
				if(rawM[i-1,j]==1):
					left = left + 1
				elif(rawM[i-1,j]==2):
					right = right + 1
				elif(rawM[i-1,j]==0):
					gas = gas + 1
		print i, left, right, left+right, gas, left+right+gas
	return rawM

v=[]
for i in range(0,101):
	arq='ns'+str(i)+'.gro'
	v.append(build_raw_matrix(arq))
V=np.array(v)
CM =correct_matrix(V)
np.save('m.txt',CM)

