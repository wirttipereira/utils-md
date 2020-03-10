#RGP - 6.Jan.2020
# O parametro -b 10 eh para fazer uma caixa cubida de 45A de aresta.
# Nao tem problema, eu vou editar o arquivo de saida no proximo passo, colocando o tamanho da caixa que me convier
cp il-0.8.ff il.ff 

~/Github/fftool/fftool  200 emim.zmat 200 ntf2.zmat -b 50

sed -i -e 's/inside box.*$/inside box 0. 0. 0. 50.000 50.000  50.000/g' pack.inp

~/Github/packmol/packmol < pack.inp

~/Github/fftool/fftool 200 emim.zmat 200 ntf2.zmat -b 50 -g

sed -i -e 's/50.000   50.000   50.000/50.000   50.000   50.000/g' config.pdb

sed -i -e 's/simbox/tma-emim:ntf2 RGP/g' field.top
