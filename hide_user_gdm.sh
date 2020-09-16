#!/bin/bash

ISROOT(){
	USUARIO=`whoami`
	if [ "$USUARIO" != "root" ]; then
		echo -e "\nESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
		echo -e "Abortando...\n" 
		exit 1
	fi
}

HIDEUSER(){
    touch /var/lib/AccountsService/users/$REMUSER
    echo '[User]' >> /var/lib/AccountsService/users/$REMUSER
    echo 'Language=' >> /var/lib/AccountsService/users/$REMUSER
    echo 'XSession=gnome' >> /var/lib/AccountsService/users/$REMUSER
    echo 'SystemAccount=true' >> /var/lib/AccountsService/users/$REMUSER
}

ISROOT

echo -e "Informe o nome do usuário que deseja ocultar do GDM (Gnome Display Manager)"
read REMUSER

HIDEUSER