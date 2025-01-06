return {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim", "GCBallesteros/jupytext.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
          require("config.plugins.molten")
        end,
        keys={
          {"<C-M-CR>", ":MoltenEvaluateLine<CR>", desc="Evaluate current line with Molten", mode={"n","i"}, noremap=true, silent=true},
          {"<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc="Enter output window", mode="n", noremap=true, silent=true},
          {"<leader>mh", ":MoltenHideOutput<CR>", desc="Hide output", mode="n", noremap=true, silent=true},
          {"<leader>mi", ":MoltenInit<CR>", desc="Start kernel", mode="n", noremap=true, silent=true},
          {"<leader>ms", ":MoltenSave<CR>", desc="Save", mode="n", noremap=true, silent=true},
        }
}
