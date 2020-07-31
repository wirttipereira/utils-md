from numpy import array
import sys #para usar o argumento de entrada na linha de comando

arquivo = 'eletrodo-dump.lammpstrj'#sys.argv[1]
N = 3328#sys.argv[2]
MASSA = '12.011'
POT = 'lj'
SIGMA = '3.5500'
EPSILON = '0.29288'
zoffset=24.3105

#numero_atomo = int(sys.argv[2]) 

file  = open('eletrodo.ff','w')
file2 = open('eletrodo.xyz','w')
file3 = open('eletrodo.sh','w')
file4 = open('eletrodo.gro','w')
#escreve a primeira linha do arquivo .ff
file.writelines('ATOMS')
#escreve as duas primeiras linhas do arquivo .xyz
file2.writelines(str(N)+'\n')
file2.writelines('eletrodo  eletrodo.ff')
#escreve as linhas do arquivo .sh
file3.writelines('fftool 1 eletrodo.xyz -b 1000 #gera pack.inp\n')
file3.writelines('packmol < pack.inp\n')
file3.writelines('fftool 1 eletrodo.xyz -b 1000 -g #gera run.mdp, field.top e config.pdb\n')
#primeiras 2 linhas do .gro
file4.writelines('RGP - dump_2_eletrodo.py\n')
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
    q = float(parts[5])
    #print(at,tipo,MASSA,q,POT,SIGMA,EPSILON)

    #.ff
    file.writelines('\n{:<6}{:<2}{:6}{:>11.9s}{:>3}{:>8.6}{:>8.7}'.format('e'+str(aux),tipo,MASSA,str(q),POT,SIGMA,EPSILON))
    #.xyz
    file2.writelines('\n{:<7}{:>10.8} {:>10.8} {:>10.8}'.format('e'+str(aux),parts[2],parts[3],parts[4]))
    #.gro
    file4.writelines('{:5}{:5}{:>5}{:5d}{:8.3f}{:8.3f}{:8.3f}\n'.format('999','ele','e'+str(aux),aux,x/10,y/10,z/10+zoffset))

file4.writelines('{:10.5f}{:10.5f}{:10.5f}'.format(4.,4.,15.))

file.close()
file2.close()
file3.close()
file4.close()

'''
* formato de numeros em Python: https://pyformat.info/ 

* gro format - http://manual.gromacs.org/archive/5.0.3/online/gro.html

residue number (5 positions, integer)
residue name (5 characters)
atom name (5 characters)
atom number (5 positions, integer)
position (in nm, x y z in 3 columns, each 8 positions with 3 decimal places)
velocity (in nm/ps (or km/s), x y z in 3 columns, each 8 positions with 4 decimal places)

C format
"%5d%-5s%5s%5d%8.3f%8.3f%8.3f%8.4f%8.4f%8.4f"
Fortran format
(i5,2a5,i5,3f8.3,3f8.4)

for at in sp.atom:
                    f.write('{0:5d}   {1:4s}  {2:5d}  {3:6s}   {4:5s}  {5:4d}'\
                            '  {6:8.4f}\n'.format(i, at.name, 1,
                            sp.name[0:5], at.name, 1, at.q))
                    i += 1
'''
