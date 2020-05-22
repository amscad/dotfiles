# copy custom themes and plugins to .oh-my-zsh, if it has been installed
if [ -d "$HOME/.oh-my-zsh" ]; then
  SCRIPT_DIR="${PWD}"
  printf '%s\n' "$SCRIPT_DIR"

  cp -r "$SCRIPT_DIR/ohmyzsh/custom" $HOME/.oh-my-zsh
  cp $SCRIPT_DIR/zshrc $HOME/.zshrc
  source $HOME/.zshrc
fi
