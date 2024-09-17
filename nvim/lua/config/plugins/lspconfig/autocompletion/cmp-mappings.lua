local cmp= require("cmp")

return {
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-Down>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Up>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-n>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-h>"] = cmp.mapping.abort(), -- close completion window
    ["<C-l>"] = cmp.mapping.confirm({ select = false }),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if cmp.get_selected_entry() then
          cmp.confirm({ select = false })
        else
          cmp.close()
          fallback()
        end
      else
        fallback()
      end
    end, { 'i', 's' }),
    -- ["<CR>"] = function(fallback)
    --   if cmp.visible() and cmp.get_selected_entry() then
    --     cmp.mapping.confirm()
    --   else
    --     fallback()
    --   end
    -- end,
    ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
}
