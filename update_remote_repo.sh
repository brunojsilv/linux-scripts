#!/bin/bash

clear

echo -e "- Script de atualização de repositórios 1.0 -\n"

#Coleta de informações
echo "Informe endereço HTTPS do repositório remoto"
read repo

echo "Informe sua mensagem de commit"
read msgcom

echo "Informe seu nome completo"
read nome

echo "Informe seu endereço de email"
read email

#Configuração inicial do GIT
git config user.email "$email"
git config user.name "$nome"
git remote add org $repo

#Salvando alterações no repositório local
git add .
git commit -m '$msgcom'

#Enviando alterações para repositório remoto
git push org master

#Limpeza das configurações aplicadas ao repositório local
git remote rm org
git config --global --unset-all user.name
git config --global --unset-all user.email

clear