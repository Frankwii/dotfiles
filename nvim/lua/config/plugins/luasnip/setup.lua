local ls = require("luasnip")

ls.config.setup(
  {
    enable_autosnippets = true,
  }
)

-- Mappings
require("config.plugins.luasnip.mappings")

local addsnip = ls.add_snippets

-- local snippetfiles = {"lua","tex"}
-- local snipPath = "config.plugins.luasnip.snippets"

vim.g.snippetFiletypes={"lua","tex"}
vim.g.snipPath = "config.plugins.luasnip.snippets"

--Add all snippets
addsnip("all",require(vim.g.snipPath..".all"))
for _,filetype in ipairs(vim.g.snippetFiletypes) do
  addsnip(filetype,require(vim.g.snipPath.."."..filetype))
end

