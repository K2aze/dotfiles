
require('bufferin').setup({
  show_window_layout = true,
  display = {
    show_modified = true,  -- Show modified indicator (●)
    show_icons = true,     -- Show file type icons
    show_hidden = true
  },
})


vim.keymap.set('n', '<leader>b', '<cmd>Bufferin<CR>')


require('bufferline').setup({
  options = {
    mode = "buffers",
    icon = "󰞇",
  }
})

