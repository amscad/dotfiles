# copy custom themes and plugins to .oh-my-zsh, if it has been installed
if [ -d "$HOME/.oh-my-zsh" ]; then
	cp -r ohmyzsh/custom $HOME/.oh-my-zsh
fi
