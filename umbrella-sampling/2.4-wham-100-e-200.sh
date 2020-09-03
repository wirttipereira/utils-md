 #Rafael Guimaraes - 7/11/18, 16/11/18, 10/12/18
 
 #ls *.tpr > tpr-files.dat
 #ls *pullf*.xvg > pullf-files.dat

module load gromacs/5.1.5_openmpi_gnu

gmx="gmx_mpi"


for i in{40 100 250 500 1000}
do
	$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-$i -hist hist-$i   -nice 0 -bins $i
done

#
##bin de 100
#$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-100 -hist hist-100   -nice 0 -bins 100
#
##bin de 200
#$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-200 -hist hist-200   -nice 0 -bins 200
#
##bin de 400
#$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-400 -hist hist-400   -nice 0 -bins 400
#
##bin de 1000
#$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-1000 -hist hist-1000   -nice 0 -bins 1000



