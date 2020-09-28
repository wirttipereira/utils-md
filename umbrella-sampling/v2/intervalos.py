#RGP 19.9.2020
#
#** valores aproximados, utilizando o density.xvg **
#em nm / ns
#
#inicio caixa:                   0.00 / -
#inicio percurso co2x:          14.78 / 0       
#inicio eletrodo esquerda:      16.67 / 1890ps
#final eletrodo esquerda:       19.96 / 
#inicio eletrodo direita:       27.21 /
#final eletrodo direita:                30.51 /
#final percurso co2x:           32.79 /
#final caixa:                   47.00 / -
#
#
#Percurso: 18nm em 18ns (1nm/ns)

regioes = [14.78, 16.67, 19.96, 27.21, 30.51, 32.79]
aux = [25,50,100,50,25]
l = len(regioes)

for i in range(len(regioes)-1):
	#print(i)
	print((regioes[i+1]-regioes[0])*1000, aux[i])
	
