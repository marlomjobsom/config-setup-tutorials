# Ubuntu 24.04 LTS (noble) 64-bits Setup

**Version**: [Ubuntu 24.04.1 LTS (noble) 64-bits](https://releases.ubuntu.com/24.04.1/ubuntu-24.04.1-desktop-amd64.iso)
**Notebooks**:

* [Samsung Galaxy Book4 Ultra](https://www.samsung.com/br/computers/galaxy-book4-ultra/)

## System Upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

## Gnome Desktop Configuration

```shell
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-show-seconds true
```

## Compilation

```shell
sudo apt install -y \
    build-essential \
    curl \
    git \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    python3-pip \
    python3-pip-whl \
    python3-setuptools-whl \
    python3.12-venv \
    tk-dev \
    xz-utils \
    zlib1g-dev
```

## Compressed files

```shell
sudo apt install -y \
    unzip \
    p7zip \
    p7zip-full \
    p7zip-rar \
    unrar
```

## Repositories management

```shell
sudo apt install -y \
    wget \
    aria2 \
    curl \
    apt-transport-https \
    gnupg-agent \
    synaptic
```

## Disk management

```shell
sudo apt install -y gparted
```

## Security

```shell
sudo apt install -y \
    ufw \
    gufw
```

## AppImages

```shell
sudo apt install -y libfuse2t64
```

## Repositories

### Flatpak

```shell
sudo apt install -y \
    flatpak \
    gnome-software-plugin-flatpak
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Fsearch

```shell
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable
```

## Configuration

```shell
sudo apt install -y \
    dconf-editor \
    gnome-tweaks \
    chrome-gnome-shell

flatpak --user install flathub -y \
    com.github.tchx84.Flatseal 
```

## Firmwares/Drivers

### Camera

- https://wiki.ubuntu.com/IntelMIPICamera

```shell
sudo add-apt-repository deb http://dell.archive.canonical.com/ noble somerville
sudo apt install --no-install-recommends -y \
    libcamhal0 \
    linux-modules-ipu6-generic \
    linux-generic-hwe-24.04 \
    linux-modules-ipu6-generic-hwe-24.04 \
    linux-modules-usbio-generic-hwe-24.04 \
    ubuntu-oem-keyring
```

### Battery

```shell
wget https://downloadmirror.intel.com/820388/814712_MTL_TuneD_Static_Profile_RN_Rev1p2.zip
unzip 814712_MTL_TuneD_Static_Profile_RN_Rev1p2.zip -d 814712_MTL_TuneD_Static_Profile_RN_Rev1p2
sudo dpkg -i 814712_MTL_TuneD_Static_Profile_RN_Rev1p2/pkg.OPT.EPPprofile-1.05.240206.1-x86_64.deb
rm -rf 814712_MTL_TuneD_Static_Profile_RN_Rev1p2*
sudo apt install -y \
    linux-modules-usbio-generic-hwe-24.04 \
    linux-generic-hwe-24.04 \
    tuned \
    tuned-utils
```

### Sound

`# TODO`

- https://forum.manjaro.org/t/howto-set-up-the-audio-card-in-samsung-galaxy-book/37090
- https://askubuntu.com/questions/1243369/sound-card-not-detected-ubuntu-20-04-sof-audio-pci

### Nvidia

```shell
sudo apt install -y nvidia-cuda-toolkit
```

### Printer

```shell
sudo apt install -y \
    printer-driver-all \
    system-config-printer
```

## Styling

- https://extensions.gnome.org/extension/7048/rounded-window-corners-reborn/

```shell
sudo apt install papirus-icon-theme -y
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash
```

## Windows compatibility layer

```shell
sudo apt install wine -y
```

## Communication

```shell
flatpak --user install flathub \
    org.telegram.desktop \
    io.github.mimbrero.WhatsAppDesktop -y
```

## Productivity

- https://extensions.gnome.org/extension/779/clipboard-indicator/

```shell
sudo apt install -y \
    bash-completion \
    tree \
    blackbox-terminal \
    fsearch \
    plocate \
    zeitgeist \
    autojump \
    gnome-calendar \
    gnome-clocks

flathub --user install -y \
    io.github.Qalculate.qalculate-qt
```

### `autojump`

```shell
printf '\n# AUTOJUMP\n' >> ~/.bashrc
echo '[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh' >> ~/.bashrc
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
sudo apt install -y \
    libreoffice \
    libreoffice-l10n-pt-br \
    libreoffice-style-sifr
```

```shell
flatpak --user install flathub -y \
    org.gnome.Papers \
    com.calibre_ebook.calibre \
    org.gnome.gitlab.somas.Apostrophe \
    com.github.johnfactotum.Foliate \
    eu.scarpetta.PDFMixTool \

wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb
sudo dpkg -i obsidian_1.7.7_amd64.deb
rm obsidian_1.7.7_amd64.deb
```

## Dictionary

```shell
sudo apt install -y \
    dictd \
    dict \
    dict-freedict-por-eng \
    dict-freedict-eng-por \
    dict-gcide \
    dict-wn \
    goldendict \
    hunspell \
    hunspell-pt-br \
    hunspell-pt-pt \
    hunspell-en-us
```

## Multimedia

```shell
sudo apt install -y \
    celluloid \
    ffmpeg \
    mencoder \
    pavucontrol \
    playerctl \
    shotwell \
    puddletag \
    vlc \
    nautilus-image-converter
```

```shell
flatpak --user install flathub -y \
    org.nickvision.tubeconverter \
    org.gimp.GIMP \
    org.gnome.Loupe \
    org.gnome.gitlab.YaLTeR.VideoTrimmer \
    io.gitlab.adhami3310.Footage \
    org.audacityteam.Audacity \
    org.gnome.Lollypop \
    com.github.flxzt.rnote \
    com.github.geigi.cozy
```

## Network

```shell
sudo apt install -y \
    rsync \
    tmate \
    aria2 \
    network-manager-ssh
```

### `rclone`

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
rm rclone-current-linux-amd64.deb
```

## Android

### `scrcpy`

```shell
sudo apt install -y \
    adb \
    scrcpy \
    scrcpy-server
```

## Development

```shell
sudo apt install -y \
    virtualenv \
    vim-gtk3 \
    exuberant-ctags \
    silversearcher-ag \
    tmux \
    git \
    openjdk-21-jdk \
    openjdk-21-jdk-headless \
    openssh-server
```

```shell
flatpak --user install flathub -y \
    org.zealdocs.Zeal \
    com.getpostman.Postman
```

### Docker

```shell
sudo apt install -y \
    wmdocker \
    docker-compose
sudo gpasswd -a $USER docker

sudo mkdir -p /home/docker-data
sudo service docker stop
sudo mv /var/lib/docker /home/docker-data
printf '{"data-root": "/home/docker-data/docker"}' | sudo tee /etc/docker/daemon.json
sudo service docker start
sudo service docker status
docker info -f '{{ .DockerRootDir}}'
```

### Wireshark

```shell
# Accept to let non-superusers to be able to capture packets
# If missed the prompot run $ sudo dpkg-reconfigure wireshark-common
sudo apt install wireshark -y

# It requires logout
sudo usermod -a -G wireshark $USER

# TIP: Runs it within its group to use wireshark without logout
# newgrp wireshark
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
pyenv install 3.12.7
pyenv global 3.12.7
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
npm install -g \
    yarn \
    electron

printf "\n# NVM\n" >> ~/.bashrc 
printf 'export NVM_DIR="$HOME/.nvm"\n' >> ~/.bashrc 
printf '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm\n' >> ~/.bashrc 
printf '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion\n' >> ~/.bashrc
source ~/.bashrc

sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/node /usr/bin/node
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/npm /usr/bin/npm
sudo ln -s $HOME/.nvm/versions/node/$(nvm current)/bin/electron /usr/bin/yarn
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

