return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_,opts)
    require("config.plugins.which-key")
  end
}
