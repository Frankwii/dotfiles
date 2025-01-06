-- All colorschemes and theme-related plugins go here!
return {
  -- Themes
  {'folke/tokyonight.nvim', lazy=true},
  {'ellisonleao/gruvbox.nvim', lazy=true},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config=function()
      require("config.plugins.catppuccin")
    end,
    priority = 1000
  },

  -- Bottom bar
  {
    "feline-nvim/feline.nvim",
    dependencies={"catppuccin/nvim"},
    config=function()
      require("config.plugins.feline")
    end,
  }
}
