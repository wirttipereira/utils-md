#16.1.2021 - Rafael Guimaraes

cat self_cont.out    | awk '{print $1,$2+$3+$4}' > aux1
cat distinct_1.out   | awk '{print $2+$3+$4}'    > aux2
cat distinct_2.out   | awk '{print $2+$3+$4}'    > aux3
paste aux1 aux2 aux3 | awk '{print $1,$2+$3+$4}' > soma.out
rm aux1 aux2 aux3
