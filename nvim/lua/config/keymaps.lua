-- Rename keymap set and deletion function
local keymap=vim.keymap.set
local delkeymap=vim.keymap.del

-- Rename autocommand creation. Useful for "conditional" remappings (e.g. only active when editing .tex files)
local autocmd=vim.api.nvim_create_autocmd

-- Default options for keymap setting
local options= { noremap = true, silent = true }
-- · noremap=true specifies that no recursivity is used while defining the keymap and that any previous command assigned to the given keychord should be rewritten
--
-- · silent=true specifies that no output string should be returned (e.g. no error messages)

-- Map space as <leader>. Useful for "emacsifying" nvim via which-key plugin.
vim.g.mapleader = " "

-- Tag jumping (easier navigation through help files)
-- keymap('n','<cr>','<c-J>',options)
-- keymap('n','<del>','<c-o>',options)

-- Comfortable wrapped-line displacement with ctrl:
keymap('','<c-j>','gj',options)
keymap('','<c-k>','gk',options)
keymap('','<c-h>','g0',options)
keymap('','<c-l>','g$',options)



-- Mouse remaps (hardware-specific)


-- Latex remaps: active only when editing a .tex file
autocmd("FileType",{pattern="tex",callback=function()
keymap('','<C-LeftMouse>','<LeftMouse><cmd>VimtexView<cr>')
-- keymap('','<C-q>','<cmd>q!<cr>')
end
})
