vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'Mofiqul/dracula.nvim', as = 'dracula' }
  use {
  'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'nvim-lua/plenary.nvim'  -- basic dependency
  use 'j-morano/buffer_manager.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use 'voldikss/vim-floaterm'
end)

