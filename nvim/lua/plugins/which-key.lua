return {
  "folke/which-key.nvim",
  dependencies = {'echasnovski/mini.icons','nvim-tree/nvim-web-devicons'},
  -- event = "VeryLazy",
  config = function()
    require("config.plugins.which-key")
  end
}
