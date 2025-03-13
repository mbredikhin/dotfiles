#!/usr/bin/env bash

set -e

# SCRIPT_DIR="$(dirname "$0")"

case $OSTYPE in
linux*)
	add-apt-repository -y ppa:neovim-ppa/stable
	apt update
	apt install -yy zsh tmux htop git git-delta neovim make fd ripgrep fzf bat tldr httpie jq

	chsh -s /bin/zsh

	update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
  apt install -yy shellcheck
	ln -snf .tmux.conf ~/.tmux.conf
	;;

darwin*)
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"

	yes | brew install htop git git-delta neovim fd ripgrep fzf bat tldr httpie jq
	;;
*)
	echo 'Everything is ready. Go to the next step'
	;;
esac


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
sed -i'.bak' 's/^plugins=.*$/plugins=(git)/' ~/.zshrc
sed -i'.bak' 's/^ZSH_THEME=.*$/ZSH_THEME="robbyrussell"/' ~/.zshrc

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | zsh
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo 'export BAT_THEME="gruvbox-dark"' >> ~/.zshrc

ln -snf .gitconfig ~/.gitconfig
ln -snf .aliases ~/.aliases
echo "source ~/.aliases" >> ~/.zshrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
