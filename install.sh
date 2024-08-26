#!/bin/bash

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

if [ ! -f bascp.sh ]; then
     echo -e "\033[0;31m\nError: bascp.sh not found\033[0m\n"
     exit 1
fi

if [ ! -d $HOME/.local/bin ]; then
     mkdir -p $HOME/.local/bin
     export PATH=$PATH:$HOME/.local/bin
fi

cp ./bascp.sh $HOME/.local/bin/bascp
chmod +x $HOME/.local/bin/bascp

echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
