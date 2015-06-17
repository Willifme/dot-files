" Be iMproved, required
set nocompatible
filetype off
" Set the runtime path to include Vundle and initialise
set rtp+=~/.nvim/bundle/Vundle.vim
" Let Vundle manage Vundle, required
call vundle#begin()
" Set Vundle location to be different to that of the Vim one
call vundle#rc("~/.nvim/bundle/")
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Require go-mode
Plugin 'fatih/vim-go'
" Require Youleader-*ompleteMe
Plugin 'valloric/youcompleteme'
" Require ctrlp
Plugin 'kien/ctrlp.vim'
" Require vim-javascript (Better javascript mode)
Plugin 'pangloss/vim-javascript'
" Require Nerdtree for a file tree
Plugin 'scrooloose/nerdtree'
" Require Rust.vim for Rust support
Plugin 'wting/rust.vim'
" Require Tabular
Plugin 'godlygeek/tabular'
" Require Markdown mode
Plugin 'plasticboy/vim-markdown'
" Require coffeescript mode
Plugin 'vim-coffee-script'
" Require syntastic
Plugin 'scrooloose/syntastic'
" Require numbers.vim - better line numbers
Plugin 'myusuf3/numbers.vim'
" Require vim-tmux-navigator. (Better switching between vim splits and tmux
" panes)
Plugin 'christoomey/vim-tmux-navigator'
" Colour scheme
Plugin 'ajh17/Spacegray.vim'
" Rails intergration for vim
Plugin 'tpope/vim-rails'
" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Elixir support    
Plugin 'elixir-lang/vim-elixir'
" JSX support
Plugin 'mxw/vim-jsx'
" All of the Plugins must be added before the following line
call vundle#end()
" This does a thing but is required
filetype plugin indent on
set background=dark
" Set colourscheme
colorscheme spacegray
" Enable line numbers
set number
" Enable UTF-8
set encoding=utf-8
" Set tab width
set tabstop=4
set shiftwidth=4
set expandtab
" Exit insert mode quicker (Escape time out)
set nottimeout
" Enable syntax
syntax on
" Disable the creation of swap-files
set swapfile
"Easier buffer switching
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
" Easier buffer switching in terminal
tnoremap <S-h> <C-\><C-n><C-w>h
tnoremap <S-j> <C-\><C-n><C-w>j
tnoremap <S-k> <C-\><C-n><C-w>k
tnoremap <S-l> <C-\><C-n><C-w>l
" Quick escape exit for neovim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
