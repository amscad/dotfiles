#! /bin/bash
echo "==> Updating and upgrading packages ..."

Add third party repositories
add-apt-repository ppa:keithw/mosh-dev -y
add-apt-repository ppa:jonathonf/vim -y

apt-get update
apt-get upgrade -y

sudo apt-get install -qq \
  apache2 \
  build-essential \
  cmake \
  curl \
  gdb \
  git \
  hugo \
  jq \
  mosh \
  openssh-server \
  python3 \
  python3-dev \
  python3-flake8 \
  python3-pip \
  python3-setuptools \
  python3-venv \
  python3-wheel \
  silversearcher-ag \
  tmux \
  tree \
  unzip \
  wget \
  --no-install-recommends


cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This should install mosh!</p>
</body></html>
EOF
