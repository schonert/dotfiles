EDITOR=code
ZSH_THEME="candy"
plugins=(git)

alias Sites='cd ~/Sites/'
alias restartPostgres='rm -f /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'

alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# add yarn global
export PATH="$PATH:$(yarn global bin)"

export ZSH=/Users/sschonert/.oh-my-zsh

export EDITOR=code
export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/antigen/antigen.zsh

# https://github.com/postmodern/chruby
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh

antigen bundle tylerreckart/hyperzsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git

antigen apply