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

	sed -i "s|^XSession=.*|XSession=gnome|g" /var/lib/AccountsService/users/$REMUSER
	sed -i "s|^SystemAccount=.*|SystemAccount=true|g" /var/lib/AccountsService/users/$REMUSER

}

clear

ISROOT

echo -e "  -- Ocultar usuário da tela de login Gnome  -- \n\n";

echo "Informe o nome do usuário que deseja ocultar do GDM (Gnome Display Manager)"
read REMUSER

HIDEUSER