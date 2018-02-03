export PATH=${PATH}:$HOME/Android/Sdk/tools
export PATH=${PATH}:$HOME/Android/Sdk/tools/bin
export PATH=${PATH}:$HOME/Android/Sdk/platform-tools
export PATH=${PATH}:$HOME/Android/Sdk/build-tools/23.0.3

# autojump
# . /usr/share/autojump/autojump.sh
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_DEFAULT_COMMAND='ag -p $HOME/.agignore -g ""'

# JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"
