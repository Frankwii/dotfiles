return {
    "Frankwii/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("config.plugins.treesitter")
    end,
}
