# Debian 12 (Bookworm) Gnome Setup

**Version**: [Bookworm 64-bits](https://debian.osuosl.org/debian-cdimage/12.0.0/amd64/iso-dvd/debian-12.0.0-amd64-DVD-1.iso)
**Notebooks**:

* [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)
* [Samsung Galaxy Book Pro 15.6"](https://www.samsung.com/br/computers/samsung-book/galaxy-book-pro-15inch-i7-16gb-1tb-np950xdb-ku1br/)

## System setup

### Update `/etc/bluetooth/main.conf`

```shell
sudo sed -i "s/#Experimental = false/Experimental = true/" /etc/bluetooth/main.conf
sudo systemctl restart bluetooth
```

### Update `/etc/apt/sources.list`

```shell
sudo su -c "echo '# base' > /etc/apt/sources.list"
sudo su -c "echo 'deb http://deb.debian.org/debian bookworm main non-free-firmware' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://deb.debian.org/debian bookworm main non-free-firmware' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# security' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# updates' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://deb.debian.org/debian bookworm-updates main non-free-firmware' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://deb.debian.org/debian bookworm-updates main non-free-firmware' >> /etc/apt/sources.list"
```

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

### Base packages

```shell
sudo apt install build-essential cmake dialog gcc libbz2-dev libedit-dev libffi-dev libfmt9 libgtksourceview-3.0-1 libgtksourceview-3.0-common libgtksourceviewmm-3.0-0v5 libreadline-dev libspdlog1.10 libsqlite3-dev libssl-dev libxml++2.6-2v5 linux-headers-`uname -r` make python3-dev python3-tk tk-dev zlib1g zlib1g-dev -y
```

### Packages for repositories management

```shell
sudo apt install curl apt-transport-https gnupg-agent -y
```

### Add extra repositories

#### Fsearch

```
# https://software.opensuse.org//download.html?project=home%3Acboxdoerfer&package=fsearch#manualDebian
echo 'deb http://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:cboxdoerfer.list
curl -fsSL https://download.opensuse.org/repositories/home:cboxdoerfer/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cboxdoerfer.gpg > /dev/null
sudo apt update
```

#### La-capitaine cursor

```shell
# Download "capitaine-cursors-r3.tar.gz" it from https://www.pling.com/p/1148692
mkdir capitaine-cursors && tar -zxf capitaine-cursors-r3.tar.gz -C capitaine-cursors
sudo mv capitaine-cursors /usr/share/icons/
```

#### Celluloid

```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6CAE7FA0B44EEF4EBD4E955F77D026E2EEAD66BD
sudo apt-key export EEAD66BD | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/celluloid.gpg
sudo su -c "echo 'deb https://ppa.launchpadcontent.net/xuzhen666/gnome-mpv/ubuntu lunar main' > /etc/apt/sources.list.d/celluloid.list" 
```

#### Flatpak: Flathub

```shell
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## User setup

### Configuration

```shell
sudo apt install synaptic printer-driver-all system-config-printer dconf-editor gnome-tweaks -y
```

```shell
flatpak --user install flathub com.github.tchx84.Flatseal -y
```

### Styling

```shell
sudo apt install chrome-gnome-shell papirus-icon-theme -y
```

### Windows compatibility layer

```shell
sudo apt install wine -y
```

### Communication

```shell
flatpak --user install flathub \
    org.telegram.desktop \
    io.github.mimbrero.WhatsAppDesktop -y
```

### Productivity

```shell
sudo apt install mlocate zeitgeist autojump gnome-sushi gnome-calendar gnome-contacts gnome-clocks fsearch -y
```

### Reading & Writing

```shell
sudo apt install libreoffice libreoffice-l10n-pt-br libreoffice-style-sifr qpdfview -y
```

```shell
flatpak --user install flathub \
    com.calibre_ebook.calibre \
    org.gnome.gitlab.somas.Apostrophe \
    md.obsidian.Obsidian -y
```

#### `autojump`

```shell
printf '\n# AUTOJUMP\n' >> ~/.bashrc
echo '[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh' >> ~/.bashrc
```

### Dictionary

```shell
sudo apt install dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-gcide dict-wn goldendict hunspell hunspell-pt-br hunspell-en-us -y
```

### Multimedia

```shell
sudo apt install soundconverter ffmpeg mencoder easyeffects pavucontrol playerctl cheese shotwell puddletag vlc mda-lv2 celluloid nautilus-image-converter -y
```

```shell
flatpak --user install flathub \
    org.gimp.GIMP \
    org.gnome.Loupe \
    org.gnome.gitlab.YaLTeR.VideoTrimmer \
    io.gitlab.adhami3310.Footage \
    org.audacityteam.Audacity \
    org.gnome.Lollypop \
    org.gnome.Podcasts \
    com.github.flxzt.rnote -y
```

### Development

```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-17-jdk openjdk-17-jdk-headless openssh-server zeal dia bash-completion -y
```

```shell
flatpak --user install flathub \
    com.getpostman.Postman \
    com.raggesilver.BlackBox -y
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

printf "\n# NVM" >> ~/.bashrc 
printf 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc 
printf '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc 
printf '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.bashrc 
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
sudo apt install rsync tmate aria2 openconnect network-manager-openconnect network-manager-ssh -y
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
curl -L -O https://launchpad.net/ubuntu/+archive/primary/+files/scrcpy-server_1.25-1_all.deb
curl -L -O https://launchpad.net/ubuntu/+archive/primary/+files/scrcpy_1.25-1_amd64.deb
sudo apt install adb -y
sudo dpkg -i scrcpy-server_1.25-1_all.deb -y
sudo dpkg -i scrcpy_1.25-1_amd64.deb -y
```

#### `rclone`:  A CLI to manage files on cloud storage

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
```
