return {
  "Frankwii/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("config.plugins.nvim-tree")
  end,
}
