filetype off
" Let Plug manage Plug, required
call plug#begin('~/.config/nvim/plugged')
" Require YouCompleteMe
Plug 'valloric/youcompleteme'
" Require Rust.vim for Rust support
Plug 'wting/rust.vim'
" Require numbers.vim - better line numbers
Plug 'myusuf3/numbers.vim'
" Require colour scheme
Plug 'ajh17/Spacegray.vim'
" Require Multiple cursors
"Plug 'terryma/vim-multiple-cursors'
" Require vim-surrond for surronding things
Plug 'tpope/vim-surround'
" Require syntastic
Plug 'scrooloose/syntastic'
" Require jedi-vim - Python autocomplete
"Plug 'davidhalter/jedi-vim'
" Require ctrlp.vim - Quick file switching
Plug 'ctrlpvim/ctrlp.vim'
" Require vim-proc for ghcmod-vim
Plug 'Shougo/vimproc.vim'
" Require ghcmod-vim for haskell linting etc
Plug 'eagletmt/ghcmod-vim'
" Require neco-ghc for ghc auto-completion
Plug 'eagletmt/neco-ghc'
" Require haskell-vim for better support for Haskell 
"Plug 'neovimhaskell/haskell-vim'
" Require vim-stylish-haskell to format Haskell source code upon save of a
" Haskell file
Plug 'nbouscal/vim-stylish-haskell'
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
" Use the semicolon for the colon - this should be quicker
nnoremap ; :
" Switch between buffers easily
nnoremap <S-n> :bprevious<CR>
nnoremap <S-m> :bprevious<CR>
" Easier buffer switching
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
" Easier buffer switching in terminal
"tnoremap <S-h> <C-\><C-n><C-w>h
"tnoremap <S-j> <C-\><C-n><C-w>j
"tnoremap <S-k> <C-\><C-n><C-w>k
"tnoremap <S-l> <C-\><C-n><C-w>l
" Map Ctrl-[ and Ctrl-] to move between tabs
map <C-]> gt
map <C-[> gT
" Exit from terminal mode easily
tnoremap <Esc> <C-\><C-n>    
" The terminal buffer should now remain when going between buffers
autocmd TermOpen * set bufhidden=hide
" Set the list of Python linters
let g:syntastic_python_checkers = ['pylint']
" Assign CtrlP to start on ctrl-p
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
" Extend the path to contain the ghc-mod executable
let $PATH = $PATH . ':' . expand("/Users/william/Library/Haskell/bin")
" Disable haskell-bim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" Add neco-ghc to YouCompleteMe
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Check and lint async upon save of a haskell file
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
