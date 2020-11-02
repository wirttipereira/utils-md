from numpy import array
import sys #para usar o argumento de entrada na linha de comando

arquivo = 'il-dump.lammpstrj'#sys.argv[1]
#N = 3328#sys.argv[2]
#especie 1
Nat1 = 8
Nmol1 = 350
name1 = 'nc4'
#especie 2
Nat2 = 15
Nmol2 = 350
name2 = 'ntf2'

zoffset= ((7.191) - (-7.31))/2 - 7.191 + 48.5/2

Ntotal = Nat1*Nmol1 + Nat2*Nmol2
print Ntotal

#numero_atomo = int(sys.argv[2]) 

file4 = open('il.gro','w')
#primeiras 2 linhas do .gro
file4.writelines('RGP - il2gro.py\n')
file4.writelines(str(Ntotal)+'\n')

aux = 0
aux2= 0 #para arrumar os atomos da primeira especie
with open(arquivo) as f:  #'teste.gro'
  data = f.readlines()
  for line in data:
    aux = aux + 1
    if(aux2<=7):
        aux2= aux2+ 1
    else:
        aux2=1

    line = line.replace('\t',";")
    line = line.replace('\n'," ")
    line = line.rstrip()
    line = line.strip()
    parts = line.split(" ") # split line into parts
   
    seq = parts[0]
    at_label = parts[1]
    x = float(parts[2])
    y = float(parts[3])
    z = float(parts[4])
    #q = float(parts[5])

    if (aux<=Nat1*Nmol1):
        residuo = name1
        # Cn, Nq, Cn, Cn, C2, C3, C4, Ct //nomenclatura do FF Magin (Leo)
        ## FF Padua (customizado nosso), abaixo: Cnx, N4x, C2x, C3x, C4x e Ctx
        if(aux2==1):
            at_label = 'Cnx'
        if(aux2==2):
            at_label = 'N4x'
        if(aux2==3):
            at_label = 'Cnx'
        if(aux2==4):
            at_label = 'Cnx'
        if(aux2==5):
            at_label = 'C2x'
        if(aux2==6):
            at_label = 'C3x'
        if(aux2==7):
            at_label = 'C4x'
        if(aux2==8):
            at_label = 'Ctx'
    else:
        residuo = name2

# Antigo: C, S, N, S, C, O, O, O, O, F, F, F, F, F, F
# Novo:   CBT,SBT,NBT,SBT,CBT,OBT,OBT,OBT,OBT,F1,F1,F1,F1,F1,F1,
# por hora vou fazer o VI que eh mais facil


    #.gro
    #file4.writelines('{:5d}{:5}{:>5}{:5d}{:8.3f}{:8.3f}{:8.3f}\n'.format(aux,'C'+str(aux),'ele',aux,x/10,y/10,z/10))
    file4.writelines('{:>5}{:5}{:>5}{:5d}{:8.3f}{:8.3f}{:8.3f}\n'.format(seq,residuo,at_label,aux,x/10,y/10,z/10+zoffset))

file4.writelines('{:10.5f}{:10.5f}{:10.5f}'.format(4.,4.,15.))

file4.close()
