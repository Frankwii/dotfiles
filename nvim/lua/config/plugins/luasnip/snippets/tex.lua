local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({trig="mk",snippetType="autosnippet"}, {
    t("\\("), i(1),t("\\)"),i(0)
  }),
  s({trig="dm",snippetType="autosnippet"}, {
    t({"\\["}),
      t({"","\t"}),i(0),
    t({"",".\\]"})
  }),
}
