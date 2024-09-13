Libre Computer AML-S905X-CC eMMC Flashing Guide

This repository contains instructions and a shell script to flash the eMMC module on the Libre Computer AML-S905X-CC (Le Potato) using a Linux machine and pyamlboot. The process eliminates the need for a MicroSD card by allowing you to use the eMMC module as a virtual flash drive.

Requirements
Libre Computer AML-S905X-CC (Le Potato)
eMMC 5.x module attached
USB Type A to USB Type A cable
Any Linux computer (Intel preferred)
pyamlboot (included in this repo)
Optional: Auxiliary power via MicroUSB

sudo apt install -y python3-usb
git clone --single-branch https://github.com/libre-computer-project/pyamlboot.git -b scripts

sudo pyamlboot/run.sh aml-s905x-cc erase-emmc

sudo pyamlboot/run.sh aml-s905x-cc ums-emmc


sudo dd if=path-to-your-image.img of=/dev/sdX bs=4M status=progress && sync
Replace /dev/sdX with the correct device identifier for the eMMC drive.

Troubleshooting
AMD Machines: There is a known issue with AMD computers timing out on USB transfers. It is recommended to use Intel-based machines or SBCs for this process.
Auxiliary Power: If your computer doesn't supply enough power, attach a MicroUSB cable to power the Le Potato board.
License

This repository is licensed under the MIT License.
