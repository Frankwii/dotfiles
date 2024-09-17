local luasnip = require("luasnip")
local opts={noremap = true, silent = true}

vim.keymap.set({"i"}, "<C-Tab>",luasnip.expand, opts)
vim.keymap.set({"i", "s"}, "<M-l>", function() luasnip.jump(1) end, opts)
vim.keymap.set({"i", "s"}, "<M-j>", function() luasnip.jump(1) end, opts)
vim.keymap.set({"i", "s"}, "<M-h>", function() luasnip.jump(-1) end, opts)
vim.keymap.set({"i", "s"}, "<M-k>", function() luasnip.jump(-1) end, opts)

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, opts)
