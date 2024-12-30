local actions = require("telescope.actions")

local M = {}

M.maps=
  {
    n = {
      ["q"] = actions.close,
      --- Results movement
      ["<C-k>"] = actions.results_scrolling_up,
      ["<C-j>"] = actions.results_scrolling_down,

      --- Opening files
      ["ss"] = actions.select_horizontal,
      ["sv"] = actions.select_vertical,
      ["st"] = actions.select_tab,

      -- Marks
      ["m"] = function()
        local bufn = vim.api.nvim_get_current_buf()
        actions.toggle_selection(bufn)
        actions.move_selection_previous(bufn)
      end,

      ["M"] = function()
        local bufn = vim.api.nvim_get_current_buf()
        actions.toggle_selection(bufn)
        actions.move_selection_next(bufn)
      end,

      -- Preview
      ["<C-M-j>"] = actions.preview_scrolling_down,
      ["<C-M-k>"] = actions.preview_scrolling_up,
    },
    i = {
      -- ["<CR>"] = {"<esc>", type="command"},
      ["<C-k>"] = actions.move_selection_next,
      ["<C-j>"] = actions.move_selection_previous,

      -- Preview
      ["<C-M-j>"] = actions.preview_scrolling_down,
      ["<C-M-k>"] = actions.preview_scrolling_up,
    },
  }

return M
