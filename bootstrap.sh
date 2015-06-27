cd ~

#git clone https://github.com/gmarik/Vundle.vim.git ~/.dotfiles/.nvim/bundle/Vundle.vim

rm -r .nvimrc
rm .nvim
rm .tmux.conf

ln -s .dotfiles/.nvimrc ~/.nvimrc
ln -s .dotfiles/.nvim ~/.nvim
ln -s .dotfiles/.tmux.conf ~/.tmux.conf

cd .dotfiles

#Install youcompleteme
cd .nvim/bundle/youcompleteme/

#./install.sh --clang-completer
