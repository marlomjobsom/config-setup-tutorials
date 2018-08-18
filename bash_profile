# ANDROIDPATH
export PATH=${PATH}:$HOME/Android/Sdk/tools
export PATH=${PATH}:$HOME/Android/Sdk/tools/bin
export PATH=${PATH}:$HOME/Android/Sdk/platform-tools
export PATH=${PATH}:$HOME/Android/Sdk/build-tools/23.0.3

# AUTOJUMP
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

# PYENV
export PATH="$HOME/.pyenv/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_DEFAULT_COMMAND='ag -p $HOME/.agignore -g ""'

# JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"

# GOPATH
export GOROOT=/opt/go
export GOPATH=$HOME/Workspace/golang/src
export PATH=$PATH:$PATH:$GOROOT/bin:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
