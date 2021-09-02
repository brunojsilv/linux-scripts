#!/bin/bash

# Caminho do repositório Mozilla Thunderbird: https://download-installer.cdn.mozilla.net/pub/thunderbird/releases

clear

USUARIO=`whoami`
if [ "$USUARIO" != "root" ]; then 
  echo "ESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
  echo "Abortando..." 
  exit 1
fi

echo -e " - Instalador automatizado do cliente de e-mail Thunderbird - \n";

echo -e "Instalando... \n";

curl -o thunderbird.tar.bz2 https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/91.0.3/linux-x86_64/pt-BR/thunderbird-91.0.3.tar.bz2 > /dev/null 2>&1

tar -xf thunderbird.tar.bz2

rm -f thunderbird.tar.bz2

cp -rfu thunderbird /opt/

rm -rf thunderbird

cp thunderbird.desktop /usr/share/applications/

echo -e "\nInstalação concluída! \n";