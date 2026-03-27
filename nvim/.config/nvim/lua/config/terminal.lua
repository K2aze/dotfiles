require("toggleterm").setup {
  shade_terminals = true
}

local function float_term()
  require("toggleterm").toggle(1, 20, vim.loop.cwd(), "float")
end

vim.keymap.set({ "n", "t" }, "<C-`>", function()
  if vim.fn.mode() == "t" then
    vim.cmd("stopinsert")
  end
  float_term()
end, { silent = true }
)
