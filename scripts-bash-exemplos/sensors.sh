#!/usr/bin/bash

HOST='wirttipereira.dyndns.org' 
USER='pi'
ARQUIVO='sensors-fermi-temp.txt'

echo "########################################" > $ARQUIVO
echo "Fermi" >> $ARQUIVO
date >> $ARQUIVO
echo "########################################" >> $ARQUIVO
sensors >> $ARQUIVO

#enviar o resultado do sensors para o RPI

sftp  -P 10022 $USER@$HOST << EOT
cd codes 
put $ARQUIVO
bye
EOT

