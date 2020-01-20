# Ubuntu 19.10 (Eoan Ermine) Setup

**Version**: [Eoan 19.10 64-bits](http://releases.ubuntu.com/19.10/)
**Notebook**: [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)

## Basic system setup

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
sudo reboot
```

### Packages for compilation

```shell
sudo apt install python-dev python3-dev zlib1g-dev -y
```

### Packages for repositories management

```shell
sudo apt install curl ca-certificates apt-transport-https gnupg-agent software-properties-common -y
```

### Add extra repositories

This section depends on [Install packages for compilation and manage repositories]() steps.

```shell
# La-capitaine
sudo su -c "echo 'deb http://ppa.launchpad.net/dyatlov-igor/la-capitaine/ubuntu bionic main' >> /etc/apt/sources.list.d/la-capitaine.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C65A650570C1DA17B725012BC012ECBBC24D881

# Papirus
sudo add-apt-repository ppa:papirus/papirus

# Typora
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io/linux ./'

# VirtualBox
sudo su -c "echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian eoan contrib' >> /etc/apt/sources.list.d/virtualbox.list"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
```

### Add Flatpak support

```shell
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
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
# Default: PRUNEPATHS="/tmp /var/spool /media /var/lib/os-prober /var/lib/ceph /home/.ecryptfs /var/lib/schroot"
PRUNEPATHS="/bin /boot /dev /etc /lib /lib32 /lib64 /media /mnt /opt /root /run /sbin /tmp /var /home/.ecryptfs /var/lib/schroot"
PRUNEFS="NFS afs autofs binfmt_misc ceph cgroup cgroup2 cifs coda configfs curlftpfs debugfs devfs devpts devtmpfs ecryptfs ftpfs fuse.ceph fuse.cryfs fuse.encfs fuse.glusterfs fuse.gvfsd-fuse fuse.mfs fuse.rozofs fuse.sshfs fusectl fusesmb hugetlbfs iso9660 lustre lustre_lite mfs mqueue ncpfs nfs nfs4 ocfs ocfs2 proc pstore rpc_pipefs securityfs shfs smbfs sysfs tmpfs tracefs udev udf usbfs"
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
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-8-jdk* openjdk-11-jdk* openssh-server meld gitg zeal typora virtualbox-6.1 dia -y
```

#### `pyenv`

```shell
curl https://pyenv.run | bash
```

#### `NVM`

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install v12.14.1 # Latest LTS version so far
```

#### `jEnv`

```shell
git clone https://github.com/jenv/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
```

#### Docker

```shell
# FIXME: sudo apt install docker-ce docker-ce-cli containerd.io -y
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
sudo rm minikube
```

### Network
```shell
sudo apt install rsync tmate gufw aria2 stoken openconnect network-manager-openconnect network-manager-openconnect-gnome network-manager-openvpn network-manager-openvpn-gnome network-manager-ssh network-manager-ssh-gnome -y
```

### Configuration

```shell
sudo apt install synaptic dconf-editor gnome-tweak-tool -y
```

### Styling

```shell
sudo apt install papirus-icon-theme la-capitaine-cursor-theme chrome-gnome-shell -y
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
