#!/bin/bash

clear

echo -e " - Instalador USB Ventoy 1.0 - \n"

echo -e "\nDispositivos de armazenamento atualmente conectados:\n"
lsblk -e7

echo -e "\n\nInforme o nome do disco que deseja instalar o Ventoy:"
read DRIVE

eject /dev/$DRIVE > /dev/null 2>&1

sudo ./Ventoy2Disk.sh -i -g /dev/$DRIVE