# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/sschonert/.oh-my-zsh

EDITOR=vim
export EDITOR=vim
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias t='tmux'
alias tx='tmuxinator'

alias Sites='cd ~/Sites/'
alias SD='cd ~/Sites/dashboard'
alias SA='cd ~/Sites/api'
alias IO='cd ~/Sites/website/wp-content/themes/statum.io'
alias PI='cd ~/Sites/pixify'

alias restartPostgres='rm -f /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'
alias killRails='pkill -f ruby && pkill -f spring'

#
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export PATH="$PATH:$HOME/.rvm/bin"
GOPATH=$HOME/.go

export PATH=$PATH:$(go env GOPATH)/bin
alias lg='lazygit'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/
export SPARK_HOME=/Users/sschonert/server/spark-2.3.0-bin-hadoop2.7
export SBT_HOME=/Users/sschonert/server/sbt
export SCALA_HOME=/Users/sschonert/server/scala-2.11.12
export PATH=$JAVA_HOME/bin:$SBT_HOME/bin:$SBT_HOME/lib:$SCALA_HOME/bin:$SCALA_HOME/lib:$PATH
export PATH=$JAVA_HOME/bin:$SPARK_HOME:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
export PYSPARK_PYTHON=python3


PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export TERM="xterm-256color"
