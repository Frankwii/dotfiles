local ls = require("luasnip")
local addsnip = ls.add_snippets
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {}

local function snip_test_context()
  return {
    trig = "prueba",
    name = "Testsnip",
    desc = "This is a test snippet",
    priority = 1, -- default 1000
    snippetType = "snippet", -- other option: "autosnippet". See ls.config.setup({ enable_autosnippets = true })
  }
end

local function snip_test_nodes()
  return {
    t("Probado"),
  }
end

function M.all()
  return {
    -- s(snip_test(),snip_test_nodes())
    s(snip_test_context(),snip_test_nodes()),
    s("trigger", {
        t({"After expanding, the cursor is here ->"}), i(1),
        t({"", "After jumping forward once, cursor is here ->"}), i(2),
        t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
    })
  }
end

-- addsnip("all",M.all())
addsnip("all",M.all())

