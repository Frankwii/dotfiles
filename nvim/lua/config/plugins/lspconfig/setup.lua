local lspconfig = require("lspconfig")

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)

for type, icon in pairs({ Error = "", Warn = "", Hint = "󰠠", Info = "" }) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Lua
lspconfig.lua_ls.setup {
  capabilities = default_capabilities,
  settings = {
    -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of these files
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"), -- Runtime
          vim.fn.stdpath("config") .. "/lua", -- Nvim config files
        },
      },
    },
  },
}
-- Python
lspconfig.pyright.setup {}

-- Latex
lspconfig.texlab.setup {}

-- C and C++
lspconfig.clangd.setup {}

-- Java
lspconfig.jdtls.setup {}

-- Bash/POSIX
lspconfig.bashls.setup {}

require("config.plugins.lspconfig.global-mappings")
