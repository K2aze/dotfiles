--regular settings

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = a
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"

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

require('plugins')
