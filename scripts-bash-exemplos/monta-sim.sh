#Rafael GP - 21.8.19
#
#É interessante montar a primeira simulação da série do líquido iônico, por exemplo, 50%tma e 0q, e depois usar este script para as demais cargas.
#Precisa editar os arquivos graphene.itp e forcefield.itp para ajustar as cargas
#Precisa fazer o steep e os primeiros md tb em cada diretoria, antes de deixar o batch
#-------------

#Diretorios que serão criados e para onde serão copiados os arquivos padrao

dir=(u30 u31 u32 u33 u34 u35)

#É neste caso o padrao para os demais, pois é o de carga 0q


cd u29

function copia {
	echo $1 
	cp *itp $1
	cp *xyz $1
	cp md.mdp $1
	cp caixa-minimizada.gro $1
	cp topol.top $1
}

for i in "${dir[@]}"
do
	mkdir '../'$i
done

for i in "${dir[@]}"
do
	copia '../'$i
done

cd ../u1
cp forcefield.itp graphene.itp c60_8un.itp ../u29
cd ../u2
cp forcefield.itp graphene.itp c60_8un.itp ../u30
cd ../u3
cp forcefield.itp graphene.itp c60_8un.itp ../u31
cd ../u4
cp forcefield.itp graphene.itp c60_8un.itp ../u32
cd ../u5
cp forcefield.itp graphene.itp c60_8un.itp ../u33
cd ../u6
cp forcefield.itp graphene.itp c60_8un.itp ../u34
cd ../u7
cp forcefield.itp graphene.itp c60_8un.itp ../u35

