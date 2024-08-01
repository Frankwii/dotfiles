local keymap=vim.keymap.set
local delkeymap=vim.keymap.del

-- Rename autocommand creation. Useful for "conditional" remappings (e.g. only active when editing .tex files)
local autocmd=vim.api.nvim_create_autocmd

-- Default
local options= { noremap = true, silent = true }

-- Map space as <leader>. Useful for "emacsifying" nvim via which-key plugin.
vim.g.mapleader = "<Space>"

-- Comfortable wrapped-line displacement with ctrl:
keymap('','<C-h>','g0',options)
keymap('','<C-j>','gj',options)
keymap('','<C-k>','gk',options)
keymap('','<C-l>','g$',options)

-- Save, quit
keymap('n','<C-w>','<cmd>w<cr>',{silent = true, noremap = true, nowait = true})
keymap('n','<C-q><C-q>','<cmd>q!<cr>',options)

-- Window-related
keymap({'n','v'},'<M-h>','<C-w>h',options)
keymap({'n','v'},'<M-j>','<C-w>j',options)
keymap({'n','v'},'<M-k>','<C-w>k',options)
keymap({'n','v'},'<M-l>','<C-w>l',options)

keymap({'n','v'},'<M-H>','<C-w>H',options)
keymap({'n','v'},'<M-J>','<C-w>J',options)
keymap({'n','v'},'<M-K>','<C-w>K',options)
keymap({'n','v'},'<M-L>','<C-w>L',options)

local wutils = require("config.core.mappings.window-utils")
keymap({'n','v'},'<M-r>h',wutils.ResizeLeft,options)
keymap({'n','v'},'<M-r>j',wutils.ResizeDown,options)
keymap({'n','v'},'<M-r>k',wutils.ResizeUp,options)
keymap({'n','v'},'<M-r>l',wutils.ResizeRight,options)

keymap({'n','v'},'<M-n>','<C-w>n',options)
keymap({'n','v'},'<M-q>','<C-w>c',options)
keymap({'n','v'},'<M-s><M-h>','<C-w>s',options)
keymap({'n','v'},'<M-s><M-v>','<C-w>v',options)

-- Tab-related
keymap('n', '<M-t>l','<cmd>tabnext<CR>', opts)
keymap('n', '<M-t>h','<cmd>tabprevious<CR>', opts)
keymap('n', '<M-t>n','<cmd>tabnew<CR>', opts)
keymap('n', '<M-t>c','<cmd>tabclose<CR>', opts)

-- Latex remaps: active only when editing a .tex file
autocmd("FileType",{pattern="tex",callback=
function() keymap('','<C-LeftMouse>','<LeftMouse><cmd>VimtexView<cr>',options)end})
