#!/bin/bash

clear

USUARIO=`whoami`
if [ "$USUARIO" != "root" ]; then 
  echo "ESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
  echo "Abortando..." 
  exit 1
fi

echo -e " - Instalador automatizado do cliente de e-mail Thunderbird - \n";

echo -e "OBS.: Certifique-se de baixar o arquivo de instalação e copiar para a pasta raiz deste script.\n";
echo -e "Download: https://www.thunderbird.net/pt-BR/ \n";

echo -e "Descompactando... [Passo 1/5]";
tar -xf thunderbird*.tar.bz2
sleep 1

echo -e "Removendo arquivo compactado... [Passo 2/5]";
rm -f thunderbird*.tar.bz2
sleep 1

echo -e "Copiando arquivos... [Passo 3/5]";
cp -rfu thunderbird /opt/
sleep 1

echo -e "Removendo pasta temporária... [Passo 4/5]";
rm -rf thunderbird
sleep 1

echo -e "Criando atalho... [Passo 5/5]";
cp thunderbird.desktop /usr/share/applications/
sleep 1

echo -e "\nInstalação concluída! \n";