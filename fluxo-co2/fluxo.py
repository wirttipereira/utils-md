'''
--------------------------------------
Rafael Guimaraes Pereira - 10.Jun.2020
--------------------------------------
! wirttipereira@hotmail.com
! conta CO2 em diversas posicoes em caixa com eletrodo
!
!
!  .      ...... 1                           6  ......      .
!  .      ------                                ------      .
!  .             2                           7              .
!  .      ------ 3            5              8  ------      .
!  .  0   ------                                ------  10  .
!  .             4                           9              .
!  .      ------                                ------      .
!
!  \_____/\____/\______________________________/\____/\_____/
!    17nm   2nm               11nm                2nm   17nm    =  49nm
!
!
!
! Algoritmo:
! ---------
!
! 1. Ler configuracao .gro
! 2. Se z<17, estah na fase gas lado esquerdo. Add contador 'contador[0]'
! 3. Se z=>32, estah na fase gas lado direito. Add contador 'contador[10]'
! 3. Se z>=19 E z<30, estah no bulk. Add contador[5]
! 4. Se z>=17 E z<19, esta no eletrodo esq e,
!       Se y>=0 e y<1.5, esta no 'D'; Add contador[4]
!       Se y>=1.5 e y<2.25, esta no 'C'; Add contador[3]
!       Se y>=2.25 e y<3.75, esta no 'B'; Add contador[2]
!       Se y>=3.75, esta no 'A'; Add contador[1]
! 5. Se x>=30 E x<32, esta no eletrodo dir e,
!       Se y>=0 e y<1.5, esta no 'H'; Add contador[9]
!       Se y>=1.5 e y<2.25, esta no 'G'; Add contador[8]
!       Se y>=2.25 e y<3.75, esta no 'F'; Add contador[7]
!       Se y>=3.75, esta no 'E'; Add contador[6]

'''

from numpy import array
import sys #para usar o argumento de entrada na linha de comando

arquivo = sys.argv[1]
#print arquivo

file = open('output.txt','w')

contador = array([0,0,0,0,0,0,0,0,0,0,0])

with open(arquivo) as f:  #'teste.gro'
    data = f.readlines()
    #print data
    for line in data:

        #line = line.replace(' ',";")
        line = line.replace('\t',";")
        line = line.replace('\n'," ")
        line = line.replace('\n',"\"")
        line = line.rstrip()
        line = line.strip()
        
        #print line

        parts = line.split(";") # split line into parts
        y = float(parts[4])
        z = float(parts[5])
        #gravar = '\n'  + parts[4] + '\t' + parts[5] + '\t' + parts[6]
        
        #fase gas esquerda
        if(z < 17):
            contador[0] = contador [0] + 1
        #fase gas direita
        if(z >= 32): # if((z < 17) or (z >= 32)):
            contador[10] = contador [10] + 1
        #bulk
        if((z >= 19) and (z < 30)):
            contador[5] = contador [5] + 1
        #eletrodo esquerdo
        if((z >= 17) and (z < 19)):
            if((y >= 0) and (y < 1.5)): 
                contador[4] = contador [4] + 1
            if((y >= 1.5) and (y < 2.25)): 
                contador[3] = contador [3] + 1
            if((y >= 2.25) and (y < 3.75)): 
                contador[2] = contador [2] + 1
            if(y >= 3.75): 
                contador[1] = contador [1] + 1
        #eletrodo direito
        if((z >= 30) and (z < 32)):
            if((y >= 0) and (y < 1.5)): 
                contador[9] = contador [9] + 1
            if((y >= 1.5) and (y < 2.25)): 
                contador[8] = contador [8] + 1
            if((y >= 2.25) and (y < 3.75)): 
                contador[7] = contador [7] + 1
            if(y >= 3.75): 
                contador[6] = contador [6] + 1





        #file2.writelines(gravar)

    print "gas esq=0 || 1 / 2 / 3 / 4 || bulk=5 || 6 / 7 / 8 / 9 || gas dir=10"
    contador = contador / 3
    print contador
    print ('soma',sum(contador))
    
    file.writelines(str(contador))
    file.writelines(str(sum(contador)))

file.close()
