#! /bin/bash
for i in 24 25
do
sed -i '29,41d' data1.txt
sed -i '61,17908w positions.dat' data1.txt
sed -i '61,17908d' data1.txt
./close.x -0.5
sed -i '60r fort.21' data1.txt
cp data1.txt data$i.in
rm positions.dat
#sh roda.sh
sh roda-lammps-linha-eniac.sh
done
