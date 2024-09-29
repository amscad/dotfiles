# required
if [ -f ~/.config/nvim ]; then
    rm ~/.config/nvim
elif [ ! -d ~/.config/nvim ]; then
    mv ~/.config/nvim{,.bak}
fi 

# optional but recommended
if [ ! -d ~/.local/share/nvim ]; then
    mv ~/.local/share/nvim{,.bak}
fi 
if [ ! -d ~/.local/state/nvim ]; then
    mv ~/.local/state/nvim{,.bak}
fi 
if [ ! -d ~/.cache/nvim ]; then
    mv ~/.cache/nvim{,.bak}
fi 

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git
