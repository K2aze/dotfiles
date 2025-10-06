require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",      -- LSP cho Lua (Neovim config)
    -- Thêm các LSP khác tùy ngôn ngữ bạn dùng, ví dụ: "clangd" cho C++
  },
  handlers = {
    -- Mặc định cho tất cả servers
    function(server_name)
      require("lspconfig")[server_name].setup {}
    end,
    -- Tùy chỉnh cho lua_ls (cho phép dùng 'vim' như global)
    ['lua_ls'] = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }
    end,
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()


local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

-- Áp dụng on_attach cho tất cả LSP (thêm vào handler nếu cần)
-- Ví dụ trong mason-lspconfig handlers:
-- require("lspconfig")[server_name].setup { on_attach = on_attach, capabilities = capabilities }
