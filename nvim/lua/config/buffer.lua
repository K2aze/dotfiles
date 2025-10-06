
require('bufferin').setup({
  show_window_layout = true,
  display = {
    show_numbers = true,   -- Show buffer numbers
    show_modified = true,  -- Show modified indicator (●)
    show_hidden = false,   -- Show hidden/unlisted buffers
    show_icons = true,     -- Show file type icons
    show_hidden = true
  },
})

 
vim.keymap.set('n', '<C-b>', '<cmd>Bufferin<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>Bufferin<CR>')

require('bufferline').setup({
  options = {
    mode = "tab",
    indicator = {
      icon="|>",
      style = "icon",
    }
  } 

})

