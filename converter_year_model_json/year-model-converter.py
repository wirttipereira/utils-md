# -*- coding: utf-8 -*-

'''
-------------------------------------
Rafael Guimaraes Pereira - 12.Nov.2019
-------------------------------------
in.txt :    arquivo onde se coloca os dados para converter para json. São duas colunas, na primeira vai a chave e na segunda o conteudo. 
            São separadas por ';'. Tem que revisar o texto pois na segunda coluna normalmente o usuario da planilha de origem pode ter dado 
            nova linha. Tem que estar tudo na mesma linha.
            Os textos não podem conter aspas " "


out.json :  O código gera este arquivo como saída, já no formato json.

>> ref para tirar a último caracter em branco: https://docs.python.org/3/library/stdtypes.html#str.rstrip
            
'''


import io #precisa para o encoding utf-8

arquivo = 'year-model'

file1 = io.open(arquivo+'-in.txt','r',encoding="utf-8")
file2 = open(arquivo+'-out.json','w')

f = file1.readlines()
num_linhas = len(f)

                     

labels = ['year_model','', '', '', '', '']
inicio = '\n\t{\n\t\t\"'
final_string = '\"\n\t}'
final_numero = '\n\t}'
antes_de_numero = '\":'
depois_de_numero = ',\n\t\t\"'
antes_de_string = '\":\"'
depois_de_string = '\",\n\t\t\"'


with open(arquivo+'-in.txt') as inf:
    contador = 1
    file2.writelines('[')
    for line in inf:
        
        line = line.replace('\t',"")
        line = line.replace('\n'," ")
        line = line.replace('\n',"\"")
        line = line.rstrip()
        parts = line.split(";") # split line into parts
        

        gravar = inicio + labels[0] + antes_de_numero + parts[0] +  final_numero

        if (num_linhas>contador):
            file2.writelines(gravar+',')
        else:
            file2.writelines(gravar+'\n]')

        contador = contador +1
        print contador
    
    #file2.writelines('\n}')

file1.close()
file2.close()
