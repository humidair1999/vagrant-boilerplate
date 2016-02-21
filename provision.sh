#!/bin/bash

echo "----------------------------------------------------------"
echo "update existing apt-get packages"
echo "----------------------------------------------------------"

# sudo apt-get update

echo "----------------------------------------------------------"
echo "installing webdev apt-get packages"
echo "----------------------------------------------------------"

function install_package_if_needed() {
	# http://askubuntu.com/a/140574
	dpkg -s "$1" >/dev/null 2>&1 && {
        echo "$1 is already installed."
    } || {
        echo "$1 is not installed. installing now"

        sudo apt-get install -y $1
    }
}

install_package_if_needed curl

echo "----------------------------------------------------------"
echo "installing nvm"
echo "----------------------------------------------------------"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

# source and reload nvm
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "----------------------------------------------------------"
echo "printing system specs"
echo "----------------------------------------------------------"

cat /proc/cpuinfo
cat /proc/meminfo