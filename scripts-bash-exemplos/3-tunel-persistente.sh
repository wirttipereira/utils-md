#!/bin/bash

#https://www.vivaolinux.com.br/topico/Kali-Linux/Executar-script-na-inicializacao-1
#o que funcionou foi o procedimento via crontab
#crontab -e
#@reboot /rotinas/3-tunel-persistente.sh
#tem que colocar chmod +x no arqivo .sh

#-M 10900
autossh -M 0 -fN -i /home/rafael/.ssh/id_rsa -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 178.62.44.20:10022:localhost:22 rafael@178.62.44.20

#ftp
autossh -M 0 -fN -i /home/rafael/.ssh/id_rsa -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 178.62.44.20:10021:localhost:21 rafael@178.62.44.20
