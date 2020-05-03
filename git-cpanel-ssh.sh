#!/bin/bash

echo -e "\n- Gerador de chaves para repositórios privados BitBucket -\n"

echo "Informe o nome do host deste computador"
read host

ssh-keygen -t rsa -b 4096 -C "$USER@$host" -f ~/.ssh/id_rsa

echo -e "\nCopie a chave abaixo e instale no seu reposítorio privado:\n"

cat ~/.ssh/id_rsa.pub

echo -e "\nApós a instalação da chave pressione ENTER para continuar"

read

saida=1
while [ $saida != 0 ]
do
    repoaux=$(ssh -To "StrictHostKeyChecking = no" git@bitbucket.org | grep $host)

    if [ $repoaux == "" ]; then
        echo -e "\nRepositório não encontrado! \n\nPresione ENTER para tentar novamente..."
        read
    else
        saida=0
        echo -e "\nRepositório encontrado! Executando clone de teste\n"
        git clone git@bitbucket.org:$repoaux
        rm -rf $host
        echo -e "\nProcesso concluído!\n"
    fi

done