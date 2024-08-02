local tree_api = require("nvim-tree.api")
local keymap = vim.keymap.set

local function opts(description)
  return { desc = description, noremap = true, silent = true}
end

keymap('','<C-t>',tree_api.tree.open,opts("Focus tree"))
