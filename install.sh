#!/bin/bash

if [ -f /etc/os-release ]; then
     . /etc/os-release
     OS=$ID_LIKE
     echo "Detected OS: $OS"
else
     echo "Cannot determine the operating system."
     exit 1
fi


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

     if [ $? -ne 0 ]; then
          echo "Failed to install $1"
          exit 1
     fi
}

packages=("ssh" "sshpass" "rsync" "wget")
install_packages() {
     for package in "${packages[@]}"; do
          if ! command -v $package &> /dev/null; then
               echo "Installing $package..."
               pkginstall $package
          fi
     done
}

bascpInstall() {
     install_packages

     if [ ! -d $HOME/.local/bin ]; then
          mkdir -p $HOME/.local/bin
          export PATH=$PATH:$HOME/.local/bin
     fi

     wget -O $HOME/.local/bin/bascp https://raw.githubusercontent.com/spotikum/bascp/master/bascp.sh
     chmod +x $HOME/.local/bin/bascp

     echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
}
