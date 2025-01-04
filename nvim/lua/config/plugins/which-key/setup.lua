local wk=require("which-key")
local mappings = require("config.plugins.which-key.plugin-mappings")

wk.setup({
  preset = "classic",
  triggers = {"<leader>", mode = {"n","v"}},
})

wk.add(mappings.general) -- General mappings (always loaded)

-- Filetype-specific
local function filemap(filetype)
  vim.api.nvim_create_autocmd("FileType",{pattern=filetype,callback=function()
    wk.add(mappings.filetypeSpecific[filetype])
  end})
end

-- filemap("tex")
filemap("python") -- Python
filemap("quarto") 
filemap("markdown")
