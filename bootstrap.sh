cd ~

#git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/.nvim/bundle/Vundle.vim

rm -r .nvimrc
rm .nvim

ln -s .dotfiles/.nvimrc ~/.nvimrc
ln -s .dotfiles/.nvim ~/.nvim

cd .dotfiles

#Install youcompleteme
cd .nvim/bundle/youcompleteme/

#./install.sh --clang-completer
