-- Rename keymap set and deletion function
local keymap=vim.keymap.set
local delkeymap=vim.keymap.del

-- Default options for keymap setting
local options= { noremap = true, silent = true }

-- Map space as <leader>
vim.g.mapleader = " "

-- 
keymap('','<c-j>','gj',options)
keymap('','<c-k>','gk',options)
keymap('','<c-h>','g0',options)
keymap('','<c-l>','g$',options)
-- keymap('','<C-Left>','VimtexView',options)

-- vim.keymap.del('','<C-Left>')

