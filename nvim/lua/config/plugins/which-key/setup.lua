local wk=require("which-key")
local mappings = require("config.plugins.which-key.plugin-mappings")

local setup = {
  preset = "classic",
  triggers = {"<leader>", mode = {"n","v"}},
}


wk.setup(setup)
wk.add(mappings.general) -- General mappings (always loaded)

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
