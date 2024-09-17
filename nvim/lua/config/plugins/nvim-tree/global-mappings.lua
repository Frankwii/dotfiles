local tree_api = require("nvim-tree.api")
local keymap = vim.keymap.set

local function generate_opts(description)
  return { desc = description, noremap = true, silent = true}
end

keymap('n','<c-t>',tree_api.tree.open,generate_opts("Focus tree"))




--- Which-key mappings

-- TODO: Check whether wk is installed before doing
local wk=require("which-key")

local function reload()
  local node = require("nvim-tree.lib").get_node_at_cursor()
  require("nvim-tree.actions.reloaders").reload_explorer()
  require("nvim-tree.utils").focus_node_or_parent(node)
end

local function open_current()
  -- local tree_api=require("nvim-tree.api")
  -- local explorer = require("nvim-tree.core").get_explorer()
  --
  -- if explorer.filters.config.filter_dotfiles then
  --   tree_api.tree.find_file({open=true, current_window=false, update_root=true, focus=true})
  -- else
  --   explorer.filters.config.filter_dotfiles = true
  --   reload()
  --   tree_api.tree.find_file({open=true, current_window=false, update_root=true, focus=true})
  --   explorer.filters.config.filter_dotfiles = false
  --   reload()
  -- end

  tree_api.tree.find_file({open=true, current_window=false, update_root=true, focus=true})
end

wk.add({
  {"<leader>t",group="Tree"},
  -- {"<leader>tt","<cmd>NvimTreeToggle<cr>",desc="Toggle"},
  {"<leader>tt",require("nvim-tree.api").tree.toggle,desc="Toggle"},
  {"<leader>tc",open_current,desc="Open buffer in tree"},
  {"<leader>tk","<cmd>NvimTreeCollapse<cr>",desc="Collapse"},
  {"<leader>tr","<cmd>NvimTreeRefresh<cr>",desc="Refresh"},
  {"<leader>t+","<cmd>NvimTreeResize +5<cr>",desc="Increase width"},
  {"<leader>t-","<cmd>NvimTreeResize -5<cr>",desc="Decrease width"},
  {"<leader>ts","<cmd>NvimTreeResize 30<cr>",desc="Default size"},

})
