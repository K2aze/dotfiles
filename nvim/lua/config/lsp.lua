-- Mason UI
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Mason-LSPConfig: auto setup LSP servers
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",  -- LSP cho Lua
  },
  handlers = {
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- Cấu hình riêng cho Lua
  ["lua_ls"] = function()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- Neovim dùng LuaJIT
        },
        diagnostics = {
          globals = { "vim" }, -- tránh báo lỗi 'undefined global vim'
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true), -- load thư viện runtime của Neovim
          checkThirdParty = false, -- tắt cảnh báo third-party
        },
        telemetry = { enable = false }, -- tắt gửi dữ liệu
      },
    },
  })
end,

  },
})

-- Hiển thị diagnostics (hint, warn, error, info)
vim.diagnostic.config({
  -- ✨ Biểu tượng hiển thị bên cột trái
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },

  -- ✨ Hiển thị lỗi, cảnh báo, hint trong code
  virtual_text = {
    prefix = "●",   -- Ký hiệu trước lỗi/hint
    spacing = 4,    -- Khoảng cách giữa text và code
  },

  underline = true,        -- Gạch chân dòng có lỗi
  update_in_insert = false,-- Không update khi đang gõ
  severity_sort = true,    -- Sắp xếp theo độ nghiêm trọng
})

