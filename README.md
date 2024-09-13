Libre Computer AML-S905X-CC eMMC Flashing Guide
This repository contains instructions and a shell script to flash the eMMC module on the Libre Computer AML-S905X-CC (Le Potato) using a Linux machine and pyamlboot. The process eliminates the need for a MicroSD card by allowing you to use the eMMC module as a virtual flash drive.

Requirements
Libre Computer AML-S905X-CC (Le Potato)
eMMC 5.x module attached
USB Type A to USB Type A cable
Any Linux computer (Intel preferred)
pyamlboot (included in this repo)
Optional: Auxiliary power via MicroUSB
Steps to Flash the eMMC
Clone this repository:

bash
Copy code
git clone https://github.com/yourusername/le-potato-emmc-flash.git
cd le-potato-emmc-flash
Install dependencies: Make sure you have Python USB installed on your Linux machine:

bash
Copy code
sudo apt install -y python3-usb
Prepare the Board:

Detach all peripherals from the Le Potato, except for the USB cable and power (if needed).
Press and hold the K11/Uboot button on the board.
Plug the USB cable into the USB port next to the Ethernet on the board and release the button.
Run the Flash Script:

bash
Copy code
./le-potato-emmc-flash.sh
Follow the on-screen instructions. You will have the option to either:
Erase the eMMC partition and bootloader (optional).
Turn the eMMC into a virtual flash drive for flashing.
Flash the OS Image: Once the eMMC appears as a virtual flash drive, use a tool like dd or gnome-disk-imager to flash your desired OS image to the eMMC:

bash
Copy code
sudo dd if=path-to-your-image.img of=/dev/sdX bs=4M status=progress && sync
Replace /dev/sdX with the correct device identifier for the eMMC drive.

Troubleshooting
AMD Machines: There is a known issue with AMD computers timing out on USB transfers. It is recommended to use Intel-based machines or SBCs for this process.
Auxiliary Power: If your computer doesn't supply enough power, attach a MicroUSB cable to power the Le Potato board.
License
This repository is licensed under the MIT License.
