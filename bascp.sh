#!/bin/bash

current_dir=$(pwd)

if [ -z $1  ]; then
    echo -e "\033[0;31m\nPlease provide the backup directory at the first argument\033[0m\n"
    exit 1
fi

cd $1

if [ ! -f .env ]; then
    echo -e "\033[0;31m\nPlease create .env file\033[0m\n"
    echo "See https://github.com/spotikum/bascp/blob/master/.env.example"
    cd $current_dir
    exit 1
fi

source .env
rsync -avz -e "sshpass -p $password ssh -p $port" $username@$remote:$workspace .

if [ ! $? -eq 0 ]; then
    echo -e "\033[0;31m\nBackup failed\033[0m\n"
    cd $current_dir
    exit 1
fi

echo -e "\033[0;32m\nDone backup from host:$remote at remote:$workspace to local:$1\033[0m\n"
cd $current_dir
