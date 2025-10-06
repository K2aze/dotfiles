vim.opt.termguicolors = true

require('nvim-tree').setup({
  
})

local api = require('nvim-tree.api')


vim.keymap.set("n", "<C-E>", api.tree.toggle)
vim.keymap.set("n", "<leader>e", api.tree.toggle)
