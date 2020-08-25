#RGP - 25.8.2020
#script para submeter jobs no ENIAC

for i in {13000..23000..1000}
do
	qsub run$i.pbs
done 
