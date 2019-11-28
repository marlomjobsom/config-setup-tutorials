# Debian Setup

**Version**: [Buster 10.0 64-bits](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.0.0+nonfree/)
**Notebook**: [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)

## Basic system setup

### Enable APT cache

```shell
sudo su -c "echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/01keep-debs"
```

### Update `/etc/apt/sources.list`

```shell
sudo su -c "echo '# base' > /etc/apt/sources.list"
sudo su -c "echo 'deb  http://deb.debian.org/debian buster main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src  http://deb.debian.org/debian buster main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# updates' >> /etc/apt/sources.list"
sudo su -c "echo 'deb  http://deb.debian.org/debian buster-updates main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src  http://deb.debian.org/debian buster-updates main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# security' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://security.debian.org/debian-security/ buster/updates main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://security.debian.org/debian-security/ buster/updates main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# components' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://httpredir.debian.org/debian/ buster main contrib non-free' >> /etc/apt/sources.list"
```

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
sudo reboot
```

### Packages for compilation

```shell
sudo apt install gcc make cmake linux-headers-amd64 dkms bbswitch-dkms build-essential python-dev python3-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl pkg-config meson ninja-build libavcodec-dev libavformat-dev libavutil-dev libsdl2-dev -y
```

### Packages for repositories management

```shell
sudo apt install curl wget ca-certificates apt-transport-https gnupg2 software-properties-common dirmngr -y
```

### Common libraries for third-party softwares

```shell
sudo apt install libtinfo5 multiarch-support -y
```

### Drivers

#### Firmwares

```shell
sudo apt install firmware-realtek firmware-atheros firmware-misc-nonfree firmware-linux firmware-linux-free firmware-linux-nonfree  -y
```

#### Nvidia

```shell
sudo apt update
sudo apt install primus bumblebee-nvidia libgl1-nvidia-glx -y
sudo reboot

# TODO: Update Exec to Exec=optirun nvidia-settings -c :8.0
sudo vim /usr/share/applications/nvidia-settings.desktop

sudo gpasswd -a $USER bumblebee
```

### Setup bluetooth

```shell
sudo apt install bluez bluez-firmware bluez-tools blueman pulseaudio-module-bluetooth -y

# Setup /etc/bluetooth/audio.conf
sudo su -c "echo -e '[General]' >> /etc/bluetooth/audio.conf"
sudo su -c "echo -e 'Enable=Source,Sink,Media,Socket' >> /etc/bluetooth/audio.conf"

# Setup /var/lib/gdm3/.config/pulse/client.conf
sudo su -c "echo -e 'autospawn = no\ndaemon-binary = /bin/true' > /var/lib/gdm3/.config/pulse/client.conf"
sudo chown Debian-gdm:Debian-gdm /var/lib/gdm3/.config/pulse/client.conf

# Disable pulseaudio startup
sudo rm /var/lib/gdm3/.config/systemd/user/sockets.target.wants/pulseaudio.socket

# Needed to some devices auto-connect a2dp
sudo su -c "echo -e '\n# In order to auto-connect a2dp for some devices\nload-module module-switch-on-connect' >> /etc/pulse/default.pa"

sudo service bluetooth restart
sudo killall pulseaudio
```

### Add extra repositories

This section depends on [Install packages for compilation and manage repositories]() steps.

```shell
# Multimedia 
sudo su -c "echo 'deb [arch=amd64] https://www.deb-multimedia.org $(lsb_release -cs) main non-free' > /etc/apt/sources.list.d/debian-multimedia.list"
sudo apt update -oAcquire::AllowInsecureRepositories=true
sudo apt install deb-multimedia-keyring --allow-unauthenticated -y

# Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# La-capitaine
sudo su -c "echo 'deb http://ppa.launchpad.net/dyatlov-igor/la-capitaine/ubuntu cosmic main' >> /etc/apt/sources.list.d/la-capitaine.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C65A650570C1DA17B725012BC012ECBBC24D881

# Papirus
sudo su -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu bionic main' >> /etc/apt/sources.list.d/papirus.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9461999446FAF0DF770BFC9AE58A9D36647CAE7F

# Flatpak
sudo su -c "echo 'deb http://ppa.launchpad.net/alexlarsson/flatpak/ubuntu bionic main' >> /etc/apt/sources.list.d/flatpak.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 690951F1A4DE0F905496E8C6C793BFA2FA577F07

# Typora
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io/linux ./'

