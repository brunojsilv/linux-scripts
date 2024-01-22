#!/bin/bash
cls
echo -e "SCRIPT DE PREPARAÇÃO DO SISTEMA\n"

echo "Informe o nome de usuário da maquina: "
read USUARIO

# Atualização inicial dos pacotes
sudo apt update
sudo apt upgrade -y

# Instala os pacotes principais de utilizador
sudo apt install i3 i3blocks xorg lightdm udiskie wget plymouth-themes ntp -y

# Instala o pacote oficial do Google Chrome para Debian
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -f install ./google-chrome-stable_current_amd64.deb

# Configura o auto-login do sistema
sudo sh -c "echo '[SeatDefaults]\nautologin-user=$USUARIO\nautologin-user-timeout=0' >> /etc/lightdm/lightdm.conf"

# Configuração o i3wm

# Adiciona linhas de ocultação na sessão de configuração da barra inferior
sed -i '/status_command/a        mode hide\n        hidden_state hide\n        modifier $mod' .config/i3/config

# Substitui a utilização da barra i3status pela i3blocks
sed -i 's/status_command i3status/status_command i3blocks/' .config/i3/config

# Adiciona ocultação da barra de titulo e inicialização automática de aplicativo
echo -e "\n#Hide window title bar" >> .config/i3/config
echo "default_border pixel 1" >> .config/i3/config
echo "default_floating_border pixel 1" >> .config/i3/config
echo "for_window [class="^.*"] border pixel 1" >> .config/i3/config
echo -e "\n#Auto start Google Chrome" >> .config/i3/config
echo "exec --no-startup-id google-chrome" >> .config/i3/config
echo -e "\n#Auto start diskmounter" >> .config/i3/config
echo "exec --no-startup-id udiskie" >> .config/i3/config

# Configuração de boot

# Atualiza a tela de boot
sudo plymouth-set-default-theme -R text

# Substitui o tempo de espera do grub menu para zero
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub

# Oculta o texto na inicialização
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub

# Remove o background do grub menu
sudo rm /usr/share/images/desktop-base/desktop-grub.png

# Aplica a nova configuração ao grub
sudo update-grub
