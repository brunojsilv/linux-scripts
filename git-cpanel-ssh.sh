#!/bin/bash

echo -e "\n- Gerador de chaves para repositórios privados SSH -\n"

echo "Informe o nome do host deste computador"
read host

echo "Informe o endereço do seu host de repositórios"
read repohost

ssh-keygen -q -t rsa -b 4096 -C "$USER@$host" -f ~/.ssh/id_rsa -N ''

echo -e "\nCopie a chave abaixo e instale no seu reposítorio privado:\n"

cat ~/.ssh/id_rsa.pub

echo -e "\nApós a instalação da chave pressione ENTER para continuar"
read

repoaux=$(ssh -To "StrictHostKeyChecking = no" git@$repohost | grep $host)

git clone git@$repohost:$repoaux

rm -rf $host
