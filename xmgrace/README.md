# Pré-configurador para Xmgrace
Rafael Guimarães - 8.1.2020

Aqui temos um script em Python que facilita a montagem de matrizes de gráficos em Xmgrace.
Você deve editar o arquivo 'config.json', o que é bem intuitivo. Na linha de "arquivos" você deve indicar o caminho onde se encontram os dados (x,y) de cada curva que deseja plotar. Lembre que os arquivos serão plotados na ordem.
Exemplificando, se você indicou 2 linhas e 3 colunas, terá 2 gráficos. Se no primeiro gráfico você tem 3 curgas, no segundo 2 curvas e nos demais todos 1 curva em cada, você terá que informar [3,2,1,1,1,1] na linha "curvas_por_quadro" e 9 nomes com caminhos na linha "arquivos".

Exemplos. Neste diretório têm arquivos completos que rodam um exemplo de como utilizar a ferramenta.

Como rodar:

a. Abra o terminal do linux ou mac.
b. Edite o arquivo 'config.json'.
c. Coloque no mesmo diretório os arquivos contendo os dados (x,y) a serem plotados. Nota: é melhor deixar somente os dados, sem as linhas de configuração que eventualmente existam no início e/ou final do arquivo.
d. Digite python xmgrace-converter.py.

--- FIM ---
