#!/bin/bash

#RGP - 2.9.2020

#https://e-tinet.com/linux/sincronizacao-de-arquivos-no-linux-rsync/
#https://averagelinuxuser.com/automatically-backup-linux/
#--max-size='10m' #limita o tamanho de arquivo a 10 Mb


#Este comando abaixo eh para realizar backups do ambiente /scratch para a conta de usuario no Santos Dumont

#Se quiser adicionar ao crontab:
#crontab -e
#00 10 * * * rsync -avzh --max-size='20m' /scratch/ilsupercap/rafael.pereira2 ~/Backup
#realiza backup diario as 10h da manha

nohup rsync -avzh --max-size='20m' /scratch/ilsupercap/rafael.pereira2 ~/Backup &