# VirtualBox
sudo su -c "echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib' >> /etc/apt/sources.list.d/virtualbox.list"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
```

### Add Flatpak support

```shell
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo su -c "echo '1' > /proc/sys/kernel/unprivileged_userns_clone"
```

## System user setup

### Windows compatibility layer
```shell
sudo apt install wine playonlinux -y
```
### Productivity
```shell
sudo apt install synapse mlocate zeitgeist autojump gnome-shell-extensions-gpaste flameshot -y
```

#### After install: `mlocate`

After install `mloacate`, update `/etc/updatedb.conf` with the following:

```shell
PRUNE_BIND_MOUNTS="yes"
PRUNENAMES=".git .bzr .hg .svn"
# Default: PRUNEPATHS="/tmp /var/spool /media /var/lib/os-prober /var/lib/ceph"
PRUNEPATHS="/bin /boot /dev /etc /lib /lib32 /lib64 /libx32 /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /var"
PRUNEFS="NFS afs autofs binfmt_misc ceph cgroup cgroup2 cifs coda configfs curlftpfs debugfs devfs devpts devtmpfs ecryptfs ftpfs fuse.ceph fuse.glusterfs fuse.gvfsd-fuse fuse.mfs fuse.rozofs fuse.sshfs fusectl fusesmb hugetlbfs iso9660 lustre lustre_lite mfs mqueue ncpfs nfs nfs4 ocfs ocfs2 proc pstore rpc_pipefs securityfs shfs smbfs sysfs tmpfs tracefs udev udf usbfs"
```

### Dictionary
```shell
sudo apt install dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-moby-thesaurus dict-gcide dict-wn goldendict hunspell hunspell-pt-br hunspell-en-us -y
```

### Multimedia
```shell
sudo apt install soundconverter puddletag ffmpeg mencoder puddletag pavucontrol playerctl -y
```

### Development
```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-11-jdk* openssh-server meld gitg zeal typora virtualbox-6.0 dia -y
```

#### `NVM`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install v10.16.0 # Latest LTS version so far
```

#### `jEnv`

```shell
git clone https://github.com/jenv/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
```

#### JDK 8

It will requires also to have `jEnv` utility installed to allow the switch between the versions installed.

```shell
# Download JDK 8: https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
sudo mkdir -p /usr/lib/jvm
cd /usr/lib/jvm
sudo mv $HOME/Downloads/jdk-8u221-linux-x64.tar.gz
sudo tar -zxf jdk-8u221-linux-x64.tar.gz

# Add the JDK 8 installed previously at jEnv
jenv add /usr/lib/jvm/jdk1.8.0_221/
```

#### Docker

```shell
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo gpasswd -a $USER docker
```

#### Kubernetes

##### Kubectl
```shell
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

##### Minikube
```shell
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo install minikube /usr/local/bin/
```

### Network
```shell
sudo apt install rsync tmate gufw aria2 stoken openconnect network-manager-openconnect network-manager-openconnect-gnome network-manager-openvpn network-manager-openvpn-gnome network-manager-ssh network-manager-ssh-gnome
```

### Configuration

```shell
sudo apt install synaptic dconf-editor gnome-tweak-tool -y
```

### Styling

```shell
sudo apt install libreoffice-style-sifr papirus-icon-theme la-capitaine-cursor-theme -y
```

### Utilities

#### `scrcpy`: An android device desktop control

```shell
cd $HOME

# Download scrcpy
wget https://github.com/Genymobile/scrcpy/archive/v1.11.tar.gz -O v1.11.tar.gz
tar -zxf v1.11.tar.gz
rm v1.11.tar.gz
cd scrcpy-1.11
meson x --buildtype release --strip -Db_lto=true
cd x

# From this point, it requires the download of scrcpy-server.jar
wget https://github.com/Genymobile/scrcpy/releases/download/v1.11/scrcpy-server-v1.11
mv scrcpy-server-v1.11 server/scrcpy-server

# Build scrcpy
sudo ninja install
sudo rm -rf $HOME/scrcpy-1.11

# Setup ADB to allow user to manage device
sudo gpasswd -a $USER plugdev
sudo su -c "echo '# Motorola' > /etc/udev/rules.d/51-android.rules"
sudo su -c "echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", ATTR{idProduct}=="2e81", MODE="0666", GROUP="plugdev"' >> /etc/udev/rules.d/51-android.rules"
sudo adb kill-server
sudo adb devices -l

# Ensure there is an Android device connected on host
scrcpy
```

### Flatpak apps

```shell
# VLC
flatpak --user install flathub org.videolan.VLC -y

# Telegram
flatpak --user install flathub org.telegram.desktop -y

# Peek
flatpak --user install flathub com.uploadedlobster.peek -y 

# Postman
flatpak --user install flathub com.getpostman.Postman -y

# Calibre
flatpak --user install flathub com.calibre_ebook.calibre -y

# Mendeley
flatpak --user install flathub com.elsevier.MendeleyDesktop -y

# Spotfy
flatpak --user install flathub com.spotify.Client -y

# GIMP
flatpak --user install flathub org.gimp.GIMP -y

# Inkscape
flatpak --user install flathub org.inkscape.Inkscape -y
```
