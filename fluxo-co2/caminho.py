from numpy import array
import sys #para usar o argumento de entrada na linha de comando

arquivo = sys.argv[1]

numero_atomo = int(sys.argv[2]) 

file = open('caminho.txt','w')

contador = array([0,0,0,0,0,0,0,0,0,0,0])
aux = 0

with open(arquivo) as f:  #'teste.gro'
    data = f.readlines()
    #print data
    for line in data:
 
	aux = aux + 1
 	#print aux	
	if (aux == numero_atomo):  
          line = line.replace('\t',";")
          line = line.replace('\n'," ")
          line = line.replace('\n',"\"")
          line = line.rstrip()
          line = line.strip()
          
          parts = line.split(";") # split line into parts
          y = float(parts[4])
          z = float(parts[5])
          #gravar = '\n'  + parts[4] + '\t' + parts[5] + '\t' + parts[6]
          #file2.writelines(gravar)
        
	  print(y,z)
 	
    #contador = contador / 3
    #print contador
    
    file.writelines(str(y) + '  ' + str(z))
    #file.writelines(str(sum(contador)))

file.close()
