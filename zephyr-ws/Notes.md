Ofc, Install dependencies first:
```shell
sudo apt install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget python3-dev python3-venv python3-tk \
  xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1
```

---
Minimal requirements:
- Cmake: 3.20.5
- Python 3.12 (my ubuntu 20.04 dont have(default is 3.10 on ubuntu2004), so im using pyenv for install that version instead)
- Devicetree compiler: 1.4.6

---
No1 asked: but, if u want to deal with that python version compatible above:
TLDR:
```shell
sudo apt install -y \
    build-essential \
    make \
    gcc \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    git \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev


curl https://pyenv.run | bash
```
after that, add this path into .bashrc if u using interactive shells
```shell
nano ~/.bashrc
#u add this into bashrc
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
eval "$(pyenv virtualenv-init -)"
```
and, of course, reload shell
```shell
exec $SHELL
pyenv install 3.12
```
init environment for zephyr. West is a tool management of zephyr for control everything :)
```shell
cd zephyr-ws
python -m venv .venv
pip install west
west init .
west update
west zephyr-export
west packages pip --install
```
Now install zephyr sdk
```shell
cd zephyr
west sdk install

```
