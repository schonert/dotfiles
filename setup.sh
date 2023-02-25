#!/bin/bash

# Git
GIT_EMAIL="sh@schonert.dk"
GIT_NAME="Stefan Schonert"

# SSH KEY
GITHUB_SSH_FILE=~/.ssh/id_rsa_github
GITHUB_SSH_PUBLIC="${GITHUB_SSH_FILE}.pub"
SSH_CONFIG_FILE=~/.ssh/config

# Symbolic files
SYM_FILES=( .vimrc .bashrc .zshrc .tmux.conf .gitignore Brewfile )

function main() {

	# Dotfiles
	create_symlinks

	# Install homebrew
	if ! command -v brew &> /dev/null; then
		install_brew
	fi

	install_programs

	setup_git

	# SSH
	echo $GITHUB_SSH_PUBLIC
	echo $GITHUB_SSH_FILE
	if ! test -f $GITHUB_SSH_PUBLIC; then
		setup_github_ssh
	fi

	if ! test -f $SSH_CONFIG_FILE; then
		create_ssh_config
	fi

	ensure_ssh_agent

	if ! command -v zsh &> /dev/null; then
		install_zsh
	fi

	set_defaults

	setup_asdf

	echo "We're all done here!"
}

# Stolen from https://stackoverflow.com/a/48509425
function ensure_ssh_agent() {
	# Ensure agent is running
	ssh-add -l &>/dev/null

	if [ "$?" == 2 ]; then
		# Could not open a connection to your authentication agent.

		# Load stored agent connection info.
		test -r ~/.ssh-agent && \
			eval "$(<~/.ssh-agent)" >/dev/null

		ssh-add -l &>/dev/null
		if [ "$?" == 2 ]; then
			# Start agent and store agent connection info.
			(umask 066; ssh-agent > ~/.ssh-agent)
			eval "$(<~/.ssh-agent)" >/dev/null
		fi
	fi

	# Load identities
	ssh-add -l &>/dev/null
	if [ "$?" == 1 ]; then
		echo "Loading identities to ssh agent"
		ssh-add $GITHUB_SSH_FILE
	fi
}

function setup_git() {
	# GIT
	git config --global color.ui true
	echo "git colors enabled"

	git config --global user.email $GIT_EMAIL
	echo "git email $GIT_EMAIL"

	git config --global user.name $GIT_NAME
	echo "git name $GIT_NAME"
}

function setup_github_ssh() {
	echo "Creating new SSH key"
	ssh-keygen -q -t ed25519 -f $GITHUB_SSH_FILE -C "$GIT_EMAIL"
	cat $GITHUB_SSH_PUBLIC
	pbcopy < $GITHUB_SSH_PUBLIC

	echo "Copied and ready to go!"
	echo "Head to https://github.com/settings/keys and add it!"
}

function create_ssh_config() {
	echo "New SSH config"
	echo $SSH_CONFIG_FILE

cat > $SSH_CONFIG_FILE <<EOF
Host github.com
 IgnoreUnknown AddKeysToAgent,UseKeychain
 AddKeysToAgent yes
 UseKeychain yes
 PreferredAuthentications publickey
 IdentityFile $GITHUB_SSH_FILE
EOF
}

function create_symlinks() {
	echo "Creating sym links from your dotfiles"
	for file in ${SYM_FILES[*]}; do
		DOT=~/.dotfiles/$file
		SYM=~/$file
		echo "$DOT	-> 	$SYM"
		ln -sfn $DOT $SYM
	done
}

function install_brew() {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_zsh() {
	echo "Setting up ZSH!"
	sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
}

function install_programs() {
	brew tap Homebrew/bundle
	brew install mas
	brew bundle

	npm install -G xbuild fkill-cli
}

function set_defaults() {
	# Avoid press and hold in vs code
	defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}

function setup_asdf() {
	asdf plugin add ruby
	asdf install ruby latest
	asdf global ruby latest

	asdf plugin add nodejs
	asdf install nodejs latest
	asdf global nodejs latest

}

main "$@"
exit
