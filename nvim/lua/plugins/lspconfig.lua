return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies={
    { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      require("config.plugins.lspconfig")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",     -- source for text in buffer
      "hrsh7th/cmp-path",       -- source for file system paths
      "L3MON4D3/LuaSnip",       -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "onsails/lspkind.nvim", -- vs-code like pictograms
      "hrsh7th/cmp-cmdline",
      "petertriho/cmp-git",
      "f3fora/cmp-spell",
      -- "nvim-java/nvim-java",
      -- "micangl/cmp-vimtex",
    },
    config = function()
      require("config.plugins.lspconfig.autocompletion.cmp")
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        "lazy.nvim",
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        -- { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
}
