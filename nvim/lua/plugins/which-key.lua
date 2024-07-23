return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = { -- config
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
    spec = { -- mappings
      {"<leader>w","<cmd>w<cr>",desc="Write current"},
      {"<leader>q","<cmd>q!<cr>",desc="Quit"},
    },
  },
  keys = {
    {
      "<leader>l",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Latex",
    },
  },
}
