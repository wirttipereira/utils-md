'''
RGP 22.8.2020
Utilidade: retirar o co2 que estah na fase gas ou mesmo ateh certa coordenada dentro do eletrodo

'''
#from numpy import array
import sys #para usar o argumento de entrada na linha de comando

#--- configurar ---
arquivo = 'in.gro'
N = 3328 		#int(sys.argv[2]). #numero de atomos 
total_at = "12428" 	#total de atomos no arquivo
zoffset= 0.1 		#dimensao do aperto de cada lado em nm
ultima_linha="   3.42600   4.50000  48.50000"
#------------------

file4 = open('out.gro','w')
#primeiras 2 linhas do .gro
file4.writelines('RGP - exclui-co2-gas.py\n')
file4.writelines(total_at+'\n')

aux = 0

with open(arquivo) as f:  # .gro
  data = f.readlines()
  for line in data[2:len(data)-1]:#faz skip das primeiras 2 linhas e da ultima
    aux = aux + 1
    z = float(line[37:44])
    if (z<z1 or z>z4):
        print z
        
    file4.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z))

#ultima linha, dimensoes da caixa
#file4.writelines('{:10.5f}{:10.5f}{:10.5f}'.format(4.,4.,15.))
file4.writelines(ultima_linha)
file4.close()

