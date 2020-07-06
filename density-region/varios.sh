for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 19 30
done
