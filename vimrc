syntax on
set showcmd
set noerrorbells
set autoindent
set smartindent
set ts=4 sw=4 et si
set whichwrap +=<,>,[,]
set backspace=indent,eol,start
set hlsearch
set number
set mouse=a
colo zellner

" Search down in subfolders
set wildmenu

inoremap <C-u> <ESC>:w<CR>

" Copy to clipboard
set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>

"Show filename in title bar
set title titlestring=

set autowrite "Save buffer automatically when changing files
set autoread "Awaly reload buffer when external changes detected

nnoremap <Space> <PageDown>
xnoremap <Space> <PageDown>

let mapleader = ','
" switch between line number and relative line number
nmap <Leader>nu :set relativenumber! number<CR>
nmap <Leader>rnu :set relativenumber number!<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-perl/vim-perl'

call plug#end()
