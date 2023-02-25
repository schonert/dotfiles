EDITOR=code
ZSH_THEME="candy"

alias lg="lazygit"
alias ld="lazydocker"
alias P="~/Projects"
alias PI="~/Projects/pixify"
alias PIX="~/Projects/pixify/pixify"


alias restartPostgres='rm -f /usr/local/var/postgres/postmaster.pid && brew services restart postgresql@14'
alias restartTouchbar="sudo pkill TouchBarServer;sudo killall \"ControlStrip\";"
alias restartTunnel="
	sudo launchctl stop com.cloudflare.cloudflared
	sudo launchctl start com.cloudflare.cloudflared
"
alias fixRubocop="
	rubocop-daemon stop
	sudo rm -rf /Users/stefanschonert/.asdf/installs/ruby/3.0.4/bin/rubocop
	sudo rm -rf /usr/local/bin/rubocop-daemon-wrapper

	gem install rubocop

	curl https://raw.githubusercontent.com/fohte/rubocop-daemon/master/bin/rubocop-daemon-wrapper -o /tmp/rubocop-daemon-wrapper
	sudo mkdir -p /usr/local/bin/rubocop-daemon-wrapper
	sudo mv /tmp/rubocop-daemon-wrapper /usr/local/bin/rubocop-daemon-wrapper/rubocop
	sudo chmod +x /usr/local/bin/rubocop-daemon-wrapper/rubocop
	ln -fs /usr/local/bin/rubocop-daemon-wrapper/rubocop $(asdf which rubocop)
	rubocop-daemon start
"

# Variables
export EDITOR=code
export ZSH="$HOME/.oh-my-zsh"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export NVM_DIR="$HOME/.nvm"

export OVERMIND_DAEMONIZE=1

# Ruby compilation flags
export CFLAGS="-Wno-error=implicit-function-declaration"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline)"

# Rubocop daemon related
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"
export RUBOCOP_DAEMON_USE_BUNDLER=true

# Setup nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$(brew --prefix bison@2.7)/bin:$PATH"

# Python
## pipx
export PATH=$HOME/.local/bin:$PATH

## pyenv 
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

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

# Created by `pipx` on 2022-03-19 14:14:54
export PATH="$PATH:/Users/stefanschonert/"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/stefanschonert/.bun/_bun" ] && source "/Users/stefanschonert/.bun/_bun"
