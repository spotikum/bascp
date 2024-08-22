#!/bin/bash

if [ ! -f bascp ]; then
     echo -e "\033[0;31m\nError: bascp not found\033[0m\n"
     exit 1
fi

if [ ! -d $HOME/.local/bin ]; then
     mkdir -p $HOME/.local/bin
fi

chmod +x bascp
cp ./bascp $HOME/.local/bin/

if [ ":$PATH:" != *":$HOME/.local/bin:"* ]; then
     echo 'export PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc
     source $HOME/.bashrc
fi

echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
