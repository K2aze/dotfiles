--NVIM TREE SETUP--

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set(
  "n",                 -- normal mode
  "<C-e>",           -- Ctrl + Shift + E
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle NvimTree" }
)

--BUFFER MANAGER SETUP--

require("buffer_manager").setup({ })

local bufferLeader = require("buffer_manager.ui")
vim.keymap.set(
  "n",
  "<C-t>",
  function() bufferLeader.toggle_quick_menu() end,
  { noremap = true, silent = true, desc = "Toggle Buffer Manager"}
)
