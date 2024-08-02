local M={}

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

M.general =
{
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
    {"<leader>wo", desc="Go to window",expand = function()
      return require("which-key.extras").expand.win()
    end},

    {"<leader>q","<cmd>q!<cr>",desc="Exit"},
    {"<leader>b",group = "buffers"},
    {"<leader>bo", desc="Go to open", expand = function()
      return require("which-key.extras").expand.buf()
    end
    },

    -- Nvim-tree
    {"<leader>t",group="Tree"},
    -- {"<leader>tt","<cmd>NvimTreeToggle<cr>",desc="Toggle"},
    {"<leader>tt",require("nvim-tree.api").tree.toggle,desc="Toggle"},
    {"<leader>tc","<cmd>NvimTreeFindFile!<cr>",desc="Open buffer in tree"},
    {"<leader>tk","<cmd>NvimTreeCollapse<cr>",desc="Collapse"},
    {"<leader>tr","<cmd>NvimTreeRefresh<cr>",desc="Refresh"},
    {"<leader>t+","<cmd>NvimTreeResize +5<cr>",desc="Increase width"},
    {"<leader>t-","<cmd>NvimTreeResize -5<cr>",desc="Decrease width"},
    {"<leader>ts","<cmd>NvimTreeResize 30<cr>",desc="Default size"},

    -- Telescope
    {"<leader>f",group="Find"},
    -- {"<leader>fn",,desc="Navigate"},
    {"<leader>ff",function()
      builtin.find_files({
        find_command = { "fd", "--type", "d", "--type", "f", "--hidden", "--exclude", ".git" }
      ,})
        end,desc="Search files"},
    -- {"<leader>fg",,desc="Current file"},
    {"<leader>fb",builtin.buffers,desc="Search buffers"},
    {"<leader>fh",builtin.help_tags,desc="Search files"},
    {"<leader>fw",builtin.grep_string,desc="Search files"},
    
    {"<leader>m",group="Bookmarks"},
    {"<leader>mo",expand=require("config.plugins.which-key.bookmarkutils").create_mappings,desc="Bookmarked"},
}

M.filetypeSpecific={}

M.filetypeSpecific.tex=
{
   {"<leader>c","<cmd>VimtexCompile<cr>",desc="Compile"}
}

return M
