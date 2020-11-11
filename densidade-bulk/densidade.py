### Rafael Guimaraes Pereira - 19.Out.2020 #####################
#
# Rotina que recebe o .json do programa .sh e calcula a 
# densidade da caixa
################################################################
#Elemento	[g/mol]
#B	10.81
#C	12.01
#H	1
#F	19
#N	14.01
#P	30.973762
#O	16
#S	32.07

import json

nav = 6.02214076E23
#mm: massa molar
mm_B = 10.81
mm_C = 12.01
mm_H = 1.
mm_O = 16.
mm_F = 19.
mm_N = 14.01
mm_P = 30.973762
mm_S = 32.07


with open('out.json','r') as file_json:
    data = json.load(file_json)

    nAmostras = data['amostras'] #numero de amostras
    dx = data['dx']
    dy = data['dy']
    dz = data['dz']
    nC = data['C']
    nH = data['H']
    nN = data['N']
    nO = data['O']
    nS = data['S']
    nF = data['F']
    #nB = data['B']

    vol =dx * dy * dz * 1E-27 			#este ultimo conversao de nm3 para m3
    massa_g = (mm_C*nC/nav + mm_H*nH/nav + mm_N*nN/nav + mm_O*nO/nav + mm_S*nS/nav + mm_F*nF/nav)
    massa_kg = massa_g/(1000*nAmostras) #massa em Kg de uma amostra

    densidade = massa_kg/vol
    print(densidade)


