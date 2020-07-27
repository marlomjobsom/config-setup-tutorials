# Ubuntu 20.04 LTS Setup

**Version**: [Focal Fossa 64-bits](https://releases.ubuntu.com/20.04/ubuntu-20.04-desktop-amd64.iso)
**Notebook**: [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)

## System setup

### Enable APT cache

```shell
sudo su -c "echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/01keep-debs"
```

### Upgrade

```shell
sudo apt update && sudo apt upgrade -y
```

### Packages for compilation

```shell
sudo apt install gcc make cmake build-essential python-dev python3-dev libssl-dev libreadline-dev libbz2-dev libsqlite3-dev libffi-dev -y
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

# Papirus
sudo su -c "echo 'deb http://ppa.launchpad.net/papirus/papirus/ubuntu focal main' >> /etc/apt/sources.list.d/papirus.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9461999446FAF0DF770BFC9AE58A9D36647CAE7Fs

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
sudo apt install synapse mlocate zeitgeist autojump gnome-shell-extensions-gpaste flameshot gnome-sushi gnome-calendar gnome-contacts gnome-clocks gnome-todo -y
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
sudo apt install dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-gcide dict-wn goldendict hunspell hunspell-pt-br hunspell-en-us -y
```

### Multimedia
```shell
sudo apt install soundconverter ffmpeg mencoder pavucontrol playerctl ubuntu-restricted-addons ubuntu-restricted-extras cheese -y
```

### Development
```shell
sudo apt install virtualenv vim-gtk3 exuberant-ctags silversearcher-ag tmux tree git openjdk-11-jdk openjdk-11-jdk-headless openjdk-8-jdk openjdk-8-jdk-headless openssh-server meld gitg zeal typora virtualbox dia baobab -y
```
#### `pyenv`

```shell
curl https://pyenv.run | bash
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
echo '# JENV' >> ~/.bashrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
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
sudo apt install rsync tmate gufw aria2 stoken openconnect network-manager-openconnect network-manager-openconnect-gnome network-manager-openvpn network-manager-openvpn-gnome network-manager-ssh network-manager-ssh-gnome -y
```

### Configuration

```shell
sudo apt install synaptic dconf-editor gnome-tweak-tool -y
```

### Styling

```shell
sudo apt install chrome-gnome-shell papirus-icon-theme la-capitaine-cursor-theme -y
```

### Utilities

#### `scrcpy`: An android device desktop control

```shell
sudo apt install scrcpy
```

### Flatpak apps

```shell
flatpak --user install flathub \
    org.videolan.VLC \
    org.telegram.desktop \
    com.uploadedlobster.peek \
    com.getpostman.Postman \
    com.calibre_ebook.calibre \
    com.elsevier.MendeleyDesktop \
    com.spotify.Client \
    org.gimp.GIMP \
    com.slack.Slack -y
```
