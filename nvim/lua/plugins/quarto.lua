return {
	"quarto-dev/quarto-nvim",
	-- lazy = false,
	ft = { "quarto", "markdown" },
	dev = false,
	config = function() require("config.plugins.quarto") end,
	dependencies = {
		"jmbuhr/otter.nvim",
		opts = {},
	},
}

