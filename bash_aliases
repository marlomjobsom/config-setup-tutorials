# Alias sync "WD My Passport Ultra External" to "Inspiron 7460"
alias wd_to_inspiron='rsync.py --origin /media/marlom/marlom_backup/ --dest ~/ --folders Android Documentos Downloads Imagens Música ProgramasRFB Softwares VMs Workspace Podcasts Vídeos .local/share/Steam .local/share/Zeal/Zeal/docsets .PlayOnLinux/wineprefix/ .pyenv .ssh .receitanet --files .agignore .bash_aliases .bash_profile .ctags .gitconfig --enable_all --exclude *~ *pyc argparse sys .fuse* *swp'

# Alias sync "Inspiron 7460" to "WD My Passport Ultra External"
alias inspiron_to_wd='rsync.py --origin ~/ --dest /media/marlom/marlom_backup/ --folders Android Documentos Downloads Imagens Música ProgramasRFB Softwares VMs Workspace Podcasts Vídeos .local/share/Steam .local/share/Zeal/Zeal/docsets .PlayOnLinux/wineprefix/ .pyenv .ssh .receitanet --files .agignore .bash_aliases .bash_profile .ctags .gitconfig --enable_all --exclude *~ *pyc argparse sys .fuse* *swp'

# Alias sync "WD My Passport Ultra External" to "Desktop (running Fedora)"
alias wd_to_fedora_desktop='rsync.py --origin /run/media/marlom/marlom_backup/ --dest ~/ --folders Android Documentos Downloads Imagens Música ProgramasRFB Softwares VMs Workspace Podcasts Vídeos .local/share/Steam .local/share/Zeal/Zeal/docsets .PlayOnLinux/wineprefix/ .pyenv .ssh .receitanet --files .agignore .bash_aliases .bash_profile .ctags .gitconfig --enable_all --exclude *~ *pyc argparse sys .fuse* *swp'
