local telescope_api = require("telescope.builtin")
-- local maps = require("config.plugins.telescope.mappings").maps()

require("telescope").setup{
  defaults={
    scroll_strategy="limit",
    prompt_prefix="$ ",
    initial_mode="normal",
    -- mappings=maps,
  },
}
