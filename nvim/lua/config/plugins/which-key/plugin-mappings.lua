local M={}

local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

M.general =
{
    -- General document mappings
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
    {"<leader>f",group="Find"},
    -- {"<leader>fn",,desc="Navigate"},
    {"<leader>ff",function()
      builtin.find_files({
        find_command = { "fd", "--type", "d", "--type", "f", "--hidden", "--exclude", ".git" },

      })
        end,desc="Search files"},
    {"<leader>fg",function() builtin.live_grep({
    }) end,
    desc="Current file"},
    {"<leader>fo",function() builtin.live_grep({grep_open_files=true})end, desc="Search in open files"},
    {"<leader>fb",builtin.buffers,desc="Search buffers"},
    {"<leader>fh",builtin.help_tags,desc="Search help"},
    {"<leader>fw",function() builtin.grep_string({

    }) end,
    desc="Grep"},
    {"<leader>fB",builtin.builtin,desc="Prebuilt Telescope pickers"},

    {"<leader>m",group="Bookmarks"},
    {"<leader>mo",expand=require("config.plugins.which-key.bookmarkutils").create_mappings,desc="Bookmarked"},

    -- Requires auto-session plugin
    {"<leader>s",group="Session"},
    {"<leader>sw",function() vim.ui.input({prompt = 'Enter session name (leave empty for filepath): '},function(input)require("auto-session").SaveSession(input)end) end,desc="Save current"},
    {"<leader>ss",function()
      require("auto-session.session-lens").search_session()
    end,desc="Search session"},
    {"<leader>sa","<cmd>SessionToggleAutoSave<cr>",desc="Search session"},

    -- Requires LuaSnip plugin
    {"<leader>l",group="LuaSnip"},
    {"<leader>le",function()
        require("luasnip.loaders").edit_snippet_files {
        extend = function(ft, paths)
          if #paths == 0 then
            return {
              { "$CONFIG/" .. ft .. ".lua",
                string.format("%s/%s.snippets", vim.g.snippetFolder, ft) }
            }
          end

          return {}
        end
        }
    end,desc="Edit snippets"},
}
M.filetypeSpecific={}

return M
