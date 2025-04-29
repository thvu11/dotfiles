-- Enable syntax highlighting
vim.cmd('syntax on')

-- Leader key
vim.g.mapleader = ' '

-- General settings
vim.opt.showcmd = true

vim.opt.errorbells = false

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.whichwrap:append("<,>,[,]")
-- vim.opt.backspace = { 'indent', 'eol', 'start' }

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search settings
vim.opt.wildmenu = true

-- Show filename in title bar
vim.opt.title = true
vim.opt.titlestring = ""

-- Auto-save and auto-read
vim.opt.autowrite = true
vim.opt.autoread = true

-- Key mappings
-- virtual mode > hilight > capitial J or K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--  Control + d/u - move half page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- open system clipboard and ready to copy the next motion
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Clipboard settings usual control C
vim.opt.clipboard = 'unnamed'
vim.api.nvim_set_keymap('v', '<C-c>', ':w !pbcopy<CR><CR>', { noremap = true, silent = true })

-- Leader key mappings
vim.api.nvim_set_keymap('n', '<Leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j<CR>', { noremap = true, silent = true })

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Plugin configuration
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'rebelot/kanagawa.nvim'
  use 'mbbill/undotree'
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Set colorscheme
vim.cmd [[colorscheme kanagawa]]

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Fuzzy finder config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
