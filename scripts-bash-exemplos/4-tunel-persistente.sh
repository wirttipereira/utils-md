#!/bin/bash

#https://www.vivaolinux.com.br/topico/Kali-Linux/Executar-script-na-inicializacao-1
#o que funcionou foi o procedimento via crontab
#crontab -e
#@reboot /rotinas/3-tunel-persistente.sh
#tem que colocar chmod +x no arqivo .sh

#-M 10900
autossh -M 0 -fN -i /home/rafael/.ssh/id_rsa -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 19999:localhost:22 -p 10022 pi@wirttipereira.dyndns.org

#ftp
#autossh -M 0 -fN -i /home/rafael/.ssh/id_rsa -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R wirttipereira.dyndns.org:10021:localhost:21 rafael@wirttipereira.dyndns.org
