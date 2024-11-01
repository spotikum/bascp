

### Install
```shell
source /dev/stdin <<< "$(wget -qO- https://raw.githubusercontent.com/spotikum/bascp/refs/heads/master/install.sh)"; bascpInstall
```

### Usage
create a new directory

```shell
mkdir <directory_mame>
cd <directory_mame>
```
create .env file
```shell
# server
port="22"
remote="xxx.xxx.xxx.xxx"
username="username"
password="password"
workspace="$HOME/workspace"
```

run bascp
```shell
bascp $HOME/<directory_mame>
```

or backup multiple directory
```shell
bascp $HOME/<directory_mame1> $HOME/<directory_mame2>
```

### Another Option
- add source in `~/.bashrc`
- using cronjob