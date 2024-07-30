local opts = { -- config
  setup = {
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
  },
  keys = { -- mappings
    -- General document mappings
    -- Nvim windows
    {"<leader>w",group="Window"},
    {"<leader>wh", "<c-w>h", desc = "Move left"},
    {"<leader>wj", "<c-w>j", desc = "Move down"},
    {"<leader>wk", "<c-w>k", desc = "Move up"},
    {"<leader>wl", "<c-w>l", desc = "Move right"},
    {"<leader>wH", "<c-w>H", desc = "Displace left"},
    {"<leader>wJ", "<c-w>J", desc = "Displace down"},
    {"<leader>wK", "<c-w>K", desc = "Displace up"},
    {"<leader>wL", "<c-w>L", desc = "Displace right"},
    {"<leader>wq", "<c-w>q", desc = "Quit window"},
    {"<leader>wn", "<c-w>n", desc = "New window"},
    {"<leader>wc", "<c-w>c", desc = "Close window"},

    {"<leader>s","<cmd>w<cr>",desc="Save"},
    {"<leader>q","<cmd>q!<cr>",desc="Exit"},
    {"<leader>z","<cmd>wq<cr>",desc="Save & exit"},

    -- File
    {"<leader>f",group="File"},
    {"<leader>fo","",desc="Open"},
    {"<leader>ff","",desc="Find"},

    -- Tree
    {"<leader>t",group="Tree"},
    -- {"<leader>tt","<cmd>NvimTreeToggle<cr>",desc="Toggle"},
    {"<leader>tt",require("nvim-tree.api").tree.toggle,desc="Toggle"},
    {"<leader>tc","<cmd>NvimTreeFindFile!<cr>",desc="Open buffer in tree"},
    {"<leader>tk","<cmd>NvimTreeCollapse<cr>",desc="Collapse"},
    {"<leader>tr","<cmd>NvimTreeRefresh<cr>",desc="Refresh"},
    {"<leader>t+","<cmd>NvimTreeResize +5<cr>",desc="Increase width"},
    {"<leader>t-","<cmd>NvimTreeResize -5<cr>",desc="Decrease width"},
    {"<leader>ts","<cmd>NvimTreeResize 30<cr>",desc="Default size"},
    -- {"<leader>tk","<cmd>NvimTreeCollapse<cr>",desc="Collapse"},

    --      -- LaTeX
    --      {"<leader>l",group="LaTeX",
    --        {"<leader>lc","<cmd>VimtexCompile<cr>", desc="Compile"},
    --        {"<leader>lt",group="Templates",
    --          {"<leader>lta",desc="Article"},
    --          {"<leader>ltb",desc="Book"}
    --        }
    --      }
  },
}


local wk=require("which-key")

wk.setup(opts.setup)
wk.add(opts.keys) -- General mappings
