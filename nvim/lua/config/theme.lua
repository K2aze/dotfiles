
--DRACULA COLORSCHEME--
require('dracula').setup({
  transparent_bg = true,
  italic_comment = true
})


vim.cmd[[colorscheme dracula-soft]]


--LUALINE CONFIG--
require('lualine').setup({
  options = {
    theme = 'dracula'
  }
})
