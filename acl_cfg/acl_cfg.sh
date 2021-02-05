#!/bin/bash

# Verificar se o acl está ativado na partição montada
#tune2fs -l /dev/sdXY | grep "Default mount options:"

print_titulo() {

#Apenas imprime o título e sub
if [ $1 == 0 ]; then

	clear
	echo -e "  -- $titulo1  -- \n\n"
	echo -e "$titulo2\n"
	
#Aplica no titulo o conteúdo do argumento 2
elif [ $1 == 1 ]; then

	titulo1=$2

#Aplica no sub-titulo o conteúdo do argumento 2
elif [ $1 == 2 ]; then

	titulo2=$2

fi

}

main_menu() {

	# Variavel de encerramento do script
	resposta=1

	while [ $resposta != 0 ]
	do
		print_titulo 1 "Gerenciador de ACLs"
		print_titulo 2 "O que deve ser feito?"
		print_titulo 0
		echo -e " [1 = Listar permissões] \n [2 = Adicionar permissão] \n [3 = Remover permissão] \n [0 = Sair]"
		read resposta

		case "$resposta" in
		1)
			list_ps
		;;
		2)
			add_ps
		;;
		3)
			del_ps
		;;
		0)
		;;
		*)
			print_titulo 2 "Opção inválida!"
			print_titulo 0
			echo "Presione ENTER para continuar..."
			read
		;;
		esac
	done

	clear

}

list_ps() {

	print_titulo 2 "Listar permissões de um diretório"
	print_titulo 0
	echo "Informe o caminho completo do diretório:"
	read pasta

	print_titulo 0
	getfacl $workdir/"$pasta"/
	echo "Listagem concluída, pressione ENTER para continuar..."
	read

}

add_ps() {

	saida=1
	print_titulo 2 "Adicionar permissão a um diretório"
	print_titulo 0
	echo "Informe o caminho completo do diretório:"
	read pasta

	print_titulo 0
	echo "Informe o nome de usuário:";
	read usuario;

	while [ $saida != 0 ]
	do

		print_titulo 2 "Adicionar permissão a um diretório"
		print_titulo 0
		echo -e "Escolha o nível de acesso:\n[1 = Leitura] \n[2 = Leitura/Gravação]"
		read nivel

		case "$nivel" in
		1)
			saida=0
			saida2=1
			while [ $saida2 != 0 ]
			do
				print_titulo 2 "Confirmação dos dados a serem aplicados:"
				print_titulo 0
				echo "Diretório selecionado: $pasta"
				echo "Nome de usuário: $usuario"
				echo "Nivel de acesso: Leitura"
				echo -e "\nConfirma a adição da permissão? \n[1 = Sim]\n[0 = Não|Cancelar]"
				read confirma

				if [ $confirma == 0 ]; then
					saida2=0
					print_titulo 2 "Operação cancelada!"
					print_titulo 0
					echo "Presione ENTER para continuar..."
					read
				elif [ $confirma == 1 ]; then
					saida2=0
					print_titulo 2 " "
					print_titulo 0
					#Alteração de permissão
					setfacl -m u:$usuario:r-x $workdir/"$pasta"/
					echo -e "\nTarefa concluída com sucesso! \n\nPresione ENTER para continuar..."
					read
				else
					print_titulo 2 "Opção inválida!"
					print_titulo 0
					echo "Presione ENTER para continuar..."
					read
				fi
			done
		;;
		2)
			saida=0
			saida2=1
			while [ $saida2 != 0 ]
			do
				print_titulo 2 "Confirmação dos dados a serem aplicados:"
				print_titulo 0
				echo "Diretório selecionado: $pasta"
				echo "Nome de usuário: $usuario"
				echo "Nivel de acesso: Leitura/Gravação"
				echo -e "\nConfirma a adição da permissão? \n[1 = Sim]\n[0 = Não|Cancelar]"
				read confirma

				if [ $confirma == 0 ]; then
					saida2=0
					print_titulo 2 "Operação cancelada!"
					print_titulo 0
					echo "Presione ENTER para continuar..."
					read
				elif [ $confirma == 1 ]; then
					saida2=0
					print_titulo 2 " "
					print_titulo 0
					#Alteração de permissão
					setfacl -m u:$usuario:rwx $workdir/"$pasta"/
					echo -e "\nTarefa concluída com sucesso! \n\nPresione ENTER para continuar..."
					read
				else
					print_titulo 2 "Opção inválida!"
					print_titulo 0
					echo "Presione ENTER para continuar..."
					read
				fi
			done
		;;
		*)
			print_titulo 2 "Opção inválida!"
			print_titulo 0
			echo "Presione ENTER para continuar..."
			read
		;;
		esac
	done

}

del_ps() {

	saida=1
	print_titulo 2 "Remover permissão de um diretório"
	print_titulo 0
	echo "Informe o caminho completo do diretório:"
	read pasta

	print_titulo 0
	echo "Informe o nome de usuário:";
	read usuario;

	saida2=1
	while [ $saida2 != 0 ]
	do
		print_titulo 2 "Confirmação dos dados a serem aplicados:"
		print_titulo 0
		echo "Diretório selecionado: $pasta"
		echo "Nome de usuário: $usuario"
		echo -e "\nConfirma a remoção da permissão? \n[1 = Sim]\n[0 = Não|Cancelar]"
		read confirma

		if [ $confirma == 0 ]; then
			saida2=0
			print_titulo 2 "Operação cancelada!"
			print_titulo 0
			echo "Presione ENTER para continuar..."
			read
		elif [ $confirma == 1 ]; then
			saida2=0
			print_titulo 2 " "
			print_titulo 0
			#Alteração de permissão
			setfacl -x u:$usuario $workdir/"$pasta"/
			echo -e "\nTarefa concluída com sucesso! \n\nPresione ENTER para continuar..."
			read
		else
			print_titulo 2 "Opção inválida!"
			print_titulo 0
			echo "Presione ENTER para continuar..."
			read
		fi
	done


}

main_menu