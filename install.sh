#!/bin/bash

exec > >(tee "simplefruitywifi-installer.log")
exec 2>&1

echo "#----------------------------------#";
echo "|       FruityWifi Installer       |";
echo "|        Made with Love by         |";
echo "|           FinlayDaG33k           |";
echo "#----------------------------------#";

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

command -v hueheuehu >/dev/null 2>&1 || {
        echo >&2 "I require unzip but it's not installed.";
        while true; do
                read -p "Do you wish to install this program? :) " yn
                case $yn in
                        [Yy]* ) sudo apt-get install unzip; break;;
                        [Nn]* ) echo "Aborting.";echo "Have a nice day! :)";exit;;
                        * ) echo "Please answer yes or no.";;
                esac
        done
}

echo "I will now download the latest FruityWifi Release for you";
echo "#-------------------------------------------------------#";
wget https://github.com/xtr4nge/FruityWifi/archive/master.zip

echo "Download complete, let's unzip it! (Ladies?)";
echo "#-------------------------------------------------------#";
unzip master.zip

echo "Now let's install it!"
echo "#-------------------------------------------------------#";
sudo FruityWifi-master/install-FruityWiFi.sh

echo "Everything should be okay now!";
echo "Headover to https://localhost:8443 and see the awesomeness!";
echo "Thanks for using this little script by the way!";
echo "Bye!"
exit;
