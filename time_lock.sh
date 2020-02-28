#!/bin/bash
# Script de configuração do sistema
# Configuração geral para tempo do bloqueio de tela

# Variaveis
#valor de time é o tempo para o bloqueio da tela em segundos 
time=600
dconf_db_usr=user
dconf_db_sys=local

# Cria uma pasta para armazenamento de novos perfis de administração
mkdir -p /etc/dconf/profile

# Grava um arquivo de perfil usuário do tipo system
echo -e "user-db:$dconf_db_usr\nsystem-db:$dconf_db_sys" > /etc/dconf/profile/user

# Cria pastas para armazenamento de novos perfis de administração
mkdir -p /etc/dconf/db/$dconf_db_sys.d
mkdir -p /etc/dconf/db/$dconf_db_usr.d

# Cria pasta para armazenamento de arquivos de trava do dconf
mkdir -p /etc/dconf/db/$dconf_db_sys.d/locks

# Remove o arquivo anterior de trava da chave do usuário com a configuração
rm /etc/dconf/db/$dconf_db_sys.d/locks/time_lock

# Grava um arquivo de chave do usuário dconf
echo -e "[org/gnome/desktop/session]\nidle-delay $time" > /etc/dconf/db/$dconf_db_sys.d/time_lock.key

# Atualiza o dconf aplicando essa configuração no banco de dados
dconf update

# Grava o arquivo de trava da chave do usuário com a configuração
echo -e "/org/gnome/desktop/session/idle-delay" > /etc/dconf/db/$dconf_db_sys.d/locks/time_lock

# Atualiza o dconf aplicando essa configuração no banco de dados
dconf update