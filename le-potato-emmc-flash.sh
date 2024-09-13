#!/bin/bash
# Script for flashing the eMMC module on the Le Potato board using pyamlboot

# Install required dependencies
sudo apt update
sudo apt install -y python3-usb

# Clone pyamlboot repository
git clone --single-branch https://github.com/libre-computer-project/pyamlboot.git -b scripts

# Prompt user to press and hold Uboot button before continuing
echo "Please press and hold the K11/Uboot button on the Le Potato and then press enter..."
read -p "Press Enter to continue..."

# Erase eMMC user partition and bootloader (optional step)
read -p "Would you like to erase the eMMC partition and bootloader? (y/n): " erase_choice
if [ "$erase_choice" == "y" ]; then
  sudo pyamlboot/run.sh aml-s905x-cc erase-emmc
fi

# Turn eMMC into a virtual flash drive
sudo pyamlboot/run.sh aml-s905x-cc ums-emmc

# Flash process instructions
echo "eMMC is now in flash drive mode. You can use gnome-disk-imager or dd to flash your OS image."
