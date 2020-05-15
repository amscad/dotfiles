sudo apt-get install git -y
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y
mkdir -p ${HOME}/projects
cd ${HOME}/projects
git clone https://github.com/neovim/neovim.git 
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
