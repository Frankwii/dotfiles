require("telescope").setup(
{
  defaults={
    mappings=require("config.plugins.telescope.mappings").maps,
    -- Picker control
    scroll_strategy="limit",
    initial_mode="insert",
    path_display={truncate=2},
    -- Layout
    layout_strategy = "bottom_pane",
    layout_config = {
      bottom_pane = {
        height = 15,
        preview_cutoff = 100,
      },
    },
    -- Aesthetics
    border=false,
    prompt_prefix="🔍 ",
    entry_prefix="- ",
  },
  -- load_extension = {
  --   "fzf",
  --   "lazygit"
  -- }
}
)
