cd ~

ln -s .dotfiles/.nvimrc ~/.nvimrc
ln -s .dotfiles/.nvim ~/.nvim

cd .dotfiles

#Install youcompleteme
cd .nvim/bundle/youcompleteme/

./install.sh --clang-completer
