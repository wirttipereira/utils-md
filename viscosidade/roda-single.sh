#!/bin/bash

file="acf-omp.log"

echo " " >> $file
echo "#########################" >> $file
echo "RAFAEL GUIMARAES" >> $file
echo "CRIADO EM: 27.4.19" >> $file 
echo "MODIFICADO EM: 12.5.19" >> $file
echo "./acf-omp - paralelizado" >> $file
echo " " >> $file

roda(){
	echo ${1} >> $file
	tempo_inicial="$(date -u +%s)"
	date >> $file
	cp ${1}-control.inpt control.inpt
	./acf
	cp acf_stress_all.out ${1}-visc.dat 
	date >> $file 
	tempo_final="$(date -u +%s)"
	tempo="$((tempo_final-$tempo_inicial))"
	echo "t calculo: $tempo seg." >> $file
}

#acf="50k"

roda "50k"
roda "100k"
roda "300k"
