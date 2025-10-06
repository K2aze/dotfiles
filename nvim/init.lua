
--pckr plugin manager--

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()


--pckr plugins--
require("plugins")


--general settings--
vim.g.mapleader = "="
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.mouse = a
vim.opt.expandtab = true

require("config.theme")
require("config.explorer")
require("config.buffer")
require("config.terminal")
require("config.lsp")
require("config.cmp")
