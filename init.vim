set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

lua require'nvim-treesitter.configs'.setup{auto_install=true,highlight={enable=true}}
