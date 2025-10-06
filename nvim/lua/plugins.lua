-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require("pckr").add{
  
  {'L3MON4D3/LuaSnip', run = "make install_jsregexp" },

  --icon
  { 'nvim-tree/nvim-web-devicons' },
  
  --colorscheme
  { 'Mofiqul/dracula.nvim', as = 'dracula' },
  { 'nvim-lualine/lualine.nvim'},
  
  --file explorer
  { 'nvim-tree/nvim-tree.lua' },
  
  --buffer
  { 'wasabeef/bufferin.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'akinsho/bufferline.nvim'},
  
  --terminal
  { 'voldikss/vim-floaterm' },
  
  --auto complete
  { 'mason-org/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim'},
  { 'neovim/nvim-lspconfig'},
  { 'hrsh7th/nvim-cmp'},
  { 'hrsh7th/cmp-nvim-lsp'},
  { 'hrsh7th/cmp-buffer'},
  { 'hrsh7th/cmp-path'},
  { 'hrsh7th/cmp-cmdline'},
  { 'L3MON4D3/LuaSnip'},
  { 'saadparwaiz1/cmp_luasnip'},
  { 'rafamadriz/friendly-snippets'},
}
