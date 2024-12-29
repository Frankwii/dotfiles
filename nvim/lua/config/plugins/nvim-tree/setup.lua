require("nvim-tree").setup{
  on_attach = require("config.plugins.nvim-tree.tree-mappings").treemappings,
  hijack_cursor = true, -- no cursor right/left movement
  disable_netrw = true, -- conflicts with default nvim option
  modified = {
    enable=true, -- show modified files with a ·
  },
  filters = {
    dotfiles = true, -- hide dotfiles at start
  },
  view = {
    signcolumn = "yes", -- column with icons and bars
    side = "left",
  },
  renderer = {
    highlight_opened_files = "name",
    highlight_modified = "name",
    highlight_bookmarks = "name",
    indent_markers = {
      enable = true, -- nice indent bars for folders and files
    },
    icons = {
      show = {
        folder_arrow = false, -- do not show an arrow > on folders
                              -- it is ugly with the bars on
      },
    },
  },
  actions = {
    open_file={
      quit_on_open = true, -- close tree when opening a file
    },
  },
}

-- require("nvim-tree-keymaps")
