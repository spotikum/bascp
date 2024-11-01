#!/bin/bash

if [ -f /etc/os-release ]; then
     . /etc/os-release
     OS=$ID_LIKE
else
     echo "Cannot determine the operating system."
     exit 1
fi

echo "Detected OS: $OS"

pkginstall() {
     if [ "$OS" == "debian" ]; then
          sudo apt update
          sudo apt install -y $1
     elif [ "$OS" == "rhel fedora" ]; then
          sudo yum install -y $1
     elif [ "$OS" == "arch" ]; then
          sudo pacman -S $1 --noconfirm
     else
          echo "Unsupported OS"
          exit 1
     fi
}

bascpInstall() {
     if [ ! command -v ssh &> /dev/null ]; then
          echo "Installing ssh..."
          pkginstall openssh
     fi

     if [ ! command -v sshpass &> /dev/null ]; then
          echo "Installing sshpass..."
          pkginstall sshpass
     fi

     if [ ! command -v rsync &> /dev/null ]; then
          echo "Installing rsync..."
          pkginstall rsync
     fi

     if [ ! command -v wget &> /dev/null ]; then
          echo "Installing wget..."
          pkginstall wget
     fi

     if [ ! -d $HOME/.local/bin ]; then
          mkdir -p $HOME/.local/bin
          export PATH=$PATH:$HOME/.local/bin
     fi

     wget -O $HOME/.local/bin/bascp https://raw.githubusercontent.com/spotikum/bascp/master/bascp.sh
     chmod +x $HOME/.local/bin/bascp

     echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
}
