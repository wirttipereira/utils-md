 #Rafael Guimaraes - 7/11/18, 16/11/18, 10/12/18
 
 #ls *.tpr > tpr-files.dat
 #ls *pullf*.xvg > pullf-files.dat


gmx="/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx"
 
 #bin de 100
$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-100 -hist hist-100   -nice 0 -bins 100
 
 #bin de 200
$gmx wham -it 3-tpr-files.dat -if 3-pullf-files.dat -o profile-200 -hist hist-200   -nice 0 -bins 200
