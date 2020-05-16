# install linux brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install dependencies

# For Debian, Ubuntu, etc.
    sudo apt-get install build-essential
# Fedora, Red Hat, CentOS, etc.
    sudo yum groupinstall 'Development Tools'

# Configure Homebrew in your /home/pi/.zprofile by running
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/pi/.zprofile
