#! /bin/bash
echo "==> Updating and upgrading packages ..."

#Add third party repositories
add-apt-repository ppa:keithw/mosh-dev -y
add-apt-repository ppa:jonathonf/vim -y

add-apt-repository ppa:longsleep/golang-backports -y

apt-get update
apt-get upgrade -y

sudo apt-get install -qq \
  build-essential \
  cmake \
  curl \
  docker \
  gdb \
  git \
  hugo \
  jq \
  mosh \
  nodejs \
  npm \
  openssh-server \
  python3 \
  python3-dev \
  python3-flake8 \
  python3-pip \
  python3-setuptools \
  python3-venv \
  python3-wheel \
  ruby \
  silversearcher-ag \
  tmux \
  tree \
  unzip \
  wget \
  zsh \
  --no-install-recommends

# install ohmyzsh - a useful set of tools for zsh
# but only if it has not been installed already
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp zshrc $HOME/.zshrc
fi

# copy custom themes and plugins to .oh-my-zsh, if it has been installed
if [ -d "$HOME/.oh-my-zsh" ]; then
	cp -r $HOME/dotfiles/ohmyzsh/custom $HOME/.oh-my-zsh
        cp $HOME/dotfiles/zshrc $HOME/.zshrc
        source $HOME/.zshrc
fi

# for current logged user
sudo chsh -s /bin/zsh "$USER"

# google cloud shell
# but only if it has not already been downloaded
if [ ! -f "$HOME/google-cloud-sdk.tar.gz" ]; then
#wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.0-linux-x86_64.tar.gz
	curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.0-linux-x86_64.tar.gz -o $HOME/google-cloud-sdk.tar.gz
	tar -zxvf $HOME/google-cloud-sdk.tar.gz  $HOME/google-cloud-sdk
fi

# neovim, using a "common" linux image
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage

# install golang using the ppa
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-go
