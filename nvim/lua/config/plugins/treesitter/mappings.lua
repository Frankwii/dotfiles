local M={}

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
    ["mb"] = "@block.inner",
  },

  goto_previous_start = {
    ["Mf"] = "@function.outer",
    ["Mc"] = "@conditional.outer",
    ["MC"] = "@class.outer",
    ["Ml"] = "@loop.outer",
    ["Mp"] = "@parameter.outer",
    ["Mb"] = "@block.inner",
  },

  goto_next_end = {
    ["sf"] = "@function.outer",
    ["sc"] = "@conditional.outer",
    ["sC"] = "@class.outer",
    ["sl"] = "@loop.outer",
    ["sp"] = "@parameter.outer",
    ["sb"] = "@block.inner",
  },

  goto_previous_end = {
    ["Sf"] = "@function.outer",
    ["Sc"] = "@conditional.outer",
    ["SC"] = "@class.outer",
    ["Sl"] = "@loop.outer",
    ["Sp"] = "@parameter.outer",
    ["Sb"] = "@block.inner",
  },
}

return M
