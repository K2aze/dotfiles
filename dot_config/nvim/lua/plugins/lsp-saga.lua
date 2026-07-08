vim.pack.add({"https://github.com/nvimdev/lspsaga.nvim"})
require("lspsaga").setup{}

vim.keymap.set("n", "gd", "<cmd>Lspsaga finder def + tyd ++normal<cr>", {desc = "Show definition"})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", {desc = "Show docs"})
vim.keymap.set("n", "g.", "<cmd>Lspsaga code_action<cr>", {desc = "Show docs"})

vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<cr>",      {desc = "Jump to next diagnostic"})
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<cr>",      {desc = "Jump to prev diagnostic"})

vim.keymap.set({'n', 't'}, '<leader>t', '<cmd>Lspsaga term_toggle<cr>', {desc = "Toggle float terminal"})
