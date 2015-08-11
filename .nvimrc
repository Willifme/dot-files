filetype off
" Add FZF to the run time path
set rtp+=~/.fzf
" Let Plug manage Plug, required
call plug#begin('~/.dotfiles/.nvim/plugged')
" Require go-mode
Plug 'fatih/vim-go'
" Require Youleader-*ompleteMe
Plug 'valloric/youcompleteme'
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
" Require colour scheme
Plug 'ajh17/Spacegray.vim'
" Require Rails intergration for vim
Plug 'tpope/vim-rails'
" Require Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Require Elixir support    
Plug 'elixir-lang/vim-elixir'
" Require JSX support
Plug 'mxw/vim-jsx'
" Require Elm support for vim
Plug 'lambdatoast/elm.vim'
" Require support for Slim templating
Plug 'slim-template/vim-slim'
" Require FZF for fuzzy matching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" Require vim-surrond for surronding things
Plug 'tpope/vim-surround'
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
" Set tabs to be 2 spaces for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
" Exit insert mode quicker (Escape time out)
set nottimeout
" Enable syntax highlighting
syntax on
" Disable the creation of swap-files
set swapfile
" Let vim-go error fail silently
let g:go_fmt_fail_silently = 1
" Use the system clipboard instead of the vim one
set clipboard=unnamed,unnamedplus
" Use the semicolon for the colon - this should be quicker
nnoremap ; :
" When hitting Ctrl-P run :FZF
nnoremap <C-p> :FZF<CR> 
" Switch between buffers easily
nnoremap <S-n> :bprevious<CR>
nnoremap <S-m> :bprevious<CR>
" Easier buffer switching
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
" Easier buffer switching in terminal
tnoremap <S-h> <C-\><C-n><C-w>h
tnoremap <S-j> <C-\><C-n><C-w>j
tnoremap <S-k> <C-\><C-n><C-w>k
tnoremap <S-l> <C-\><C-n><C-w>l
" Exit from terminal mode easily
tnoremap <Esc> <C-\><C-n>    
" The terminal buffer should now remain when going between buffers
autocmd TermOpen * set bufhidden=hide
" Use rubocop for Ruby syntax checking
let g:syntastic_ruby_checkers = ["rubocop"]
" Quick escape exit for neovim
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
