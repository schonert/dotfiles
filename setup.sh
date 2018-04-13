#!/bin/bash
# Simple setup for new machines - comes with a default Frontend/Design stack

# Git
GIT_EMAIL="sh@schonert.dk"
GIT_NAME="Stefan Schonert"

# SSH KEY
SSH_EXT=".pub"
SSH_FILE=~/.ssh/id_rsa
SSH_PUBLIC=$SSH_FILE$SSH_EXT
SSH_CONFIG_FILE=~/.ssh/config

# Symbolic files
SYM_FILES=( .vimrc .bashrc .zshrc .tmux.conf )

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew apps
brew install node git yarn rbenv ruby-build wp-cli composer php imagemagick

# Casks
brew cask install Google-chrome sourcetree iterm2 firefox postico iconjar postgres slack spotify sketch sequel-pro insomnia craftmanager adobe-creative-cloud spectacle

# GIT!
echo ""
echo "Fancy git colors"
git config --global color.ui true
echo ""

echo "git email $GIT_EMAIL"
git config --global user.email $GIT_EMAIL
echo ""

echo "git name $GIT_NAME"
git config --global user.name $GIT_NAME
echo ""

# SSH!
echo ""
echo "New ssh key coming up!"
echo ""

ssh-keygen -t rsa -f $SSH_FILE -q -b 4096 -C "$GIT_EMAIL"
cat $SSH_PUBLIC 
pbcopy < $SSH_PUBLIC

echo ""
echo "Copied and ready to go!"
echo "Head to https://github.com/settings/keys and add it!"

echo ""
echo "New SSH config"
echo ""
echo $SSH_CONFIG

cat > SSH_CONFIG <<EOF
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile $SSH_FILE
EOF


echo ""
echo ""
echo "Firing up a SSH Agent..."
echo ""
eval "$(ssh-agent -s)"
ssh-add -K $SSH_FILE

# Dotfiles
echo ""
echo ""
echo "Let's go ahead and fetch your dotfiles"
echo ""

cd ~/
git clone https://github.com/schonert/dotfiles.git .dotfiles

echo "Creating sym links from your dotfiles"
echo ""
echo ""
for file in ${SYM_FILES[*]}
do
	DOT=~/.dotfiles/$file
	SYM=~/$file
	echo "$DOT	<- 	$SYM"
	ln -s $DOT $SYM
done
exit

echo ""
echo ""
echo "We're all done here!"

