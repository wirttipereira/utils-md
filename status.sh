echo AS2DB50
cd /home/rafagp/Github/S12g1/2V/D-500-co2/B-350K/3
tail -n 15 md.log | grep -A 2 Time

echo AS0DB.3
cd /home/rafagp/Github/S12g1/0V/D-500-co2/B-350K/3
tail -n 15 md.part0002.log | grep -A 2 Time

echo AS2QB80.3
cd /home/rafagp/Github/S12g1/2V/Q-250-co2/B-350K/3
tail -n 15 md.log | grep -A 2 Time #head -n 3

#echo AN2DB80
#cd /home/rafagp/Github/N1114/2V/D-500-co2/B-350K
#tail -n 15 md.part0005.log | grep -A 2 Time #head -n 3

#echo AN0DB80.2
#cd /home/rafagp/Github/N1114/0V/D-500-co2/B-350K/2
#tail -n 15 md.log | grep -A 2 Time #head -n 3

echo AS0QB80
cd /home/rafagp/Github/S12g1/0V/Q-250-co2/B-350K
tail -n 15 md.log | grep -A 2 Time #head -n 3

#echo AN2QB80
#cd /home/rafagp/Github/N1114/2V/Q-250-co2/B-350K
#tail -n 15 md.part0004.log | grep -A 2 Time #head -n 3

#echo AN0QB80
#cd /home/rafagp/Github/N1114/0V/Q-250-co2/B-350K
#tail -n 15 md.part0004.log | grep -A 2 Time #head -n 3
#echo AP2QB80
#cd /home/rafagp/Github/P2O1/2.5V/Q-250-co2/B-350K
#tail -n 15 md.part0003.log | grep -A 2 Time
#
#echo AP2DB80
#cd /home/rafagp/Github/P2O1/2.5V/D-500-co2/B-350K
#tail -n 15 md.log | grep -A 2 Time

#echo AP0 - lammps
#cd /home/rafagp/Github/P2O1/config/0V/RES__Dump_P2O1_eletrodo_misto/sim3
#tail -n 5 saida.log | grep Step # | cut -d " " -f 6

echo TCBImRig20
cd /home/rafagp/Github/emim-bcn4/conf-eletrodo-rigido
tail -n 15 md.log | grep -A 2 Time


