local M={}

local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")
M.general =
{
    -- General document mappings
    {'<leader>T', ':split | terminal<CR>', desc="Open terminal"},

    -- Nvim windows
    {"<leader>w",group="Window"},
    {"<leader>wh", "<c-w>h", desc = "Move left"},
    {"<leader>wj", "<c-w>j", desc = "Move down"},
    {"<leader>wk", "<c-w>k", desc = "Move up"},
    {"<leader>wl", "<c-w>l", desc = "Move right"},
    {"<leader>wH", "<c-w>H", desc = "Displace left"},
    {"<leader>wJ", "<c-w>J", desc = "Displace down"},
    {"<leader>wK", "<c-w>K", desc = "Displace up"},
    {"<leader>wL", "<c-w>L", desc = "Displace right"},
    {"<leader>wq", "<c-w>q", desc = "Quit window"},
    {"<leader>wn", "<c-w>n", desc = "New window"},
    {"<leader>wc", "<c-w>c", desc = "Close window"},
    {"<leader>wo", desc="Go to window",expand = function()
      return require("which-key.extras").expand.win()
    end},

    {"<leader>q","<cmd>q!<cr>",desc="Exit"},
    {"<leader>b",group = "buffers"},
    {"<leader>bo", desc="Go to open", expand = function()
      return require("which-key.extras").expand.buf()
    end
    },

    -- Telescope
    {"<leader>x",builtin.commands, desc="Execute command"},

    {"<leader>f",group="Find"},
    {"<leader>ff",function()
      builtin.find_files({
        find_command = { "fd", "--type", "d", "--type", "f", "--hidden", "--exclude", ".git" },

      })
        end,desc="Search files"},

    {"<leader>fd",function() builtin.live_grep({
      promp_title = 'Find string in current directory...'
    }) end,
    desc="Search in current directory"},

    {"<leader>fo",function() builtin.live_grep({
      prompt_title = 'Find string in open buffers...',
      grep_open_files=true
    })end, desc="Search in open files"},

    {"<leader>fl", function() builtin.live_grep({
      type_filter = vim.bo.filetype
    }) end,
    desc="Search in current directory, only in current language"},

    {"<leader>fm", builtin.keymaps, desc="Check keymappings"},

    {"<leader>fw",function() builtin.grep_string({
      search=vim.fn.expand("<cword>")
    }) end,
    desc="Search word under cursor in current directory"},

    {"<leader>fc", group="LSP"},
    {"<leader>fcr", builtin.lsp_references, desc="See references of word under cursor"},
    {"<leader>fci", builtin.lsp_incoming_calls, desc="Search incoming calls of word under cursor"},
    {"<leader>fco", builtin.lsp_references, desc="Search outgoing calls of word undere cursor"},
    {"<leader>fcd", builtin.lsp_definitions, desc="Search definitions of word under cursor"},
    {"<leader>fct", builtin.lsp_type_definitions, desc="Search type definitions of word under cursor"},
    {"<leader>fcI", builtin.lsp_implementations, desc="Search implementation of word under cursor"},

    {"<leader>fb",builtin.buffers,desc="Search buffers"},

    {"<leader>fh",builtin.help_tags,desc="Search help"},

    {"<leader>fB",builtin.builtin,desc="Prebuilt Telescope pickers"},

    {"<leader>m",group="Bookmarks"},
    {"<leader>mo",expand=require("config.plugins.which-key.bookmarkutils").create_mappings,desc="Bookmarked"},

    -- Requires LuaSnip plugin
    {"<leader>l",group="LuaSnip"},
    {"<leader>le",function()
        require("luasnip.loaders").edit_snippet_files {
        extend = function(filetype, paths)
          if #paths == 0 then
            return {
              { "$CONFIG/" .. filetype .. ".lua",
                string.format("%s/%s.snippets", vim.g.snippetFolder, filetype) }
            }
          end

          return {}
        end
        }
    end,desc="Edit snippets"},
}

M.filetypeSpecific= {
  ["python"]={"<leader>r", function()
    vim.cmd('write')
    local filepath = vim.fn.expand('%:p')
    local output = vim.fn.system("python ".. vim.fn.shellescape(filepath))

    vim.fn.confirm(output, "&OK", 1, "Info")
  end, desc = "Run" }
}

return M
