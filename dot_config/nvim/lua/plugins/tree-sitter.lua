vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

require("nvim-treesitter").setup{
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require("nvim-treesitter").install{"lua", "python"}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'blade' },
  callback = function()
    vim.treesitter.start()
  end,
})
