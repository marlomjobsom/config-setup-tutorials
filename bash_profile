# ANDROID_HOME
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/tools/bin
export PATH=${PATH}:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_HOME/build-tools/23.0.3

# AUTOJUMP
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

# PYENV
export PATH="$HOME/.pyenv/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
eval "$(pyenv init -)"

# FZF
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_DEFAULT_COMMAND="ag --ignore '*.pyc' --ignore '*.swp' --ignore '~*' --ignore 'node_modules' --ignore 'build' -g ''"

# JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"

# GOPATH
export GOROOT=/opt/go
export GOPATH=$HOME/Workspace/golang
export PATH=$PATH:$PATH:$GOROOT/bin:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# JPF
export JPF_ROOT="$HOME/Workspace/cin-master-degree/code/jpf"
export JPF_CORE=$JPF_ROOT/jpf-core
