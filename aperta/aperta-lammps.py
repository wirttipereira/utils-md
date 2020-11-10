'''
RGP 5.8.2020
Utilidade: apertar eletrodos para evitar vacuo na caixa

Configurar: 
==========
- variaveis 'arquivo' e 'N'
- Retirar as 2 primeiras linhas do arquivo de entrada 'in.gro'

Uso:
===

> python aperta.py arquivo.entrada.gro

'''

import sys #para usar o argumento de entrada na linha de comando
#--- configurar ---
arquivo = 'positions.dat'    #sys.argv[1]
total_at = "14400" 	         #total de atomos no arquivo
offset= 2.  		         #dimensao do aperto de cada lado em nm
#------------------

file4 = open('fort.21','w')

aux = 0

with open(arquivo) as f:  #'teste.gro'
  data = f.readlines()
  for line in data: #data[0:len(data)-0]:#faz skip das primeiras i linhas e das j ultimas
    #print(line)
    aux = aux + 1
    #line = line.replace('\t',";")
    #line = line.replace('\n'," ")
    #line = line.rstrip()
    #line = line.strip()
    #parts = line.split(" ") # split line into parts
    #z = float(line[37:44])
    n_at = line[0:5]
    #print(n_at)
    mol  = int(line[6:11])
    #print(mol)
    tipo  = line[12:15]
    carga = float(line[16:24])
    x = float(line[25:34])
    y = float(line[35:44])
    z = float(line[45:56])

    if(mol==781): #ELE esquerdo
        z = z + offset
    if(mol==782): #ELE direito
        z = z - offset
    if(mol==783):
        if(z>0):
            z = z - offset
        else:
            z = z + offset
  
    #file4.writelines('{:>10}{:>5}{:>5}{:>8}{:>8}{:8.3f}\n'.format(line[0:10],line[10:15],line[16:20],line[21:28],line[29:36],z))
    file4.writelines('{:10}{:10}{:10}{:10f} {:10f} {:10f} {:10f}\n'.format(n_at,mol,tipo,carga,x,y,z))

#ultima linha, dimensoes da caixa
#file4.writelines('{:10.5f}{:10.5f}{:10.5f}'.format(4.,4.,15.))
#file4.writelines(ultima_linha)
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

