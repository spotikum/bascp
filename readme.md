

### Install
```shell
source /dev/stdin <<< "$(wget -qO- https://raw.githubusercontent.com/spotikum/bascp/refs/heads/master/install.sh)"; bascpInstall
```

### Usage
create a new directory

```shell
mkdir <directory_name>
cd <directory_name>
```
create `.env` file
```shell
port="22"
remote="xxx.xxx.xxx.xxx"
username="username"
password="password"
workspace="directory"
```

run bascp
```shell
bascp .
```

or backup multiple directory
```shell
bascp <directory1> <directory2>
```

### Another Option
- add in `~/.bashrc` to run every login
- use [cronjob](https://crontab.guru/) to run periodically