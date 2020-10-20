file="acf-omp.log"

echo "RAFAEL GUIMARAES" >> $file
echo "CRIADO EM: 27.4.19" >> $file 
echo "MODIFICADO EM: 12.5.19" >> $file
echo "./visc - single core" >> $file
echo " " >> $file

#100k
echo "100k" >> $file
date >> $file
cp 100k-control.inpt control.inpt
./visc
cp acf_stress_all.out 100k-visc.dat 
date >> $file 


#50k
echo "50k" >> $file
date >> $file
cp 50k-control.inpt control.inpt
./visc
cp acf_stress_all.out 50k-visc.dat
date >> $file
