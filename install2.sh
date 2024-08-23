#!/bin/bash
bascpInstall() {
     if [ ! command -v ssh &> /dev/null ]; then
          sudo apt update
          echo "Installing ssh..."
          sudo apt install ssh -y
     fi

     if [ ! command -v sshpass &> /dev/null ]; then
          sudo apt update
          echo "Installing sshpass..."
          sudo apt install sshpass -y
     fi

     if [ ! command -v rsync &> /dev/null ]; then
          sudo apt update
          echo "Installing rsync..."
          sudo apt install rsync -y
     fi

     if [ ! -d $HOME/.local/bin ]; then
          mkdir -p $HOME/.local/bin
          export PATH=$PATH:$HOME/.local/bin
     fi

     wget -c https://raw.githubusercontent.com/spotikum/bascp/master/bascp.sh -o $HOME/.local/bin/bascp
     chmod +x $HOME/.local/bin/bascp

     echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
}
