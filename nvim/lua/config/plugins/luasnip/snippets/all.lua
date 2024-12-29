return {
  s("test",t("This is a test")),
  s("trig", c(1, {
    t("Ugh boring, a text node"),
    i(nil, "At least I can edit something now..."),
    f(function(args) return "Still only counts as text!!" end, {})
  }))
}
-- Autotriggered
,{s({trig="autotest", wordTrig=false},t("This was autotriggered"))}

