EDITOR=code
ZSH_THEME="candy"

alias lg="lazygit"
alias ld="lazydocker"
alias P="~/Projects"

# Variables
export EDITOR=cursor
export ZSH="$HOME/.oh-my-zsh"

export OVERMIND_DAEMONIZE=1

# Ruby compilation flags
export CFLAGS="-Wno-error=implicit-function-declaration"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline)"

# AWS
## EB CLI
export PATH=$HOME/.ebcli-virtual-env/executables:$PATH

source $(brew --prefix asdf)/libexec/asdf.sh
source $(brew --prefix)/share/antigen/antigen.zsh

# Plugins
plugin=(git asdf)

antigen use oh-my-zsh
antigen bundle tylerreckart/hyperzsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply
