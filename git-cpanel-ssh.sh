#!/bin/bash

echo "Informe o nome do host"
read host

ssh-keygen -t rsa -b 4096 -C "$USER@$host"

echo -e "\nCopie a chave abaixo e instale no seu reposítorio privado:\n"

cat ~/.ssh/id_rsa.pub

echo -e "\nPressione ENTER para continuar"

read

repoaux=$(ssh -To "StrictHostKeyChecking = no" git@bitbucket.org | grep $host)

git clone git@bitbucket.org:$repoaux

rm -rf $host