#! /bin/bash
echo "==> Updating and upgrading packages ..."

#Add third party repositories
add-apt-repository ppa:keithw/mosh-dev -y
add-apt-repository ppa:jonathonf/vim -y

add-apt-repository ppa:longsleep/golang-backports -y


apt-get update
apt-get upgrade -y

sudo apt-get install -qq \
  apache2 \
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


cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This should install mosh!</p>
</body></html>
EOF

sh -c "$(curl -fsSL https://raw.githubusercontent.com/amscad/ohmyzsh/master/tools/install.sh)"

# for current logged user
sudo chsh -s /bin/zsh "$USER"


# neovim, using a "common" linux image
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage

# install golang using the ppa
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-go
