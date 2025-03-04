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

" Search down in subfolders
set wildmenu

inoremap <C-u> <ESC>:w<CR>
inoremap ,, <ESC>

" Copy to clipboard
set clipboard=unnamed
vnoremap <C-c> :w !pbcopy<CR><CR>

"Show filename in title bar
set title titlestring=

set autowrite "Save buffer automatically when changing files
set autoread "Awaly reload buffer when external changes detected

nnoremap <Space> <PageDown>
xnoremap <Space> <PageDown>

let mapleader = '\'
" switch between line number and relative line number
nmap <Leader>nu :set relativenumber! number<CR>
nmap <Leader>rnu :set relativenumber number!<CR>
nmap <Leader>nohl :nohlsearch<CR>
nmap <Leader>tt :set ft=tt2<CR>

" for vertical split
nnoremap <Leader>v <C-w>v<CR>
nnoremap <Leader>l <C-w>l<CR>
nnoremap <Leader>h <C-w>h<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-perl/vim-perl'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/rebelot/kanagawa.nvim.git'

call plug#end()

silent! colorscheme kanagawa
