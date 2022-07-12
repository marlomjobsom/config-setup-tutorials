# Ubuntu 22.04 LTS Setup

**Version**: [Jammy Jellyfish 64-bits](https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso)
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
sudo apt install gcc make cmake build-essential python2-dev python3-dev libssl-dev libreadline-dev libbz2-dev libsqlite3-dev libffi-dev dialog -y
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

#### La-capitaine

```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C65A650570C1DA17B725012BC012ECBBC24D881
sudo apt-key export BC24D881 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/la-capitaine.gpg
sudo apt-key del BC24D881
sudo su -c "echo 'deb [signed-by=/etc/apt/trusted.gpg.d/la-capitaine.gpg] http://ppa.launchpad.net/dyatlov-igor/la-capitaine/ubuntu cosmic main"
```

#### Flatpak: Flathub

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
flatpak --user install flathub \
    org.gnome.Geary \
    org.telegram.desktop \
    io.github.mimbrero.WhatsAppDesktop -y
```

### Productivity

```shell
sudo apt install synapse mlocate zeitgeist autojump gnome-shell-extensions-gpaste gnome-sushi gnome-calendar gnome-contacts gnome-clocks gnome-todo -y
```

### Reading & Writing

```shell
sudo apt install libreoffice libreoffice-l10n-pt-br cherrytree -y
```

```shell
flatpak --user install flathub \
    com.calibre_ebook.calibre \
    org.gnome.gitlab.somas.Apostrophe -y
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
sudo apt install soundconverter ffmpeg mencoder pavucontrol playerctl ubuntu-restricted-addons ubuntu-restricted-extras cheese shotwell puddletag vlc pulseeffects mda-lv2 -y
```

```shell
flatpak --user install flathub \
    org.gnome.Lollypop \
    org.gimp.GIMP \
    org.gnome.gitlab.YaLTeR.VideoTrimmer \
    io.github.celluloid_player.Celluloid \
    org.gnome.Podcasts \
    com.github.flxzt.rnote -y
```

#### Celluloid: Saving video position
1. Open *Celluloid*
2. Go to *Preferences*
3. Go to *Miscellaneous* tab
4. Add `save-position-on-quit` in *Extra mpv options* text field

### Development
```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-11-jdk openjdk-11-jdk-headless openjdk-8-jdk openjdk-8-jdk-headless openssh-server meld gitg zeal virtualbox dia baobab -y
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
pyenv install 3.10.4
pyenv install 2.7.18
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

#### Kubernetes

##### Kubectl
```shell
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo install kubectl /usr/local/bin/
rm kubectl
```

##### Minikube
```shell
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/
rm minikube
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
rm rclone-current-linux-amd64.deb
```
