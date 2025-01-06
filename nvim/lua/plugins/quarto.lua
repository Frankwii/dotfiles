return {
	"quarto-dev/quarto-nvim",
	ft = { "quarto", "markdown" },
	dev = false,
	opts = require("config.plugins.quarto"),
	dependencies = {
		"jmbuhr/otter.nvim",
    'anuvyklack/hydra.nvim',
		opts = {},
	},
  keys = {

    {"<leader>rA", function()require("quarto.runner").run_all(true)end, mode='n', desc="Run All", noremap=true, silent=true},
    {"<leader>rc", function()require("quarto.runner").run_cell()end, mode='n', desc="Run cell", noremap=true, silent=true},
    {"<leader>ra", function()require("quarto.runner").run_above()end, desc="Run above", mode="n", noremap=true, silent=true},
    {"<leader>rl", function()require("quarto.runner").run_line()end, desc="Run line", mode="n", noremap=true, silent=true},
    {"<leader>r", function()require("quarto.runner").run_range()end, desc="Run selection", mode="v", noremap=true, silent=true}

  }
}

