" Be iMproved, required
set nocompatible
filetype off
" Let Plug manage Plug, required
call plug#begin('~/.dotfiles/.nvim/plugged')
" Require go-mode
Plug 'fatih/vim-go'
" Require Youleader-*ompleteMe
Plug 'valloric/youcompleteme'
" Require ctrlp
Plug 'kien/ctrlp.vim'
" Require vim-javascript (Better javascript mode)
Plug 'pangloss/vim-javascript'
" Require Nerdtree for a file tree
Plug 'scrooloose/nerdtree'
" Require Rust.vim for Rust support
Plug 'wting/rust.vim'
" Require Tabular
Plug 'godlygeek/tabular'
" Require Markdown mode
Plug 'plasticboy/vim-markdown'
" Require coffeescript mode
Plug 'vim-coffee-script'
" Require syntastic
Plug 'scrooloose/syntastic'
" Require numbers.vim - better line numbers
Plug 'myusuf3/numbers.vim'
" Require vim-tmux-navigator - Better switching between vim splits and tmux
" panes
Plug 'christoomey/vim-tmux-navigator'
" Colour scheme
Plug 'ajh17/Spacegray.vim'
" Rails intergration for vim
Plug 'tpope/vim-rails'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Elixir support    
Plug 'elixir-lang/vim-elixir'
" JSX support
Plug 'mxw/vim-jsx'
" Slime like tmux
Plug 'epeli/slimux'
" Elm support for vim
Plug 'lambdatoast/elm.vim'
" All of the Plugs must be added before the following line
call plug#end()
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
" Enable syntax highlighting
syntax on
" Disable the creation of swap-files
set swapfile
" Change Ctrl-P to search Files, Buffers and MRU files at one
let g:ctrlp_cmd = 'CtrlPMixed'
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
