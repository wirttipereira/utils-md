#Rafael Guimaraes Pereira - 15.Dec.2020
#Jobs forecast - Santos Dumont HPC

squeue |grep rafael.p |awk '{print $1}'> myjobs

while IFS= read line
do
 scontrol show jobid $line >> myjobs_detail

done<"myjobs"

cat myjobs_detail |grep JobName  |awk '{print $2}'> JobName
cat myjobs_detail |grep StartTime|awk '{print $1}'> StartTime

paste JobName StartTime > myjobs_forecast.txt

cat myjobs_forecast.txt |sort -k 2

rm myjobs
rm myjobs_detail
rm JobName
rm StartTime

