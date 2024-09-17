local function inMath()
  return vim.fn['vimtex#syntax#in_mathzone()']()==1
end

local function isWritten(args,parent,user_args)
  return args[1][1]~="" and user_args or ""
end

return {
  s({trig="II",name="Integral"},
    {
      t("\\int"),
      f(isWritten,{1},{user_args={"_{"}}),i(1,"a"),
      f(isWritten,{1},{user_args={"}"}}),
      f(isWritten,{2},{user_args={"^{"}}),i(2,"b"),f(isWritten,{2},{user_args={"}"}}),i(3,"f"),
      t("~d"),i(4,"\\mu"),i(0)
    }
  ),
  s({trig="SS", name="Sum"},
    {
      t("\\sum"),
      f(isWritten,{1},{user_args={"_{"}}),i(1,"i=1"),
      f(isWritten,{1},{user_args={"}"}}),
      f(isWritten,{2},{user_args={"^{"}}),i(2,"n"),f(isWritten,{2},{user_args={"}"}}),i(3,""),i(0)
    }
  ),
}
-- Autotrigger
,{
  s({trig="mk"}, {
    t("\\("), i(1),t("\\)"),i(0)
  }),
  s({trig="dm"}, {
    t({"\\["}),
      t({"","\t"}),i(0),
    t({"",".\\]"})
  }),
}
