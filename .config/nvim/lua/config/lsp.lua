--`Lua.diagnostics.globals`: add element `"vim"`;
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
    "lua_ls", -- LSP for Lua
  },
  handlers = {
    function(server_name)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
      })
    end,

    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
    end,

  },
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },

  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
    border = "rounded",
  })
end)

--config for lua-snip
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
  --   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --   ['<C-Space>'] = cmp.mapping.complete(),
  --   ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 's', 'i' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer',   keyword_length = 3 },
  }),
  window = {
    completion = cmp.config.window.bordered({
      border = "double"
    }),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, item)
      local icons = {
        nvim_lsp = 'LSP',
        luasnip = 'SNIP',
        buffer = 'BUF',
        path = 'PATH',
      }
      item.kind = string.format('%s %s', icons[entry.source.name] or '?', item.kind)
      return item
    end,
  },
})

-- nvim-cmp menu colors
vim.cmd [[
  highlight! Pmenu       guibg=#1e1e2e guifg=#c0caf5
  highlight! PmenuSel    guibg=#3b4261 guifg=#ffffff
  highlight! PmenuThumb  guibg=#7aa2f7
  highlight! PmenuSbar   guibg=#3b4261
  highlight! CmpItemAbbr guifg=#c0caf5
  highlight! CmpItemKind guifg=#7aa2f7
  highlight! CmpItemMenu guifg=#565f89
]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.bo.filetype = vim.bo.filetype .. ".html" -- Append HTML cho mixed support
  end,
})
vim.keymap.set("n", "<A-S-f>", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

-- Move current line up
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Move selected lines up
vim.keymap.set("x", "<S-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move current line down
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- Move selected lines down
vim.keymap.set("x", "<S-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

--config for nvim-autopair
require("nvim-autopairs").setup {}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
