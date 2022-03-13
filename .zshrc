EDITOR=code
ZSH_THEME="candy"
plugins=(git)

alias restartPostgres='rm -f /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'
alias lg="lazygit"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

export EDITOR=code
export SSH_KEY_PATH="~/.ssh/rsa_id"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $(brew --prefix)/share/antigen/antigen.zsh

# https://github.com/postmodern/chruby
source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh

antigen use oh-my-zsh
antigen bundle tylerreckart/hyperzsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git

antigen apply