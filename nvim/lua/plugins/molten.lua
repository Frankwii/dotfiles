return {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim", "GCBallesteros/jupytext.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
          require("config.plugins.molten")
        end,
}
