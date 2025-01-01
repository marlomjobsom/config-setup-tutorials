# Ubuntu 24.04 LTS (noble) 64-bits Setup

**Version**:

* [Fedora 41 KDE 64-bits](https://download.fedoraproject.org/pub/fedora/linux/releases/41/Spins/x86_64/iso/Fedora-KDE-Live-x86_64-41-1.4.iso)

**Notebooks**:

* [Samsung Galaxy Book4 Ultra](https://www.samsung.com/br/computers/galaxy-book4-ultra/)

## System Upgrade

```shell
sudo dnf update -y && sudo dnf upgrade -y && sudo dnf update @core -y
```

## Compilation

```shell
sudo dnf install -y \
    acpid \
    bzip2 \
    bzip2-devel \
    cmake \
    dkms \
    extra-cmake-modules \
    findutils \
    gcc \
    gcc-c++ \
    git \
    kernel-devel \
    kernel-headers \
    kf6-kcmutils-devel \
    kf6-kconfigwidgets-devel \
    kwin-devel \
    libepoxy-devel \
    libffi-devel \
    libglvnd-devel \
    libglvnd-glx \
    libglvnd-opengl \
    make \
    openssl-devel \
    pkgconfig \
    qt6-qtbase-private-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    wayland-devel \
    xz \
    xz-devel \
    zlib-devel
```

## Compressed files

```shell
sudo dnf install -y \
    unzip \
    p7zip \
    p7zip-plugins \
    unrar
```

## Repositories management

```shell
sudo dnf install -y \
    wget \
    aria2 \
    curl \
    dnfdragora-gui
```

## Repositories

### RPM Fusion (Free and Non-Free)
```shell
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Flatpak

```shell
sudo dnf install -y \
    flatpak \
    plasma-discover-flatpak
flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

### Fsearch

```shell
dnf copr enable cboxdoerfer/fsearch
```

## Firmwares/Drivers

```shell
sudo fwupdmgr get-devices 
sudo fwupdmgr refresh --force 
sudo fwupdmgr get-updates
sudo fwupdmgr update
```

### Camera

- https://wiki.ubuntu.com/IntelMIPICamera

```shell
sudo dnf install akmod-intel-ipu6 -y
sudo ipu6-driver-select proprietary
```

### Sound

`# TODO`

- https://forum.manjaro.org/t/howto-set-up-the-audio-card-in-samsung-galaxy-book/37090
- https://askubuntu.com/questions/1243369/sound-card-not-detected-ubuntu-20-04-sof-audio-pci

### Nvidia

- https://www.nvidia.com/en-us/drivers/unix/
- https://negativo17.org/nvidia-driver/
- https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64
- https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#fedora
- https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/
- https://developer.download.nvidia.com/compute/cuda/repos/fedora40/x86_64/
- https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/

```shell
sudo dnf install akmod-nvidia -y

# `# TODO`
# sudo dnf config-manager addrepo --from-repofile=https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo
# sudo dnf config-manager addrepo --from-repofile=https://developer.download.nvidia.com/compute/cuda/repos/fedora40/x86_64/cuda-fedora40.repo
# sudo dnf config-manager addrepo --from-repofile=https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo
# sudo dnf install -y cuda-toolkit nvidia-container-toolkit nvidia-settings nvidia-gpu-firmware xorg-x11-drv-nvidia-cuda nvidia-driver nvidia-driver-cuda
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
sudo dnf install wine -y
```

## Communication

```shell
flatpak --user install flathub -y \
    org.telegram.desktop \
    com.rtosta.zapzap
```

## Productivity

```shell
sudo dnf install -y \
    bash-completion \
    tree \
    plocate \
    zeitgeist \
    autojump \
    kclock

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
sudo dnf install -y \
    libreoffice \
    libreoffice-langpack-pt-BR
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
sudo dnf install -y \
    dictd \
    dict \
    goldendict \
    hunspell \
    hunspell-pt-BR \
    hunspell-en-US
```

## Multimedia

```shell
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf install -y \
    ffmpeg \
    gstreamer1-plugin-openh264 \
    haruna \
    koko \
    mencoder \
    mozilla-openh264 \
    openh264 \
    puddletag \
    vlc
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
sudo dnf install -y \
    rsync \
    tmate \
    aria2 \
    openssh-server
```

### `rclone`

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.rpm
sudo dnf install -y rclone-current-linux-amd64.rpm
rm rclone-current-linux-amd64.rpm
```

## Android

### `scrcpy`

```shell
sudo dnf install -y \
    android-tools

wget https://github.com/Genymobile/scrcpy/releases/download/v3.1/scrcpy-linux-x86_64-v3.1.tar.gz
tar -zxf scrcpy-linux-x86_64-v3.1.tar.gz
mv scrcpy-linux-x86_64-v3.1 scrcpy-linux
sudo mv scrcpy-linux /opt/

printf '\n# SCRCPY\n' >> ~/.bashrc
echo 'export PATH="$PATH:/opt/scrcpy-linux"' >> ~/.bashrc
```

## Development

```shell
sudo dnf install -y \
    virtualenv \
    vim \
    global-ctags \
    the_silver_searcher \
    tmux \
    git \
    java-21-openjdk \
    java-21-openjdk-headless \
    java-21-openjdk-headless \
    java-21-openjdk-devel \
    openssh-server
```

```shell
flatpak --user install flathub -y \
    org.zealdocs.Zeal \
    com.getpostman.Postman
```

### Docker

```shell
sudo dnf install -y \
    wmdocker \
    docker-compose
sudo gpasswd -a $USER docker

sudo mkdir -p /home/docker-data
sudo service docker stop
sudo mv /var/lib/docker /home/docker-data
sudo mkdir -p /etc/docker/
printf '{"data-root": "/home/docker-data/docker"}' | sudo tee /etc/docker/daemon.json
sudo service docker start
sudo service docker status
docker info -f '{{ .DockerRootDir}}'
```

### Wireshark

```shell
sudo dnf install wireshark -y
sudo usermod -a -G wireshark $USER
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

