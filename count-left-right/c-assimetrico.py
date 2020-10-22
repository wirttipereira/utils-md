#!/usr/bin/python

#Rafael Guimaraes Pereira - Last reviewed in 21.Oct.2020
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
print ('tempo left_small left_big ls+lr right_small right_big 4gas')
ultima_linha="   3.42600   4.50000  48.50000"


import numpy as np

def build_raw_matrix(arq_in):
	v=[]
	with open(arq_in) as fa:
		data_fa = fa.readlines()
		for line_fa in data_fa[2:len(data_fa)-1]:
			try:
	  	  		z = float(line_fa[37:44])
	  	  		y = float(line_fa[30:36])
	  	  		#print(y)
	  	  		if ((z<zr[1]) or (z>zr[4])): 		#fase gas
	  	  			label = 0
	  	  		elif ((z>=zr[1]) and (z<=zr[2])):	#eletrodo esquerdo
					#label = 1
					#
					if ((y<0.75) or ((y>=2.25) and (y<3.0))): #condicao das fendas pequenas
						label = 2 #fenda esq pequena
					else:
						label = 3 #fenda esq grande

		  		elif ((z>=zr[3]) and (z<=zr[4])):	#eletrodo direita
					#label = 2
					#
					if ((y<0.75) or ((y>=2.25) and (y<3.0))): #condicao das fendas pequenas
						label = 4 #fenda dir pequena
					else:
						label = 5 #fenda dir grande 

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
		left_small=0
		left_big=0
		right_small=0
		right_big=0
		gas=0
		for j in range(colunas):
			aux = rawM[i,j]+rawM[i-1,j]
			if(aux==6 or aux ==7 or aux==8): #se o co2 passou direto do eletrodo da esq para dir (ou vice-versa), volta ao status anterior
				#nao estou contabilizando quantos ESTAO no momento no eletrodo

				#print "XXXXX"
				#print rawM[i,j], rawM[i-1,j]
				rawM[i,j] = rawM[i-1,j]		#retorna ao valor anterior para nao perder o rastro de qual fenda veio
				#print rawM[i,j], rawM[i-1,j]

			if(rawM[i,j]==9): #se esta no bulk - este que nos interessa
				rawM[i,j]=rawM[i-1,j]		#retorna ao valor anterior para nao perder o rastro de qual fenda veio
				
				if(rawM[i-1,j]==2):
					left_small 	= left_small + 1
				elif(rawM[i-1,j]==3):
					left_big 	= left_big 	 + 1
				elif(rawM[i-1,j]==4):
					right_small = right_small+ 1
				elif(rawM[i-1,j]==5):
					right_big 	= right_big  + 1
				elif(rawM[i-1,j]==0):
					gas=gas + 1

			
		#i*100 pois esta na escala de ps
		#print i*100, left, right, left+right, gas, left+right+gas
		
		#print i*intervalo, left_small/cx_vol_bulk/3, left_big/cx_vol_bulk/3, right_small/cx_vol_bulk/3, right_big/cx_vol_bulk/3, gas/cx_vol_bulk/3
		print 	i*intervalo,\
				left_small/cx_vol_bulk,\
				left_big/cx_vol_bulk,\
				(left_small+left_big)/cx_vol_bulk,\
				right_small/cx_vol_bulk,\
				right_big/cx_vol_bulk,\
		 	    gas/cx_vol_bulk
		#print i*intervalo, left_small, left_big, (left_small+left_big), right_small, right_big, (right_small+right_big),gas
		
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


#Historic
#21.Oct.2020
#  Added parameters to separate which atoms enters into the smaller or the bigger pores. 
#  Selection using 'y' coordinate.
#
#19.Aug.2020 
# No comments.
#
#9.Aug.2020
# No comments.
