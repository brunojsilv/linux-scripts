#!/bin/bash

echo "Informe o nome do usuário local"
read user

echo "Informe o nome do host"
read host

ssh-keygen -t rsa -b 4096 -C "$user@$host"

echo -e "\nCopie a chave abaixo e instale no seu reposítorio privado:\n"

cat ~/.ssh/id_rsa.pub

echo -e "\nPressione ENTER para continuar"

read

ssh -T git@bitbucket.org

echo "Informe o nome do reposítorio que aparece na saída acima:"
read repoaux

git clone git@bitbucket.org:$repoaux

rm -rf $host