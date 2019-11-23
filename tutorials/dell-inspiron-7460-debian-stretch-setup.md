# Debian Setup

**Version**: [Stretch 9.3 64-bits](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/9.3.0+nonfree/)

**HW Used**: [Inspiron 7460 14"](http://www.dell.com/br/p/inspiron-14-7460-laptop/pd?ref=491_title&oc=cai7460w10he1852539brpw&model_id=inspiron-14-7460-laptop)

## Basic system preparements

### Update `/etc/apt/sources.list`
```shell
sudo su -c "echo '# base' > /etc/apt/sources.list"
sudo su -c "echo 'deb  http://deb.debian.org/debian stretch main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src  http://deb.debian.org/debian stretch main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# updates' >> /etc/apt/sources.list"
sudo su -c "echo 'deb  http://deb.debian.org/debian stretch-updates main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src  http://deb.debian.org/debian stretch-updates main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# security' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://security.debian.org/debian-security/ stretch/updates main contrib non-free' >> /etc/apt/sources.list"
sudo su -c "echo 'deb-src http://security.debian.org/debian-security/ stretch/updates main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# components' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://httpredir.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"

sudo su -c "echo -e '\n# backports' >> /etc/apt/sources.list"
sudo su -c "echo 'deb http://http.debian.net/debian stretch-backports main contrib' >> /etc/apt/sources.list"
```

### Install packages for compilation
```shell
sudo apt-get update
sudo apt-get install gcc make cmake linux-headers-amd64 dkms bbswitch-dkms curl wget apt-transport-https dirmngr build-essential checkinstall python-dev python3-dev -y
```

### Add extra repositories
These steps depends on *Install packages for compilation* section steps.

```shell
cd $HOME

# Multimedia 
sudo su -c "echo 'deb [arch=amd64,i386] https://www.deb-multimedia.org stable main non-free' > /etc/apt/sources.list.d/debian-multimedia.list"
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
rm deb-multimedia-keyring_2016.8.1_all.deb

# Docker
sudo su -c "echo 'deb [arch=amd64] https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker-ce.list"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Typora
sudo su -c "echo 'deb http://typora.io linux/' > /etc/apt/sources.list.d/typora.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

# Flatpak
sudo su -c "echo 'deb http://ppa.launchpad.net/alexlarsson/flatpak/ubuntu xenial main' > /etc/apt/sources.list.d/flatpak.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 690951F1A4DE0F905496E8C6C793BFA2FA577F07

# Spotfy
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
```

### Add flatkpak support

```shell
sudo su -c "echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/userns.conf"
sudo apt-get install flatpak gnome-software-plugin-flatpak -y

# Flatkpak repos: (1) flathub; (2) gnome-apps; (3) gnome
flatpak --user remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo
flatpak --user remote-add --from gnome-apps https://sdk.gnome.org/gnome-apps.flatpakrepo
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
## Installations

### Packages upgrades
```shell
sudo apt update && sudo apt upgrade -y
sudo reboot
```

### Firmwares and other packages
```shell
sudo apt install zeitgeist firmware-realtek firmware-atheros firmware-linux* pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware blueman -y
```

### Install system libs
```shell
sudo apt install python3-dev libffi-dev libssl-dev lib32z1 lib32ncurses5 libreadline-gplv2-dev libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libxml2-utils gtk2-engines-murrine gtk2-engines-pixbuf zlib1g-dev llvm libncurses5-dev libgtk-3-dev xsel -y
```

### Update kernel
1. Open synaptic and select the kernel to upgrade
2. Reboot the machine

### Install `bumblebee-nvidia`
```shell
sudo apt update
sudo apt install primus bumblebee-nvidia -y
sudo reboot

# TODO: Update Exec to Exec=optirun nvidia-settings -c :8.0
sudo vim /usr/share/applications/nvidia-settings.desktop
```

### Install `NVM`, `NodeJS` and utils
```shell
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install v10.15.2 # Latest LTS version so far
```

### Utilities
```shell
sudo apt install git soundconverter puddletag ffmpeg mencoder openjdk-8-jdk* puddletag libreoffice-style-sifr playonlinux docker-c* synapse typora clipit autojump vim-gtk tmux tree openssh-server dconf-editor silversearcher-ag chrome-gnome-shell exuberant-ctags wine playonlinux dictd dict dict-freedict-por-eng dict-freedict-eng-por dict-moby-thesaurus dict-gcide dict-wn goldendict aria2 pyrenamer tmate clementine gnome-shell-pomodoro spotfy-client rsync -y
```

### Flatpak apps
Remove these following apps using `$ sudo apt remove [package_name]`.

```shell
# VLC
flatpak --user install flathub org.videolan.VLC -y

# Telegram
flatpak --user install flathub org.telegram.desktop -y

# Peek
flatpak --user install flathub com.uploadedlobster.peek -y 

# Postman
flatpak --user install flathub com.getpostman.Postman -y

# Podcasts
flatpak --user install flathub org.gnome.Podcasts -y

# Calibre
flatpak --user install flathub com.calibre_ebook.calibre -y

# Zeal
flatpak --user install flathub org.zealdocs.Zeal -y

# Gitg
flatpak --user install flathub org.gnome.gitg -y

# Meld
flatpak install flathub org.gnome.meld -y
```

## Troubleshooting

### Fix bluetooth
```shell
sudo service bluetooth restart
sudo killall pulseaudio
sudo su -c "echo -e 'autospawn = no\ndaemon-binary = /bin/true' > /var/lib/gdm3/.config/pulse/client.conf"
sudo chown Debian-gdm:Debian-gdm /var/lib/gdm3/.config/pulse/client.conf
sudo rm /var/lib/gdm3/.config/systemd/user/sockets.target.wants/pulseaudio.socket
sudo su -c "echo -e '\n#In order to auto-connect a2dp for some devices\nload-module module-switch-on-connect' >> /etc/pulse/default.pa"
```
