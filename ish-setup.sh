# standard tools
apk add python3 \
  	ruby \
	vim \
	git \
	neovim \
	openssh \
	curl \
	mosh \
	gawk \
	tmux \
	zsh \
	sqlite \
	jq \
	mosh \
	man

# google cloud shell
# but only if it has not already been downloaded
if [ ! -f "$HOME/google-cloud-sdk.tar.gz" ]; then
#wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.0-linux-x86_64.tar.gz
	curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.0-linux-x86_64.tar.gz -o $HOME/google-cloud-sdk.tar.gz
fi

# install ohmyzsh - a useful set of tools for zsh
# but only if it has not been installed already
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

