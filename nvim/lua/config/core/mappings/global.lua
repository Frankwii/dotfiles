local keymap=vim.keymap.set

-- Default
local options= { noremap = true, silent = true }

-- Kill search highlights
keymap("n", "<esc>", "<cmd>noh<CR>", options)

-- Map space as <leader>. Useful for "emacsifying" nvim via which-key plugin.
vim.g.mapleader = "<Space>"

-- Comfortable wrapped-line displacement with ctrl-alt:
keymap('','<C-M-h>','g0',options)
keymap('','<C-M-j>','gj',options)
keymap('','<C-M-k>','gk',options)
keymap('','<C-M-l>','g$',options)

-- For navigating help files
keymap('','<C-S-j>',function()
    vim.cmd("tag "..vim.fn.expand("<cword>"))
end,options)

-- Save, quit
keymap('n','<C-w>','<cmd>w<cr>',{silent = true, noremap = true, nowait = true})
keymap('n','<C-q><C-q>','<cmd>q!<cr>',options)

-- Navigate buffers
keymap("n", "<M-n>", "<cmd>bnext<CR>", options)
keymap("n", "<M-p>", "<cmd>bprevious<CR>", options)

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
keymap({'n','v'},'<M-Left>',wutils.ResizeLeft,options)
keymap({'n','v'},'<M-Down>',wutils.ResizeDown,options)
keymap({'n','v'},'<M-Up>',wutils.ResizeUp,options)
keymap({'n','v'},'<M-Right>',wutils.ResizeRight,options)
keymap({'n','v'},'<M-C-0>','<C-w>=',options)

keymap({'n','v'},'<M-w>','<C-w>n',options)
keymap({'n','v'},'<M-q>','<C-w>c',options)
keymap({'n','v'},'<M-s><M-s>','<C-w>v',options)
keymap({'n','v'},'<M-s><M-v>','<C-w>s',options)

-- Tab-related
keymap('n', '<M-0>','<cmd>tablast<CR>', options)
keymap('n', '<M-t>','<cmd>tabnew<CR>', options)
keymap('n', '<M-c>','<cmd>tabclose<CR>', options)
keymap('n', '<M-Tab>','<cmd>tabnext<cr>',options)
keymap('n', '<M-S-Tab>','<cmd>tabprev<cr>',options)

-- Tab utils
for i = 1,9 do
  keymap('n','<M-'..tostring(i)..'>',function()wutils.goToTab(i)end,options)
  keymap('n','<M-'..tostring(i)..'>',function()wutils.goToTab(i)end,options)
end

-- Filetype-specific remaps (only active when editing specific filetype)
-- local function filetypekeymap(filetype, mode, lhs, rhs, opts)
--   --- Args:
--   ---     · {filetype}  (string) Extension of the file
--   ---     · {mode}      (string) Modes for the keymap
--   ---     · {lhs}       (string) lhs of vim.keymap.set
--   ---     · {rhs}       (string) rhs of vim.keymap.set
--   ---     · {opts}      (table)  opts
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = filetype,
--     callback = function() vim.keymap.set(mode, lhs, rhs, opts) end
--   })
-- end
