# Ubuntu 22.04 LTS Setup

**Version**: [Jammy Jellyfish 64-bits](https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso)
**Notebook**: [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)

## System setup

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

### Packages for compilation

```shell
sudo apt install gcc make cmake build-essential python2-dev python3-dev libssl-dev libreadline-dev libbz2-dev libsqlite3-dev libffi-dev dialog -y
```

### Packages for repositories management

```shell
sudo apt install curl wget apt-transport-https gnupg-agent -y
```

### Add extra repositories

```shell
# La-capitaine
sudo su -c "echo 'deb http://ppa.launchpad.net/dyatlov-igor/la-capitaine/ubuntu cosmic main' >> /etc/apt/sources.list.d/la-capitaine.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C65A650570C1DA17B725012BC012ECBBC24D881

# Typora
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io/linux ./'
```

### Add Flatpak support

```shell
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## User setup

### Configuration

```shell
sudo apt install synaptic dconf-editor gnome-tweaks gnome-shell-extension-manager -y
```

### Styling

```shell
sudo apt install chrome-gnome-shell papirus-icon-theme la-capitaine-cursor-theme -y
```

### Windows compatibility layer
```shell
sudo apt install wine playonlinux -y
```

### Communication
```shell
sudo apt install evolution evolution-ews -y
```

### Productivity

```shell
sudo apt install synapse mlocate zeitgeist autojump gnome-shell-extensions-gpaste flameshot gnome-sushi gnome-calendar gnome-contacts gnome-clocks gnome-todo libreoffice libreoffice-l10n-pt-br -y
```

### Dictionary
```shell
sudo apt install dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-gcide dict-wn goldendict hunspell hunspell-pt-br hunspell-en-us -y
```

### Multimedia
```shell
sudo apt install soundconverter ffmpeg mencoder pavucontrol playerctl ubuntu-restricted-addons ubuntu-restricted-extras cheese shotwell puddletag vlc -y

# Plugins for PulseEffets + PulseEffects itself
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-convolver-pulseeffects gstreamer1.0-plugins-good lsp-plugins zam-plugins mda-lv2 libsamplerate0 libsndfile1 libebur128-1 pulseeffects -y
```

### Development
```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-11-jdk openjdk-11-jdk-headless openjdk-8-jdk openjdk-8-jdk-headless openssh-server meld gitg zeal typora virtualbox dia baobab -y
```

#### `pyenv`

```shell
curl https://pyenv.run | bash
printf '\n#PYENV' >> ~/.bashrc
echo export PATH=$PATH:$HOME/.pyenv/bin:$HOME/.pyenv/shims
echo eval "$(pyenv virtualenv-init -)"
```

#### `poetry`
```shell
pip install --user poetry
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
```

#### `NVM`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install v12.16.2
```

#### `jEnv`

```shell
git clone https://github.com/jenv/jenv.git ~/.jenv
printf '\n# JENV' >> ~/.bashrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
jenv enable-plugin export
exec $SHELL -l
```

#### Docker

```shell
sudo apt install docker docker-compose -y
sudo gpasswd -a $USER docker
```

#### Kubernetes

##### Kubectl
```shell
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo install kubectl /usr/local/bin/
```

##### Minikube
```shell
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/
```

### Network
```shell
sudo apt install rsync tmate gufw aria2 openconnect network-manager-openconnect network-manager-openconnect-gnome network-manager-openvpn network-manager-openvpn-gnome network-manager-ssh network-manager-ssh-gnome -y
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
sudo apt install scrcpy
```

#### `rclone`:  A CLI to manage files on cloud storage

```shell
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
sudo dpkg -i rclone-current-linux-amd64.deb
```

### Flatpak apps and themes

```shell
flatpak --user install flathub \
    org.telegram.desktop \
    com.uploadedlobster.peek \
    com.getpostman.Postman \
    com.calibre_ebook.calibre \
    org.gnome.Lollypop \
    org.gimp.GIMP -y
```
