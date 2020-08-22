'''
RGP 22.8.2020
Utilidade: retirar o co2 que estah na fase gas ou mesmo ateh certa coordenada dentro do eletrodo
Arquivo de entrada: in.gro
Arquivo de saida: out.gro


'''
#from numpy import array
import sys #para usar o argumento de entrada na linha de comando

#--- configurar ---
z1=18
z4=30
#N = 3328 		#int(sys.argv[2]). #numero de atomos 
#zoffset= 0.1 		#dimensao do aperto de cada lado em nm
#------------------

arquivo = 'in.gro'
file4 = open('out.gro','w')
aux = 0
numero_linhas = len(open(arquivo).readlines())
file4.writelines('RGP - exclui-co2-gas.py\n')
file4.writelines(str(numero_linhas-3)+'\n')


with open(arquivo) as f:  # .gro
  data = f.readlines()
  ult_linha = data[len(data)-1]
  #primeiras 2 linhas do .gro
  
  for line in data[2:len(data)-1]:#faz skip das primeiras 2 linhas e da ultima
    
    aux = aux + 1
    z = float(line[37:44])
    resname=line[5:8]

    if (resname=='co2'):
        #print resname
        if(z>z1 and z<z4):
            #print z
            file4.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z))
    else:
        #temp=0
        file4.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z))



file4.writelines(ult_linha)
file4.close()

#numero_linhas = len(open(arquivo).readlines())
with open('out.gro') as f:
    data = f.readlines()
    data[1] = str(len(data)-3)+'\n'

with open('out.gro','w') as f:
    f.writelines(data)
