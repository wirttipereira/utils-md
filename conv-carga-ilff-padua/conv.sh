#awk -F, '{$3=$3*a;print}' a=0.8 OFS=, x.ff
awk 'BEGIN{FS=OFS=","}{print $1,$2,$3*2.2,$4 $5 $6 $7}' il-atoms.ff 
