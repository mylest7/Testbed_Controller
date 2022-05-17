#1/bin/bash

# This script is meant to ssh each into a specified range of nodes and switch the access point that it is connected to. 
# The range and other variables are input by the user. 
sudo sed -i "4,9d" /etc/wpa_supplicant/wpa_supplicant.conf
sudo sed -i "4s/.*//" /etc/dhcpcd.conf
sudo sed -i "5s/.*//" /etc/dhcpcd.conf
sudo sed -i "6s/.*//" /etc/dhcpcd.conf
wpa_passphrase $1 $2 | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf > /dev/null 
sudo systemctl disable hostapd dnsmasq
sudo reboot
