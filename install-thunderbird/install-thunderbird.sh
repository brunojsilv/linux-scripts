#!/bin/bash

clear

USUARIO=`whoami`
if [ "$USUARIO" != "root" ]; then 
  echo "ESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
  echo "Abortando..." 
  exit 1
fi

echo -e " - Instalador automatizado do cliente de e-mail Thunderbird - \n";

echo -e "OBS.: Certifique-se que o arquivo de instalação está na pasta raiz deste script.\n";

echo -e "Instalando... \n";

tar -xf thunderbird*.tar.bz2

rm -f thunderbird*.tar.bz2

cp -rfu thunderbird /opt/

rm -rf thunderbird

cp thunderbird.desktop /usr/share/applications/

echo -e "\nInstalação concluída! \n";