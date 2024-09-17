-- Autocompletion
local cmp = require("cmp")

local luasnip = require("luasnip")

local kind_icons = {
  article = "󰧮",
  book = "",
  incollection = "󱓷",
  Function = "󰊕",
  Constructor = "",
  Text = "󰦨",
  Method = "",
  Field = "󰅪",
  Variable = "󱃮",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰚯",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "󰌁",
  -- Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  -- spell = "",
  -- EnumMember = "",
  Constant = "󰀫",
  Struct = "",
  -- Struct = "",
  Event = "",
  Operator = "󰘧",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({

  completion = {
    -- completeopt = "menuone,noselect,preview",
    -- completeopt = "menuone,preview,noinsert,noselect",
    keyword_length = 2,
  },
  snippet = {     -- configure how nvim-cmp interacts with snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert(require("config.plugins.lspconfig.autocompletion.cmp-mappings")),
  -- formatting for autocompletion
  formatting = {
    expandable_indicator = false,
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])     -- Kind icons
      vim_item.menu = ({
        -- vimtex = (vim_item.menu ~= nil and vim_item.menu or "[VimTex]"),
        -- vimtex = test_fn(vim_item.menu, entry.source.name),
        -- vimtex = vim_item.menu,
        luasnip = "[Snippet]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        spell = "[Spell]",
        -- orgmode = "[Org]",
        -- latex_symbols = "[Symbols]",
        cmdline = "[CMD]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  -- matching={
  --   disallow_fuzzy_matching = false,
  -- },
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },     -- snippets
    -- { name = "vimtex" },
    -- { name = "orgmode" },
    -- { name = "pandoc" },
    -- { name = "omni" },
    { name = "buffer",  keyword_length = 3 },    -- text within current buffer
    {
      name = "spell",
      keyword_length = 4,
      option = {
        keep_all_entries = false,
      },
    },
    { name = "path" },
  }),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  view = {
    docs={auto_open=true},
    entries = 'custom',
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    completion = {
      border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║"},
      scrollbar=true,
      -- { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  -- performance = {
  --   trigger_debounce_time = 500,
  --   throttle = 550,
  --   fetching_timeout = 80,
  -- },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' },
    { name = 'cmdline' }
  }
})
