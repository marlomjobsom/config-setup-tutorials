# KDE Neon 22.04 LTS Setup

**Version**: [Jammy Jellyfish 64-bits](https://files.kde.org/neon/images/user/20230518-0715/neon-user-20230518-0715.iso)
**Notebooks**:

* [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)
* [Samsung Galaxy Book Pro 15.6"](https://www.samsung.com/br/computers/samsung-book/galaxy-book-pro-15inch-i7-16gb-1tb-np950xdb-ku1br/)

## System setup

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

### Packages for compilation

```shell
sudo apt install build-essential cmake dialog extra-cmake-modules g++ gcc gettext kwin-dev libbz2-dev libffi-dev libkdecorations2-dev libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5globalaccel-dev libkf5guiaddons-dev libkf5iconthemes-dev libkf5notifications-dev libkf5windowsystem-dev libqt5x11extras5-dev libreadline-dev libsqlite3-dev libssl-dev make python2-dev python3-dev qt3d5-dev qtdeclarative5-dev qttools5-dev libappindicator3-1 -y
```

### Packages for repositories management

```shell
sudo apt install curl apt-transport-https gnupg-agent -y
```

### Add extra repositories

#### CherryTree

```shell
sudo add-apt-repository ppa:giuspen/ppa
```

#### FSearch

```shell
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable
```

#### Flatpak: Flathub

```shell
sudo apt install flatpak plasma-discover-backend-flatpak -y
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## User setup

### Configuration

```shell
sudo apt install synaptic filelight sweeper -y
```

### Styling

```shell
sudo apt install papirus-icon-theme -y
```

#### Lightly

```shell
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
make
sudo make install
```

#### LightlyShaders

```shell
git clone https://github.com/a-parhom/LightlyShaders
cd LightlyShaders;
mkdir qt5build; cd qt5build; cmake ../ -DCMAKE_INSTALL_PREFIX=/usr && make && sudo make install
```

#### KDE-Rounded-Corners

```shell
git clone https://github.com/matinlotfali/KDE-Rounded-Corners
cd KDE-Rounded-Corners
mkdir build
cd build
cmake ..
make
sudo make install
```

### Windows compatibility layer

```shell
sudo apt install wine playonlinux -y
```

### Communication

```shell
sudo apt install kmail kontact -y
```

```shell
flatpak --user install flathub \
    org.telegram.desktop \
    io.github.mimbrero.WhatsAppDesktop -y
```

### Productivity

```shell
sudo apt install fsearch mlocate zeitgeist autojump kalendar kclock -y
```

### Reading & Writing

```shell
sudo apt install libreoffice libreoffice-l10n-pt-br cherrytree ghostwriter -y
```

```shell
flatpak --user install flathub \
    com.calibre_ebook.calibre -y
```

#### `autojump`

```shell
printf '\n# AUTOJUMP\n' >> ~/.bashrc
echo '[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh' >> ~/.bashrc
```

### Dictionary

```shell
sudo apt install dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-gcide dict-wn goldendict hunspell hunspell-pt-br hunspell-en-us kamoso -y
```

### Multimedia

```shell
sudo apt install soundconverter ffmpeg mencoder ubuntu-restricted-addons ubuntu-restricted-extras koko puddletag vlc mda-lv2 elisa kid3 -y
```

```shell
flatpak --user install flathub \
    org.gimp.GIMP \
    org.kde.kasts \
    com.ozmartians.VidCutter \
    com.github.flxzt.rnote -y
```

### Development

```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-11-jdk openjdk-11-jdk-headless openjdk-8-jdk openjdk-8-jdk-headless openssh-server kompare zeal virtualbox dia -y
```

```shell
flatpak --user install flathub com.getpostman.Postman -y
```

#### `pyenv`

```shell
curl https://pyenv.run | bash
printf '\n# PYENV\n' >> ~/.bashrc
echo 'export PATH=$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo 'export PYTHON_CONFIGURE_OPTS="--enable-shared"' >> ~/.bashrc
source ~/.bashrc
pyenv install 2.7.18
pyenv install 3.10.4
pyenv global 3.10.4
```

#### `poetry`

```shell
pip install poetry
poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion
```

#### `NVM`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/node /usr/bin/node
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/npm /usr/bin/npm
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/electron /usr/bin/electron
```

#### `jEnv`

```shell
git clone https://github.com/jenv/jenv.git ~/.jenv
printf '\n# JENV\n' >> ~/.bashrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
source ~/.bashrc
jenv enable-plugin export
exec $SHELL -l
```

#### Docker

```shell
sudo apt install docker docker-compose -y
sudo gpasswd -a $USER docker
```

### Network

```shell
sudo apt install rsync tmate aria2 openconnect network-manager-openconnect network-manager-ssh ktorrent -y
```

#### Wireshark

```shell
# Accept to let non-superusers to be able to capture packets
# If missed the prompot run $ sudo dpkg-reconfigure wireshark-common
sudo apt install wireshark -y

# It requires logout
sudo usermod -a -G wireshark $USER

# TIP: Runs it within its group to use wireshark without logout
# newgrp wireshark
```

### Utilities

#### `scrcpy`: An android device desktop control

```shell
sudo apt install scrcpy -y
```

#### `rclone`:  A CLI to manage files on cloud storage

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
rm rclone-current-linux-amd64.deb
```
