require('pckr').add {
  --regular
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },

  --appearance
  { "catppuccin/nvim",            as = "catppuccin" },
  { "nvim-lualine/lualine.nvim" },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
  },
  { "lukas-reineke/indent-blankline.nvim" },

  --file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
  },
  { "lewis6991/gitsigns.nvim" },
  --project-wide search
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  --lsp
  { 'L3MON4D3/LuaSnip',                 tag = "v2.*" },
  { 'mason-org/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'windwp/nvim-ts-autotag' },
  { 'karb94/neoscroll.nvim' },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  -- terminal
  { "akinsho/toggleterm.nvim", tag = '*' },
}

require("config.appearance")
require("config.explorer")
require("config.lsp")
require("config.terminal")
