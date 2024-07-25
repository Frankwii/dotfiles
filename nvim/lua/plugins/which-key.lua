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
      {"<leader>w",group="Window"},
        {"<leader>wh", "<c-w>h", desc = "Move left"},
        {"<leader>wj", "<c-w>j", desc = "Move down"},
        {"<leader>wk", "<c-w>k", desc = "Move up"},
        {"<leader>wl", "<c-w>l", desc = "Move right"},
        {"<leader>wq", "<c-w>q", desc = "Quit window"},
        {"<leader>wn", "<c-w>n", desc = "New window"},
        {"<leader>wc", "<c-w>c", desc = "Close window"},

      {"<leader>s","<cmd>w<cr>",desc="Save"},
      {"<leader>q","<cmd>q!<cr>",desc="Exit"},
      {"<leader>z","<cmd>wq<cr>",desc="Save & exit"},

      -- File-related mappings
      {"<leader>f",group="File"},
      {"<leader>fo","",desc="Open"},
      {"<leader>ff","",desc="Find"},

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
    local autocmd=vim.api.nvim_create_autocmd

    wk.setup(opts.setup)
    wk.add(opts.keys) -- General mappings
    local function setup_tex_mappings()
      local maps={
        {"<leader>c","<cmd>VimtexCompile<cr>",desc="Compile"}
      }

      wk.add(maps)
    end
    -- wk.add({autocmd("FileType",{pattern="tex",callback=function()end}),desc="Latex compile"})
   -- autocmd("FileType",{pattern="tex",callback=function()
   --   wk.add({"<leader>l","<cmd>VimtexCompile<cr>",desc="Compile document"})
   -- end})
    autocmd("FileType",{pattern="tex",callback=setup_tex_mappings})
    end
}

      -- wk.add({"<leader>l",group="LaTeX",expand = function()
      --  return {"<leader>lc","<cmd>VimtexCompile<cr>",desc="Compile"}
