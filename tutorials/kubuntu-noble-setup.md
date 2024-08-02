# Kubuntu 24.04 LTS (noble) 64-bits Setup

**Version**: [Kubuntu 24.04 LTS (noble) 64-bits](https://cdimage.ubuntu.com/kubuntu/releases/24.04/release/kubuntu-24.04-desktop-amd64.iso)
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
sudo apt install bash-completion build-essential cmake dialog extra-cmake-modules g++ gcc gettext git kinit-dev kwin-dev libappindicator3-1 libappindicator3-dev libasound2-dev libavutil-dev libbz2-dev libffi-dev libgtk-3-dev libkdecorations2-dev libkf5*-dev libkf5config-dev libkf5configwidgets-dev libkf5coreaddons-dev libkf5crash-dev libkf5globalaccel-dev libkf5guiaddons-dev libkf5iconthemes-dev libkf5kio-dev libkf5notifications-dev libkf5windowsystem-dev liblzma-dev libplist-dev libqt5x11extras5-dev libreadline-dev libspeex-dev libsqlite3-dev libssl-dev libswscale-dev libturbojpeg0-dev libusbmuxd-dev libxcb*-dev make python3-dev python3-tk qt3d5-dev qtdeclarative5-dev qttools5-dev v4l2loopback-dkms v4l2loopback-utils -y
```

### Packages for repositories management

```shell
sudo apt install curl apt-transport-https gnupg-agent -y
```

### Add extra repositories

```
# FSearch
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
sudo apt install dolphin-plugins filelight partitionmanager i7z printer-driver-all sweeper synaptic system-config-printer -y
```

```shell
flatpak --user install flathub com.github.tchx84.Flatseal -y
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

chmod +x install.sh
sudo ./install.sh
```

#### Orchis

For plasma:
- https://store.kde.org/p/1458927/
- https://github.com/vinceliuice/Orchis-kde

####  QogirLight

For colors:
- https://store.kde.org/p/1675750
- https://github.com/vinceliuice/Qogir-kde

#### Fluent

For icons:
- https://store.kde.org/p/1477945/
- https://github.com/vinceliuice/Fluent-kde

### Windows compatibility layer

```shell
sudo apt install wine -y
```

```shell
flatpak --user install flathub \
    org.telegram.desktop \
    io.github.mimbrero.WhatsAppDesktop -y
```

### Productivity

```shell
sudo apt install fsearch plocate zeitgeist autojump -y
```

### Reading & Writing

```shell
sudo apt install libreoffice libreoffice-style-sifr libreoffice-l10n-pt-br qpdfview okular -y
```

```shell
flatpak --user install flathub \
    com.calibre_ebook.calibre \
    org.gnome.gitlab.somas.Apostrophe \
    com.github.johnfactotum.Foliate \
    com.github.geigi.cozy \
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
sudo apt install pavucontrol-qt* soundconverter ffmpeg mencoder puddletag mda-lv2 elisa kamoso haruna ubuntu-restricted-* -y
```

```shell
flatpak --user install flathub \
    org.gimp.GIMP \
    org.kde.kasts \
    com.ozmartians.VidCutter \
    org.kde.koko \
    com.github.flxzt.rnote \
    org.audacityteam.Audacity \
    dev.aunetx.deezer -y
```

### Development

```shell
sudo apt install dia exuberant-ctags git kompare openjdk-17-jdk openjdk-17-jdk-headless openssh-server silversearcher-ag tmux tree vim-gtk3 virtualenv zeal -y
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
sudo apt install docker.io -y
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
sudo apt install scrcpy* -y
```

#### `rclone`:  A CLI to manage files on cloud storage

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
rm rclone-current-linux-amd64.deb
```
