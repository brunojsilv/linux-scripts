#!/bin/bash
clear

USUARIO=`whoami`
if [ "$USUARIO" != "root" ]; then 
  echo "ESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
  echo "Abortando..." 
  exit 1
fi

echo -e " - Instalador automatizado do cliente de e-mail Thunderbird - \n";

curl https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/91.0/linux-x86_64/pt-BR/thunderbird-91.0.tar.bz2 --output thunderbird.tar.bz2

tar -xvf thunderbird.tar.bz2

rm -f thunderbird.tar.bz2

mv thunderbird /opt/

cp thunderbird.desktop /usr/share/applications/