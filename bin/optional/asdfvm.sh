#!/bin/bash

START_TIME=$(date +"%T")

# Get the script path - used to include other files
SCRIPT_PATH=$(dirname "$(
	cd "${0%/*}" 2>/dev/null
	echo "$PWD"/"${0##*/}"
)")

###################################[ version manager ]########################
# # add asdf if it hasnt been added through homebrew
# echo "Configuring asdf version manager..."
# if [ ! -d "$HOME/.asdf" ]; then
#   git clone https://github.com/asdf-vm/asdf.git ~/.asdf 
#   append_to_zshrc "source $HOME/.asdf/asdf.sh" 1
#   append_to_zshrc "source $HOME/.asdf/completions/asdf.bash" 1
# fi


install_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  fi
}

# shellcheck disable=SC1090
# source "$HOME/.asdf/asdf.sh"
install_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
#install_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"

# install_asdf_plugin "java" "https://github.com/halcyon/asdf-java.git"
# install_asdf_plugin "maven" "https://github.com/halcyon/asdf-maven"
install_asdf_plugin "python" "https://github.com/danhper/asdf-python"
#install_asdf_plugin "flutter" "https://github.com/oae/asdf-flutter.git"
#install_asdf_plugin "dart" "https://github.com/patoconnor43/asdf-dart.git"

install_asdf_language() {
  local language="$1"
  local version="$2"
  if [ "$version" == "latest" ]; then
    version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"
  fi
  
  echo "Installing $language $version"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

echo "Installing node"
install_asdf_language "nodejs" "latest:20"

# echo "Installing Java 8"
# install_asdf_language "java" "latest:zulu-8"

# echo "Installing Java 11"
# install_asdf_language "java" "latest:zulu-11"

# echo "Installing Java 17"
# install_asdf_language "java" "latest:zulu-17"

# echo "Installing Java latest"
# install_asdf_language "java" "latest:zulu"

# echo "Installing latest Maven"
# install_asdf_language "maven" "latest"

echo "Installing latest python"
install_asdf_language "python" "latest"