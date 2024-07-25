return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = { -- config
    setup = {
      triggers = {
        { "<leader>", mode = { "n", "v" } },
      },
    },
    keys = { -- mappings
      -- General document mappings
      {"<leader>w","<cmd>w<cr>",desc="Save"},
      {"<leader>Q","<cmd>q!<cr>",desc="Exit"},
      {"<leader>Z","<cmd>wq<cr>",desc="Save & exit"},

      -- File-related mappings
--      {"<leader>f",group="File",
--        {"<leader>fo",desc="Open"},
--        {"<leader>ff",desc="Find"},
--      },
--
--      -- LaTeX
--      {"<leader>l",group="LaTeX",
--        {"<leader>lc","<cmd>VimtexCompile<cr>", desc="Compile"},
--        {"<leader>lt",group="Templates",
--          {"<leader>lta",desc="Article"},
--          {"<leader>ltb",desc="Book"}
--        }
--      }
    },
  },

  config = function(_,opts)
    local wk=require("which-key")
    wk.setup(opts.setup)
    wk.add(opts.keys)
    vim.api.nvim_create_autocmd("FileType",{pattern="tex",callback=function()
      wk.add({"<leader>l","<cmd>VimtexCompile<cr>",desc="Compile document"})
    end})
    end
}

      -- wk.add({"<leader>l",group="LaTeX",expand = function()
      --  return {"<leader>lc","<cmd>VimtexCompile<cr>",desc="Compile"}
