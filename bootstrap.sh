# Borrowed from fatih's scripts for his iPad set up with digital ocean
# from here: https://github.com/fatih/dotfiles/blob/master/workstation/bootstrap.sh

UPGRADE_PACKAGES=${1:-none}

if [ "${UPGRADE_PACKAGES}" != "none" ]; then
  echo "==> Updating and upgrading packages ..."

  # Add third party repositories
  sudo add-apt-repository ppa:keithw/mosh-dev -y
  sudo add-apt-repository ppa:jonathonf/vim -y

  CLOUD_SDK_SOURCE="/etc/apt/sources.list.d/google-cloud-sdk.list"
  CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
  if [ ! -f "${CLOUD_SDK_SOURCE}" ]; then
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a ${CLOUD_SDK_SOURCE}
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  fi

  sudo apt-get update
  sudo apt-get upgrade -y
fi<

sudo apt-get install --qq \
  build-essential \
  curl \
  docker.io \
  gdb \
  git \
  google-cloud-sdk \
  google-cloud-sdk-app-engine-go \
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
  ripgrep \
  silversearcher-ag \
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

#sudo apt install openjdk-8-jdk

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

#install commandline tools for github
if ! [ -x "$(command -v hub)" ]; then
  echo " ==> Installing hub .."
  export HUB_VERSION="2.12.3"
  wget https://github.com/github/hub/releases/download/v${HUB_VERSION}/hub-linux-amd64-${HUB_VERSION}.tgz
  tar xf hub-linux-amd64-${HUB_VERSION}.tgz
  chmod +x hub-linux-amd64-${HUB_VERSION}/bin/hub
  cp hub-linux-amd64-${HUB_VERSION}/bin/hub /usr/local/bin
  rm -rf hub-linux-amd64-${HUB_VERSION}
  rm -f hub-linux-amd64-${HUB_VERSION}.tgz*
fi

# command line fuzzy finder
if [ ! -d "${HOME}/.fzf" ]; then
  echo " ==> Installing fzf"
  git clone https://github.com/junegunn/fzf "${HOME}/.fzf"
  pushd "${HOME}/.fzf"
  git remote set-url origin git@github.com:junegunn/fzf.git 
  ${HOME}/.fzf/install --bin --64 --no-bash --no-zsh --no-fish
  popd
fi
