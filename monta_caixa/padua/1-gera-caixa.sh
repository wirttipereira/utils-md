#RGP - 6.Jan.2020
# O parametro -b 10 eh para fazer uma caixa cubida de 45A de aresta.
# Nao tem problema, eu vou editar o arquivo de saida no proximo passo, colocando o tamanho da caixa que me convier

packmol='/home/rafagp/github/packmol/packmol'

cp il-0.8.ff il.ff 

./fftool 450 N1111.zmat 450 ntf2.zmat -b 50
sleep 2

sed -i -e 's/inside box.*$/inside box 0. 0. -70. 34.868  45.000  70.000/g' pack.inp

$packmol < pack.inp
sleep 2

./fftool 450 N1111.zmat 450 ntf2.zmat -b 34.868,45.000,220.000 -l

##Gromacs
#sed -i -e 's/50.000   50.000   50.000/50.000   50.000   50.000/g' config.pdb
#sed -i -e 's/simbox/N1111:Tf2N RGP/g' field.top
