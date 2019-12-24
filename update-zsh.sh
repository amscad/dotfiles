# copy custom themes and plugins to .oh-my-zsh, if it has been installed
if [ -d "$HOME/.oh-my-zsh" ]; then
	cp -r $HOME/dotfile/ohmyzsh/custom $HOME/.oh-my-zsh
        cp $HOME/dotfiles/zshrc $HOME/.zshrc
        source $HOME/.zshrc
fi
