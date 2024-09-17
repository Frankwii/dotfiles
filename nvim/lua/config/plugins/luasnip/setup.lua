local ls = require("luasnip")

ls.config.setup(
  {
    enable_autosnippets = true,
  }
)

vim.g.snippetFolder="./lua/config/plugins/luasnip/snippets/"

-- Mappings
require("config.plugins.luasnip.mappings")

require("luasnip.loaders.from_lua").load({paths=vim.g.snippetFolder})
