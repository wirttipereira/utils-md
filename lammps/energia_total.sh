cat saida.log|grep TotEng |awk '{print $3}' >TotEng.dat
tail -100000 TotEng.dat | awk '{sum += $1} END {print sum/100000}'>TotEng_avg.dat
cat TotEng_avg.dat


cat saida.log|grep Press |awk '{print $6}' >Press.dat
tail -100000 Press.dat | awk '{sum += $1} END {print sum/100000}'>Press_avg.dat
cat Press_avg.dat
