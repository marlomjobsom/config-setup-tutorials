# Alias sync "WD My Passport Ultra External" to "Inspiron 7460"
alias wd_to_inspiron='pyrsync --origin /media/marlom/marlom_backup/ --dest ~/ --folders Android Áudiolivros Documentos Downloads Imagens Música ProgramasRFB Softwares "VirtualBox VMs" Workspace Vídeos .steam .local/share/Zeal/Zeal/docsets .PlayOnLinux/wineprefix/ .pyenv .ssh .receitanet --files .agignore .bash_aliases .bash_profile .ctags .gitconfig --enable_all --exclude *~ *pyc argparse sys .fuse* *swp'

# Alias sync "Inspiron 7460" to "WD My Passport Ultra External"
alias inspiron_to_wd='pyrsync --origin ~/ --dest /media/marlom/marlom_backup/ --folders Android Áudiolivros Documentos Downloads Imagens Música ProgramasRFB Softwares "VirtualBox VMs" Workspace Vídeos .steam .local/share/Zeal/Zeal/docsets .PlayOnLinux/wineprefix/ .pyenv .ssh .receitanet --files .bash_aliases .bash_profile .ctags .gitconfig --enable_all --exclude *~ *pyc argparse sys .fuse* *swp'

# Alias to run warsaw docker image that allows Internet Baking on Banco do Brasil
alias docker_bb='docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Documentos/Outros/ArquivosDoBanco:/home/bank/Downloads -e DISPLAY=unix$DISPLAY --shm-size 2g --name warsaw-browser lichti/warsaw-browser bb'
