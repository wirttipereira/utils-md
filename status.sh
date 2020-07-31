#echo AS2DB80
#cd /home/rafagp/Github/S12g1/padua/x50/500-co2/2V-from-lammps/80ns-350K/inteiro-eniac
#tail -n 15 md_80_100.part0006.log | grep -A 2 Time

#echo AS0DB80
#cd /home/rafagp/Github/S12g1/padua/x50/500-co2/0V-from-lammps/80ns-350K 
#tail -n 15 md_80_100.part0007.log | grep -A 2 Time

echo AS2QB80
cd /home/rafagp/Github/S12g1/padua/x50/250-co2/2V-from-lammps/80ns-350K
tail -n 15 md.log | grep -A 2 Time #head -n 3

#echo AN2DB80
#cd /home/rafagp/Github/N1114/2V/D-500-co2/B-350K
#tail -n 15 md.part0005.log | grep -A 2 Time #head -n 3

#echo AN0DB80
#cd /home/rafagp/Github/N1114/0V/D-500-co2/B-350K
#tail -n 15 md.log | grep -A 2 Time #head -n 3

echo AS0QB80
cd /home/rafagp/Github/S12g1/padua/x50/250-co2/0V/B-350K
tail -n 15 md.part0005.log | grep -A 2 Time #head -n 3

#echo AN2QB80
#cd /home/rafagp/Github/N1114/2V/Q-250-co2/B-350K
#tail -n 15 md.part0004.log | grep -A 2 Time #head -n 3

#echo AN0QB80
#cd /home/rafagp/Github/N1114/0V/Q-250-co2/B-350K
#tail -n 15 md.part0004.log | grep -A 2 Time #head -n 3

echo AP2DB80
cd /home/rafagp/Github/P2O1/2.5V/D-500-co2/B-350K
tail -n 15 md.log | grep -A 2 Time

echo AP2QB80
cd /home/rafagp/Github/P2O1/2.5V/Q-250-co2/B-350K
tail -n 15 md.log | grep -A 2 Time

