from numpy import array
import sys #para usar o argumento de entrada na linha de comando

arquivo = 'dump.lammpstrj'#sys.argv[1]
N = 3328#sys.argv[2]
MASSA = '12.011'
POT = 'lj'
SIGMA = '3.55'
EPSILON = '0.29288'

#numero_atomo = int(sys.argv[2]) 


file4 = open('output.gro','w')
#escreve a primeira linha do arquivo .ff

file4.writelines('RGP - dump2gro.py\n')
file4.writelines(str(N)+'\n')

aux = 0

with open(arquivo) as f:  #'teste.gro'
  data = f.readlines()
  for line in data:
    aux = aux + 1
    line = line.replace('\t',";")
    line = line.replace('\n'," ")
    line = line.rstrip()
    line = line.strip()
    parts = line.split(" ") # split line into parts
    at = 'C'+parts[0]
    
    #if(aux>N/2):
    #  tipo = 'dir'
    #else:
    #  tipo = 'esq'
    tipo = 'C'

    x = float(parts[2])
    y = float(parts[3])
    z = float(parts[4])
    #q = float(parts[5])

    file4.writelines('{:5d}{:5}{:>5}{:5d}{:8.3f}{:8.3f}{:8.3f}\n'.format(aux,'ele','C'+str(aux),aux,x/10,y/10,z/10))

file4.writelines('{:10.5f}{:10.5f}{:10.5f}'.format(4.,4.,15.))

file4.close()

