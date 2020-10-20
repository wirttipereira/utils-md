'''

Ref para json: https://www.programiz.com/python-programming/json

'''
# nao estou usando esta estrutura de objeto para nada
class Grafico:
    def __init__(self, nome, x0,y0,x1,y1):
        self.nome = nome
        self.x0 = x0
        self.x1 = x1
        self.y0 = y0
        self.y1 = y1



import io #precisa para o encoding utf-8
import json

# Le o arquivo de configuracao, no formato JSON
with open('config.json','r') as file_json:
    data = json.load(file_json)

    titulo = data['titulo']
    folha = data['folha']
    rotulo_y = data['rotulo_y']
    rotulo_x = data['rotulo_x']
    linhas = data['linhas']
    colunas = data['colunas']
    curvas_por_quadro = data['curvas_por_quadro']
    arquivos = data['arquivos']
    tamanho_x = data['tamanho_x']
    tamanho_y = data['tamanho_y']
    # check de leitura do arquivo
    print('graficos: ', linhas * colunas)
    print(data['arquivos'])
    print(data['curvas_por_quadro'])

MARGEM_DIR = 0.15
MARGEM_ESQ = 0.15
MARGEM_CIMA = 0.1
MARGEM_BAIXO = 0.1
ESPACO_HORIZONTAL = .10
ESPACO_VERTICAL = .10
LARGURA = 1.4
ALTURA = 1.0
GRAFICOS = linhas * colunas

largura_grafico = round((LARGURA - (MARGEM_ESQ + MARGEM_DIR) - ((colunas -1 ) * ESPACO_HORIZONTAL))/colunas,6)
altura_grafico = round((ALTURA - (MARGEM_CIMA + MARGEM_BAIXO) - ((linhas -1 ) * ESPACO_VERTICAL))/linhas,6)

print(data)
print('largura: ',largura_grafico)
print('altura: ',altura_grafico)

x = []
y = []

for i in range(colunas):
    if i==0:
        x.append(MARGEM_ESQ)
        x.append(MARGEM_ESQ+largura_grafico)
    else:
        x.append(x[-1]+ESPACO_HORIZONTAL)
        x.append(x[-1]+largura_grafico)


for i in range(linhas):
    if i==0:
        y.append(round(MARGEM_BAIXO,6))
        y.append(round(MARGEM_BAIXO+altura_grafico,6))
    else:
        y.append(round(y[-1]+ESPACO_VERTICAL,6))
        y.append(round(y[-1]+altura_grafico,6))

g = []
cont = 0
for j in range(linhas):
    for i in range(colunas):
        aux = []
        print('g',cont)
        print('x0: ',x[i*2])
        print('y0: ',y[j*2])
        print('x1: ',x[i*2+1])
        print('y1: ',y[j*2+1])
        print('---')
        aux.append("%.6f" % x[i*2])
        aux.append("%.6f" % y[j*2])
        aux.append("%.6f" % x[i*2+1])
        aux.append("%.6f" % y[j*2+1])
        g.append(aux)
        cont = cont + 1
print(g)
print('===')
print(x,y)

VERSAO = '# Desenvolvido por: Rafael Guimaraes\n# Versao 1.1.20\n# ---\n'
TITULO = '\n@with string\n@    string on\n@    string loctype view\n@    string '+ str(LARGURA/2)+', '+str(ALTURA-MARGEM_CIMA/2)+'\n@    string color 1\n@    string rot 0\n@    string font 0\n@    string just 14\n@    string char size 1.360000\n@    string def "'+titulo+'"'
ROTULO_X = '\n@with string\n@    string on\n@    string loctype view\n@    string '+ str(LARGURA/2)+', '+str(MARGEM_BAIXO/2)+'\n@    string color 1\n@    string rot 0\n@    string font 0\n@    string just 14\n@    string char size 1.360000\n@    string def "'+rotulo_x+'"'
ROTULO_Y = '\n@with string\n@    string on\n@    string loctype view\n@    string '+ str(MARGEM_ESQ/2)+', '+str(ALTURA/2)+'\n@    string color 1\n@    string rot 90\n@    string font 0\n@    string just 14\n@    string char size 1.360000\n@    string def "'+rotulo_y+'"'

file_out = open('saida.agr','w')
# add versao no inicio do output
file_out.writelines(VERSAO +'\n')
# add config basica/fixa no output
file_aux = open('1.config','r')
file_out.writelines(file_aux)
# add strings avulsas necessarias ao grafico; o que nao quiser eh soh apagar ou mudar de posicao xy
file_out.writelines(TITULO)
file_out.writelines(ROTULO_X)
file_out.writelines(ROTULO_Y)
# add instrucoes gerais para o g0
cont = 0
cont2 = 0
for i in range(GRAFICOS):
    #for j in range(linhas):
        STR_G = '\n@g'+str(cont)+' on\n@g'+str(cont)+' hidden false\n@g'+str(cont)+' type XY\n@g'+str(cont)+' stacked false\n@g'+str(cont)+' bar hgap 0.000000\n@g'+str(cont)+' fixedpoint off\n@g'+str(cont)+' fixedpoint type 0\n@g'+str(cont)+' fixedpoint xy 0.000000, 0.000000\n@g'+str(cont)+' fixedpoint format general general\n@g'+str(cont)+' fixedpoint prec 6, 6\n@with g'+str(cont)+'\n@    world 0.25, 0, 1.2, 60\n@    stack world 0, 0, 0, 0\n@    znorm 1\n@    view '+ str(g[i][0])+', '+str(g[i][1])+', '+str(g[i][2])+', '+str(g[i][3])+'\n'
        file_out.writelines(STR_G)
        # add configuracoes do g0
        file_aux = open('2.config','r')
        file_out.writelines(file_aux)
        # add dados das curvas
        for j in range(curvas_por_quadro[i]):
            config_S = '\n@    s'+str(j)+' line linewidth 2\n'
            file_out.writelines(config_S)
            STR_S = '\n@target G'+str(i)+'.'+'S'+str(j)+'\n@type xy\n'
            file_out.writelines(STR_S)
            print(cont2,i,j)
            file_aux = open(arquivos[cont2],'r')
            file_out.writelines(file_aux)
            cont2 = cont2 + 1
        cont = cont + 1

# abre os arquivos de dados para construcao dos graficos
file_g0_s0 = io.open(arquivos[0],'r',encoding="utf-8")

f = file_g0_s0.readlines()
num_linhas = len(f)
print(num_linhas)

file_g0_s0.close()
file_out.close()
