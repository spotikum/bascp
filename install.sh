if [ ! -f bascp ]; then
     echo -e "\033[0;31m\nError: bascp not found\033[0m\n"
     exit 1
fi

chmod +x bascp
cp ./bascp $HOME/.local/bin/

echo -e "\033[0;32m\nbascp installed successfully\033[0m\n"
