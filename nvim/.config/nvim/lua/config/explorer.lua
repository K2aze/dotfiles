--`Lua.diagnostics.globals`: add element `"vim"`
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  }
})

--config for Neo-tree
vim.keymap.set("n", "<C-S-e>", "<cmd>Neotree float reveal<CR>")
vim.keymap.set("n", "<C-S-b>", "<cmd>Neotree buffers float<CR>")
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local is_dir = vim.fn.isdirectory(data.file) == 1

    if is_dir then
      vim.cmd.cd(data.file)

      require("neo-tree.command").execute({
        source = "filesystem",
        position = "current",
      })
    end
  end,
})

require("neo-tree").setup({
  window = {
    position = "right",
  },
  filesystem = {
    hijack_netrw_behavior = "disabled",
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
})

--config for snacks
vim.keymap.set("n", "g/", function()
  require("snacks").picker.grep()
end)

vim.keymap.set("n", "g.", function()
  vim.lsp.buf.code_action()
end, { noremap = true, silent = true })
