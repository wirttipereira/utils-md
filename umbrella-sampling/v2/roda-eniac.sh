#RGP 23.9.2020

## deletar
#for i in {26131..26176..1}
#do
#	qdel $i.eniac
#	sleep 1
#done
## colocar
for i in {14000..16000..50} #15700
do
	qsub run$i.pbs
	sleep 1
done
#
#
##for i in {15725..18000..25}
#
#for i in 11900 12000 12100 12200 12300 12400 12450 12550 12650 12750 12800 12850 
#do
#	qsub run$i.pbs	
#done

#
#26131.eniac     victorva workq    run10800    28323   1  20    --  48:00 R 06:39
#26162.eniac     victorva workq    run11700    67335   1  10    --  48:00 R 04:24
#26163.eniac     victorva workq    run11800    67573   1  10    --  48:00 R 04:23
#26164.eniac     victorva workq    run11900    67987   1  10    --  48:00 R 04:19
#26165.eniac     victorva workq    run12000    68802   1  10    --  48:00 R 04:17
#26166.eniac     victorva workq    run12100    68977   1  10    --  48:00 R 04:17
#26167.eniac     victorva workq    run12200    69154   1  10    --  48:00 R 04:17
#26168.eniac     victorva workq    run12300    69327   1  10    --  48:00 R 04:16
#26169.eniac     victorva workq    run12400     3495   1  10    --  48:00 R 04:17
#26170.eniac     victorva workq    run12450     4234   1  10    --  48:00 R 04:11
#26171.eniac     victorva workq    run12500     4423   1  10    --  48:00 R 04:11
#26172.eniac     victorva workq    run12550     4608   1  10    --  48:00 R 04:11
#26173.eniac     victorva workq    run12600     4792   1  10    --  48:00 R 04:11
#26174.eniac     victorva workq    run12650     4972   1  10    --  48:00 R 04:11
#26175.eniac     victorva workq    run12700     5157   1  10    --  48:00 R 04:11
#26176.eniac     victorva workq    run12750     5358   1  10    --  48:00 R 04:11
#26177.eniac     victorva workq    run12800    43267   1  10    --  48:00 R 04:11
#26178.eniac     victorva workq    run12850    43401   1  10    --  48:00 R 04:11
