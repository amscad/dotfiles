# Borrowed from fatih's scripts for his iPad set up with digital ocean
# from here: https://github.com/fatih/dotfiles/blob/master/workstation/bootstrap.sh
#! /bin/bash

UPGRADE_PACKAGES=${1:-none}

if [ "${UPGRADE_PACKAGES}" != "none" ]; then
  echo "==> Updating and upgrading packages ..."

  # Add third party repositories
  sudo add-apt-repository ppa:keithw/mosh-dev -y
  sudo add-apt-repository ppa:jonathonf/vim -y

  sudo apt-get update
  sudo apt-get upgrade -y
fi

sudo apt-get install  \
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

# install Go
if ! [ -x "$(command -v go)" ]; then
  export GO_VERSION="1.13.1"
  wget "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" 
  tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz" 
  rm -f "go${GO_VERSION}.linux-amd64.tar.gz"
  export PATH="/usr/local/go/bin:$PATH"
fi

if [ ! -d "$(go env GOPATH)" ]; then
  echo " ==> Installing Go tools"
  # vim-go tooling
  go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct #refactoring
  go get -u -v github.com/mdempsky/gocode           #autocomplete for go code
  go get -u -v github.com/rogpeppe/godef            #find location in source code
  go get -u -v github.com/zmb3/gogetdoc             #retrive documentation for go code
  go get -u -v golang.org/x/tools/cmd/goimports     #format code and optimize imports
  go get -u -v golang.org/x/tools/cmd/gorename
  go get -u -v golang.org/x/tools/cmd/guru
  go get -u -v golang.org/x/tools/cmd/gopls
  go get -u -v golang.org/x/lint/golint
  go get -u -v github.com/josharian/impl            #generate method stubs for implementing an interface
  go get -u -v honnef.co/go/tools/cmd/keyify
  go get -u -v github.com/fatih/gomodifytags        #modify/update tags in structs
  go get -u -v github.com/fatih/motion              #provide info to editors for nav
  go get -u -v github.com/koron/iferr

  # generic
  go get -u -v github.com/aybabtme/humanlog/cmd/...
  go get -u -v github.com/fatih/hclfmt

  export GIT_TAG="v1.2.0" 
  go get -d -u github.com/golang/protobuf/protoc-gen-go 
  git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $GIT_TAG 
  go install github.com/golang/protobuf/protoc-gen-go

  cp -r $(go env GOPATH)/bin/* /usr/local/bin/
fi

if ! [ -x "$(command -v snap list hub)" ]; then
 sudo snap install hub --classic
 echo "installing github command line client"
else
 echo "checking for a refreshed version of hub"
 sudo snap refresh hub --clasic
 echo "hub may, or may not have been updated.  read the output message"
fi

if ! [ -x "$(command -v snap list ripgrep)" ]; then
  sudo snap install ripgrep --classic
  echo "installing ripgrep commad line client"
else
  echo "checking for a refreshed version of ripgrep"
  sudo snap refresh ripgrep --classic
  echo "ripgrep may, or may not have been updated. read the output messages"
fi

<<<<<<< HEAD
sudo apt-get install -y apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This should install mosh!</p>
</body></html>
=======
if ! [ -x "$(command -v hub)" ]; then
 sudo snap install google-cloud-sdk --classic
fi

if [ ! -d "${HOME}/.fzf" ]; then
  echo " ==> Installing fzf"
  git clone https://github.com/junegunn/fzf "${HOME}/.fzf"
  pushd "${HOME}/.fzf"
  git remote set-url origin git@github.com:junegunn/fzf.git 
  ${HOME}/.fzf/install --bin --64 --no-bash --no-zsh --no-fish
  popd
fi
>>>>>>> b565d4e9173feba6e3803051dc8014808a9a4395
