local M={}

M.incremental_selection={
  init_selection = {keys="<leader>s", desc="Select incrementally"}, -- set to `false` to disable one of the mappings
  node_incremental = "n",
  scope_incremental = "s",
  node_decremental = "p"
}

M.textobjects={}
M.textobjects.select={
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["aC"] = "@class.outer",
  ["iC"] = "@class.inner",
  ["ac"] = "@conditional.outer",
  ["ic"] = "@conditional.inner",
  ["al"] = "@loop.outer",
  ["il"] = "@loop.inner",
  ["ap"] = "@parameter.outer",
  ["ip"] = "@parameter.inner",
  ["ab"] = "@block.outer",
  ["ib"] = "@block.inner",
}

M.textobjects.move = {
  goto_next_start = {
    ["mf"] = "@function.outer",
    ["mc"] = "@conditional.outer",
    ["mC"] = "@class.outer",
    ["ml"] = "@loop.outer",
    ["mp"] = "@parameter.outer",
    ["mb"] = "@block.outer",
  },

  goto_previous_start = {
    ["Mf"] = "@function.outer",
    ["Mc"] = "@conditional.outer",
    ["MC"] = "@class.outer",
    ["Ml"] = "@loop.outer",
    ["Mp"] = "@parameter.outer",
    ["Mb"] = "@block.outer",
  },

  goto_next_end = {
    ["sf"] = "@function.outer",
    ["sc"] = "@conditional.outer",
    ["sC"] = "@class.outer",
    ["sl"] = "@loop.outer",
    ["sp"] = "@parameter.outer",
    ["sb"] = "@block.outer",
  },

  goto_previous_end = {
    ["Sf"] = "@function.outer",
    ["Sc"] = "@conditional.outer",
    ["SC"] = "@class.outer",
    ["Sl"] = "@loop.outer",
    ["Sp"] = "@parameter.outer",
    ["Sb"] = "@block.outer",
  },
}

return M
