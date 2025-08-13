# Debian 13 (Trixie) KDE Setup

**Version**: 

* [Trixie 64-bits](https://debian.osuosl.org/debian-cdimage/13.0.0/amd64/iso-dvd/debian-13.0.0-amd64-DVD-1.iso)

**Notebooks**:

* [Samsung Galaxy Book4 Ultra](https://www.samsung.com/br/computers/galaxy-book4-ultra/)

## Repository setup

```shell
sudo su -c "echo '# base' > /etc/apt/sources.list"
sudo su -c "echo 'deb http://deb.debian.org/debian/ trixie main non-free-firmware contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://deb.debian.org/debian/ trixie main non-free-firmware contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# security' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://security.debian.org/debian-security trixie-security main non-free-firmware' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://security.debian.org/debian-security trixie-security main non-free-firmware' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# updates' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://deb.debian.org/debian/ trixie-updates main non-free-firmware' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://deb.debian.org/debian/ trixie-updates main non-free-firmware' >> /etc/apt/sources.list"
```

## System upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

## Compilation

```shell
sudo apt-get install -y \
    build-essential \
    cmake \
    dialog \
    extra-cmake-modules \
    g++ \
    gcc \
    gettext \
    git \
    kinit-dev \
    kwin-dev \
    libayatana-appindicator3-1 \
    libasound2-dev \
    libavutil-dev \
    libbz2-dev \
    libffi-dev \
    libkf6kcmutils-dev \
    liblzma-dev \
    libplist-dev \
    libreadline-dev \
    libspeex-dev \
    libsqlite3-dev \
    libssl-dev \
    libswscale-dev \
    libturbojpeg0-dev \
    libusbmuxd-dev \
    linux-headers-amd64 \
    linux-headers-`uname -r` \
    make \
    python3-dev \
    python3-tk \
    qt6-base-dev-tools \
    qt6-base-private-dev \
    v4l2loopback-dkms \
    v4l2loopback-utils
```

## Repositories management

```shell
sudo apt-get -y install \
    apt-transport-https \
    aria2 \
    curl \
    flatpak \
    gnupg-agent \
    plasma-discover-backend-flatpak \
    wget
```

## Flatpak: Flathub

```shell
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Configuration

```shell
sudo apt-get install -y \
    bluez \
    bluez-alsa-utils \
    bluez-firmware \
    bluez-tools \
    dolphin-plugins \
    filelight \
    i7z \
    linux-cpupower \
    power-calibrate \
    power-profiles-daemon \
    repowerd \
    powermgmt-base \
    printer-driver-all \
    sweeper \
    synaptic \
    system-config-printer \
    thermald

flatpak --user install flathub -y \
    com.github.tchx84.Flatseal \
    io.github.flattool.Warehouse
```

## Drivers

### Firmwares

```shell
sudo fwupdmgr get-devices 
sudo fwupdmgr refresh --force 
sudo fwupdmgr get-updates
sudo fwupdmgr update

sudo apt-get install -y \
    firmware-linux \
    firmware-misc-nonfree
```

### Camera

`# TODO: https://github.com/intel/ipu6-drivers/issues/329`

### Sound

`# TODO`

```shell
sudo apt-get install -y \
    firmware-sof-signed
```

### Nvidia Drivers

- https://wiki.debian.org/NvidiaGraphicsDrivers#Debian_13_.22Trixie.22
- https://wiki.debian.org/NvidiaGraphicsDrivers#wayland-modesetting
- https://developer.download.nvidia.com/compute/cuda/repos/
- https://docs.nvidia.com/deeplearning/cudnn/installation/latest/linux.html

```shell
sudo apt-get install -y \
    firmware-nvidia-graphics \
    firmware-nvidia-gsp \
    nvidia-driver \
    nvidia-kernel-dkms
```

### Nvidia Cuda

```shell
sudo apt-get install -y \
  nvidia-cuda-dev \
  nvidia-cuda-toolkit
```

### Nvidia cuDNN

```shell
sudo apt-get install -y \
    nvidia-cudnn
```

## Styling

### Papirus Icon theme

```shell
sudo dnf install papirus-icon-theme -y
```

### KDE Rounded Corners

- https://github.com/matinlotfali/KDE-Rounded-Corners

```shell
git clone https://github.com/matinlotfali/KDE-Rounded-Corners
cd KDE-Rounded-Corners
mkdir build
cd build
cmake ..
cmake --build . -j
sudo make install
```

## Windows compatibility layer

```shell
sudo apt-get install -y \
    ca-certificates \
    cabextract \
    xfonts-utils \
    ttf-mscorefonts-installer \
    wine
```

## Communication

```shell
flatpak --user install flathub -y \
    org.telegram.desktop \
    com.rtosta.zapzap
```

## Productivity

```shell
sudo apt-get install -y \
    autojump \
    bash-completion \
    fsearch \
    kclock \
    plocate \
    tree \
    zeitgeist

# autojump
printf '\n# AUTOJUMP\n' >> ~/.bashrc
echo '[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh' >> ~/.bashrc
```

```shell
flathub --user install -y \
    io.github.Qalculate.qalculate-qt
```

### FZF

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
printf '\n# FZF\n' >> ~/.bashrc
echo 'export FZF_DEFAULT_OPTS="--reverse --inline-info"' >> ~/.bashrc
echo 'export FZF_DEFAULT_COMMAND="ag --ignore '*.pyc' --ignore '*.swp' --ignore '~*' --ignore 'node_modules' --ignore 'build' -g ''"' >> ~/.bashrc
```

## Reading & Writing

```shell
sudo apt-get install -y \
    libreoffice \
    libreoffice-style-sifr \
    libreoffice-l10n-pt-br \
    qpdfview
```

```shell
flatpak --user install flathub -y \
    org.gnome.Papers \
    com.calibre_ebook.calibre \
    org.gnome.gitlab.somas.Apostrophe \
    com.github.johnfactotum.Foliate \
    eu.scarpetta.PDFMixTool \
    md.obsidian.Obsidian
```

## Dictionary

```shell
sudo apt-get install -y \
    dict \
    dict-freedict-eng-por \
    dict-freedict-por-eng \
    dict-gcide \
    dict-wn \
    dictd \
    goldendict \
    hunspell \
    hunspell-en-us \
    hunspell-pt-br
```

## Multimedia

```shell
sudo apt-get install -y \
    elisa \
    ffmpeg \
    haruna \
    kamoso \
    koko \
    mda-lv2 \
    mencoder \
    pavucontrol-qt* \
    puddletag \
    soundconverter \
    vlc
```

```shell
flatpak --user install flathub -y \
    com.github.flxzt.rnote \
    dev.aunetx.deezer \
    io.gitlab.adhami3310.Footage \
    org.audacityteam.Audacity \
    org.gimp.GIMP \
    org.gnome.Lollypop \
    org.gnome.Loupe \
    org.gnome.gitlab.YaLTeR.VideoTrimmer \
    org.kde.skanlite \
    org.nickvision.tubeconverter
```

## Network

```shell
sudo apt-get install -y \
    aria2 \
    ktorrent \
    network-manager-openconnect \
    network-manager-ssh \
    openconnect \
    openssh-server \
    rsync \
    tmate
```

### `rclone`

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
rm rclone-current-linux-amd64.deb
```

### Wireshark

```shell
# Accept to let non-superusers to be able to capture packets
# If missed the prompot run $ sudo dpkg-reconfigure wireshark-common
sudo apt-get install wireshark -y

# It requires logout
sudo usermod -a -G wireshark $USER

# TIP: Runs it within its group to use wireshark without logout
# newgrp wireshark
```

## Android

### `scrcpy`

```shell
aria2c https://github.com/Genymobile/scrcpy/releases/download/v3.3.1/scrcpy-linux-x86_64-v3.3.1.tar.gz

sudo apt-get install -y adb
tar -zxf scrcpy-linux-x86_64-v3.3.1.tar.gz
sudo vm scrcpy-linux-x86_64-v3.3.1 /opt/scrcpy
sudo chown debian:debian -R /opt/
printf '\n# SCRCPY\n' >> ~/.bashrc
echo 'export PATH=/opt/scrcpy/:$PATH' >> ~/.bashrc
```

## Development

```shell
sudo apt-get install -y \
    dia \
    exuberant-ctags \
    git \
    openjdk-25-jdk \
    openjdk-25-jdk-headless \
    kompare \
    openssh-server \
    silversearcher-ag \
    tmux \
    tree \
    vim \
    vim-gtk3 \
    virtualenv
```

```shell
flatpak --user install flathub -y \
    org.zealdocs.Zeal \
    com.getpostman.Postman
```

### Podman

```shell
sudo apt-get install -y \
    podman \
    podman-compose
```

### Docker

```shell
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
sudo gpasswd -a $USER docker

sudo mkdir -p /home/docker-data
sudo service docker stop
sudo mv /var/lib/docker /home/docker-data
sudo mkdir -p /etc/docker/
printf '{"data-root": "/home/docker-data/docker"}' | sudo tee /etc/docker/daemon.json
sudo systemctl enable --now docker
docker info -f '{{ .DockerRootDir}}'
```

### `pyenv`

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

### `poetry`

```shell
pip install poetry
poetry completions bash | sudo tee /etc/bash_completion.d/poetry.bash-completion
```

### `NVM`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/node /usr/bin/node
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/npm /usr/bin/npm
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/electron /usr/bin/electron
```

### `jEnv`

```shell
git clone https://github.com/jenv/jenv.git ~/.jenv
printf '\n# JENV\n' >> ~/.bashrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
source ~/.bashrc
jenv enable-plugin export
exec $SHELL -l
```
