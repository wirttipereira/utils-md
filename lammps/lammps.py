# -*- coding: utf-8 -*-

'''
-------------------------------------
Rafael Guimaraes Pereira - 4.Fev.2020
-------------------------------------

Algoritmo:

1. le o arquivo
2. transforma o que leu em 'dataframe'
3. ordena a coluna 'z' de forma crescente
4. divide a caixa em 'n' bins (numero de slices)
5. computa quantas moléculas tem em cada slice e contabiliza cada bin

			
'''


#import io #precisa para o encoding utf-8
import pandas as pd


slices = 400

arquivo_entrada = 'lammps-in.txt' #'dump.lammpstrj'
arquivo_saida = 'lammps-out.txt'


#ler no pandas para colocar em dataframe
aux = pd.read_csv(arquivo_entrada,sep=" ") 
df = pd.DataFrame(aux)

df.columns = df.columns.str.rstrip()
df = df.drop(labels='del', axis=1)

#print df.head()

#sort para coluna 'z' ascendente
df.sort_values(by=['z'], inplace=True)
#print df.head()
#df_np = df.to_numpy()
#print('======')
#print df_np
#print df_np.max(0)
#print df_np[3][0]
z_max = df.max(0)[7]
z_min = df.min(0)[7]

passo = (z_max-z_min)/slices
print (passo)

z_atual = z_min
linhas = df.count(0)[7]


for i in range(0,slices+1):
    aux = df[df.z >= z_atual]
    aux = aux[aux.z < z_atual+passo]
    #print aux
    print (aux.count()[7])
    z_atual = z_atual + passo
