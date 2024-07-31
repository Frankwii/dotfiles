local mappings = require("config.plugins.which-key.plugin-mappings")

local opts = { -- config
  setup = {
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
  },
  keys = mappings.general,
}


local wk=require("which-key")

wk.setup(opts.setup)
wk.add(opts.keys) -- General mappings (always loaded)

-- Buffer-specific mappings
local autocmd=vim.api.nvim_create_autocmd
-- Filetype
local function filemap(filetype)
  autocmd("FileType",{pattern=filetype,callback=function()
    wk.add(mappings.filetypeSpecific[filetype])
  end})
end

-- Force nvim to check filetype
-- vim.cmd('filetype detect')

filemap("tex")
