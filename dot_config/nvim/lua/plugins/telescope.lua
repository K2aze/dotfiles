vim.pack.add({"https://github.com/nvim-telescope/telescope.nvim"})

local builtin = require("telescope.builtin")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      n = {
    	  ["<c-d>"] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
          ["<c-d>"] = require('telescope.actions').delete_buffer
      } -- i
    } -- mappings
  }, -- defaults
...
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', 'g/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
