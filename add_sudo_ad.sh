#!/bin/bash

ISROOT(){
	USUARIO=`whoami`
	if [ "$USUARIO" != "root" ]; then
		echo -e "\nESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
		echo -e "Abortando...\n" 
		exit 1
	fi
}

clear

ISROOT

echo "Informe o nome Netbios do domímio"
read $DOMINIO

echo "Informe o nome do usuário que deseja configurar como administrador do computador"
read $ADMIN

usermod -a -G sudo $DOMINIO\\$ADMIN