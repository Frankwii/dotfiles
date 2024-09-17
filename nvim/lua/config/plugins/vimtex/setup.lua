vim.g['vimtex_view_method'] = 'zathura'     -- main variant with xdotool (requires X11; not compatible with wayland)
-- vim.g['vimtex_view_method'] = 'zathura_simple' -- for variant without xdotool to avoid errors in wayland
vim.g['vimtex_quickfix_mode'] = 0              -- suppress error reporting on save and build
vim.g['vimtex_mappings_enabled'] = 0           -- Ignore mappings
vim.g['vimtex_indent_enabled'] = 0             -- Auto Indent
vim.g['tex_flavor'] = 'latex'                  -- how to read tex files
vim.g['tex_indent_items'] = 0                  -- turn off enumerate indent
vim.g['tex_indent_brace'] = 0                  -- turn off brace indent
-- vim.g['vimtex_context_pdf_viewer'] = 'okular'  -- external PDF viewer run from vimtex menu command
vim.g['vimtex_log_ignore'] = ({                -- Error suppression:
  'Underfull',
  'Overfull',
  'specifier changed to',
  'Token not allowed in a PDF string',
})

-- local wk=require("which-key")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.keymap.set('', '<C-LeftMouse>', '<LeftMouse><cmd>VimtexView<cr>', { noremap = true, silent = true })
    vim.keymap.set('n','<C-c><C-a>','<cmd>VimtexCompile<cr>',{noremap=true, silent=true, desc='Compile document'})
    -- wk.add({"<leader>","<cmd>VimtexCompile<cr>",desc="Compile"})
  end
})

