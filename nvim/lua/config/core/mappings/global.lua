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

-- Intuitive resizing options!
local wutils = require("config.core.mappings.windowutils")
keymap({'n','v'},'<M-C-h>',wutils.ResizeLeft,options)
keymap({'n','v'},'<M-C-j>',wutils.ResizeDown,options)
keymap({'n','v'},'<M-C-k>',wutils.ResizeUp,options)
keymap({'n','v'},'<M-C-l>',wutils.ResizeRight,options)
keymap({'n','v'},'<M-C-0>','<C-w>=',options)

keymap({'n','v'},'<M-w>','<C-w>n',options)
keymap({'n','v'},'<M-q>','<C-w>c',options)
keymap({'n','v'},'<M-s><M-h>','<C-w>s',options)
keymap({'n','v'},'<M-s><M-v>','<C-w>v',options)

-- Tab-related
keymap('n', '<M-0>','<cmd>tablast<CR>', options)
keymap('n', '<M-t>','<cmd>tabnew<CR>', options)
keymap('n', '<M-c>','<cmd>tabclose<CR>', options)
keymap('n', '<M-n>','<cmd>tabnext<cr>',options)
keymap('n', '<M-p>','<cmd>tabprev<cr>',options)

-- Tab utils

for i = 1,9 do
  keymap('n','<M-'..tostring(i)..'>',function()wutils.goToTab(i)end,options)
  keymap('n','<M-'..tostring(i)..'>',function()wutils.goToTab(i)end,options)
end

-- keymap('n', '<M-2>', function()gototab(2)end,opts)

-- Filetype-specific remaps (only active when editing specific filetype)
local function filetypekeymap(filetype,mode,lhs,rhs,opts)
  --- Args:
  ---     · {filetype}  (string) Extension of the file
  ---     · {mode}      (string) Modes for the keymap
  ---     · {lhs}       (string) lhs of vim.keymap.set
  ---     · {rhs}       (string) rhs of vim.keymap.set
  ---     · {opts}      (table)  opts
  vim.api.nvim_create_autocmd("FileType",{pattern=filetype, 
  callback = function() vim.keymap.set(mode,lhs,rhs,opts) end})
end

-- Latex
filetypekeymap("tex",'','<C-LeftMouse>','<LeftMouse><cmd>VimtexView<cr>',options)

-- Lua
-- filetypekeymap("lua",'','<C-f>',function()
--   local filepath = vim.fn.expand('%')
-- end,options)
