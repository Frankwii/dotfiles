local actions = require("telescope.actions")

local M = {}

M.maps=
  {
    n = {
      ["q"] = actions.close,
      --- Results movement
      ["K"] = actions.results_scrolling_up,
      ["J"] = actions.results_scrolling_down,

      --- Opening files
      ["sh"] = actions.select_horizontal,
      ["sv"] = actions.select_vertical,
      ["st"] = actions.select_tab,

      -- Marks
      ["m"] = actions.toggle_selection + actions.move_selection_next,
      ["M"] = actions.toggle_selection + actions.move_selection_previous,

      -- Preview
      ["<C-j>"] = actions.preview_scrolling_down,
      ["<C-k>"] = actions.preview_scrolling_up,
    },
    i = {
      ["<CR>"] = {"<esc>", type="command"},

      -- Preview
      ["<C-j>"] = actions.preview_scrolling_down, 
      ["<C-k>"] = actions.preview_scrolling_up,
    },
  }

return M
