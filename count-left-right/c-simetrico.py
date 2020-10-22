#!/usr/bin/python

#Rafael Guimaraes Pereira - 9.Aug.2020, 19.Aug.2020
#wirttipereira@hotmail.com
#####################################

#-----------------------------------------------------------
### CONFIGURAR #############################################
# vetor com dimensoes da caixa
#zr=[0,16.62,19.94,28.18,31.49,48.5] #sulfonio
zr=[0,17.23,20.52,28.00,31.28,48.5] #amonio
#zr=[0, 16.06, 19.37, 29.07, 32.35, 48.5] #fosfonio
offset_gas=2  #nm que fase gas avanca para dentro do eletrodo
offset_bulk=0.5 #nm que bulk recua da face inerna do eletrodo
caixa_dx=3.42 #dimensao x da caixa
caixa_dy=4.50 #dimensao y da caixa
intervalo=100 #intervalo entre um .gro e o proximo
nconf=1001    #numero de arquivos .gro contando com ns0.gro
############################################################
#-----------------------------------------------------------

#aplica offset na fase gas
zr[1]=zr[1]+offset_gas
zr[4]=zr[4]-offset_gas
#aplica offset no bulk
zr[2]=zr[2]+offset_bulk
zr[3]=zr[3]-offset_bulk

print zr

cx_vol_bulk= caixa_dx * caixa_dy * (zr[3]-zr[2])
#print(cx_vol_bulk)
print ('tempo left right left+right gas total')
ultima_linha="   3.42600   4.50000  48.50000"


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
	#print linhas, colunas #as linhas sao os diferentes tempos (ou configuracoes). As colunas sao os atom dentro de cada config
	
	for i in range(linhas):
		left=0
		right=0
		gas=0
		for j in range(colunas):
			if((rawM[i,j]+rawM[i-1,j])==3): #se o co2 passou direto de 1 para 2 ou 2 para 1, volta ao status anterior
				#print "XXXXX"
				#print rawM[i,j], rawM[i-1,j]
				rawM[i,j] = rawM[i-1,j]
				#print rawM[i,j], rawM[i-1,j]

			if(rawM[i,j]==9): #se esta no bulk
				rawM[i,j]=rawM[i-1,j]		#retorna ao valor anterior para nao perder o rastro de qual fenda veio
				if(rawM[i-1,j]==1):
					left = left + 1
				elif(rawM[i-1,j]==2):
					right = right + 1
				elif(rawM[i-1,j]==0):
					gas = gas + 1
			
		#i*100 pois esta na escala de ps
		#print i*100, left, right, left+right, gas, left+right+gas
		
		#print i*intervalo, left/cx_vol_bulk/3, right/cx_vol_bulk/3, (left+right)/cx_vol_bulk/3, gas/cx_vol_bulk/3, (left+right+gas)/cx_vol_bulk/3
		print i*intervalo, left/cx_vol_bulk, right/cx_vol_bulk, (left+right)/cx_vol_bulk, gas/cx_vol_bulk, (left+right+gas)/cx_vol_bulk
		#print i*intervalo, left, right, (left+right), gas
		
		#divide pelo volume para normalizar
		#divide por 3 pois o co2 tem 3 atomos, assim fica ponderado 'por molecula de co2'

	return rawM

v=[]
for i in range(0,nconf):
	arq='ns'+str(i*intervalo)+'.gro' #i*100 quando esta na escala de ps
	v.append(build_raw_matrix(arq))
V=np.array(v)
CM =correct_matrix(V)
np.save('m.txt',CM)

