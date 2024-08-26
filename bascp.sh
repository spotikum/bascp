#!/bin/bash

current_dir=$(pwd)

if [ -z $1  ]; then
    echo -e "\033[0;31m\nPlease provide the backup directory at the first argument\033[0m\n"
    exit 1
fi

for arg in "$@"; do
    if [ -z "$arg" ]; then
        break
    fi

    cd $arg

    if [ ! -f .env ]; then
        echo -e "\033[0;31m\nPlease create .env file\033[0m\n"
        echo "See https://github.com/spotikum/bascp/blob/master/.env.example"
        cd $current_dir
        exit 1
    fi

    source .env
    echo -e "\n[$(date)]" >> backup.log
    rsync -avz -e "sshpass -p $password ssh -p $port" $username@$remote:$workspace . >> backup.log

    if [ ! $? -eq 0 ]; then
        echo -e "\033[0;31m\nBackup failed\033[0m\n"
        cd $current_dir
        exit 1
    fi

    echo -e "\033[0;32mDone backup from host:\033[0m$remote\033[0;32m at remote:\033[0m$workspace\033[0;32m to local:\033[0m$arg\033[0m"
    cd $current_dir
done
