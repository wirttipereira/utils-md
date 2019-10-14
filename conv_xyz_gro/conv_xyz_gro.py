# -*- coding: utf-8 -*-

'''
-------------------------------------
Rafael Guimaraes Pereira - 13.Out.2019
-------------------------------------
mistura.xyz : 	arquivo onde se coloca os dados para converter para json. São duas colunas, na primeira vai a chave e na segunda o conteudo. 
			São separadas por ';'. Tem que revisar o texto pois na segunda coluna normalmente o usuario da planilha de origem pode ter dado 
			nova linha. Tem que estar tudo na mesma linha.
            Os textos não podem conter aspas " "

			ex:
			lblNoDiscardVehicles;	Você não possui veículos descartados
			lblNoDiscardVehiclesSub;	Para descartar veículos, arraste o veículo para esquerda, na sua lista de matches.

temp.gro : 	O código gera este arquivo como saída, já no formato json compacto.
			ex:
			{ "lblNoDiscardVehicles": {"pt-Br": "Você não possui veículos descartados "},"lblNoDiscardVehiclesSub": {"pt-Br": "Para descartar veículos, arraste o veículo para esquerda, na sua lista de matches."} }
'''


import io #precisa para o encoding utf-8
import datetime

#nome especie, at por molec, num molec
#
res_name = ['tma','emim','ntf2']
res_at = [17,19,15]
res_mol = [304,304,608]
#
#---------------------------------

especies = len(res_name)
atomos = []

for i in range(especies):
    atomos.append(res_at[i] * res_mol[i])

atomos_total = sum(atomos)

print(atomos)
print('atomos_total', atomos_total)
print('especies', especies)

#---------------------------------

file1 = io.open('mistura.xyz','r',encoding="utf-8")
file2 = open('temp.gro','w')

f = file1.readlines()
num_linhas = len(f)


with open('mistura.xyz') as inf:
    contador = 0

    dt_date = datetime.datetime.now()

    file2.writelines('Rafael GP - ' + dt_date.strftime("%A, %d %b %Y") )
    file2.writelines('\n'+str(atomos_total))

    for line in inf:
        parts = line.split(";") 
        
        if (contador < atomos[0]):
            residuo = res_name[0]
        elif (contador < atomos[0]+atomos[1])
            residuo = res_name[1]
        else
            residuo = res_nname[2]
            
        res_number = i
        atom_name = parts[0]
        atom_number = str(contador)
        strx = parts[1]
        stry = parts[2]
        strz = parts[3]
        x = float(strx)/10
        y = float(stry)/10
        z = float(strz)/10
        x=format(x, '.3f') #x = float("{0:.3f}".format(x))
        y=format(y, '.3f')
        z=format(z, '.3f')
        strx = str(x)
        stry = str(y)
        strz = str(z)
        residuo = str(residuo)    
        #res_number = '%5s' % res_number
        residuo = '%5s' % residuo
        atom_name = '%5s' % atom_name 
        atom_number = '%5s' % atom_number
        strx = '%8s' % strx
        stry = '%8s' % stry
        strz = '%8s' % strz

        gravar = '\n'  + residuo + atom_name + atom_number + strx + stry  + strz
        file2.writelines(gravar)

        contador = contador +1
        #print contador
    
    file2.writelines('\n  4.00000   4.00000  20.00000')


file1.close()
file2.close()
