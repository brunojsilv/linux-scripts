#!/bin/bash

resposta=1

ISROOT(){
	USUARIO=`whoami`
	if [ "$USUARIO" != "root" ]; then
		echo -e "\nESTE PROGRAMA PRECISA SER EXECUTADO COM PERMISSOES DE SUPERUSUARIO!" 
		echo -e "Abortando...\n" 
		exit 1
	fi
}

INSTALL(){
	clear
	apt-get update
	apt-get install -y lm-sensors
    #sensors-detect
	echo -e "\nInstalaçao concluida!\n\nPresione ENTER para continuar...";
	read
}

UNINSTALL(){
	clear
	apt-get purge -y lm-sensors
	echo -e "\nDesinstalaçao concluida!\n\nPresione ENTER para continuar...";
	read
}


TEST(){
    saida=1
    while [ $saida != 0 ]
    do
        clear
        sensors
        echo -e "\nPara encerrar pressione Ctrl+C..."
        sleep 1
    done
}

ISROOT

while [ $resposta != 0 ]
do
	clear
	echo -e " - Sensor de temperatura CLI Linux -\n\n"
	echo -e "O que deve ser feito?\n[1 = INSTALAR]\n[2 = DESINSTALAR]\n[3 = MONITORAR TEMPERATURA]\n[0 = SAIR]"
	read resposta

	case "$resposta" in
	1)
		INSTALL
	;;
	2)
		UNINSTALL
	;;
	3)
		TEST
	;;
	0)
	;;
	*)
		INVALID
	;;
	esac
done
clear