local luasnip = require("luasnip")
local opts={noremap = true, silent = true}

vim.keymap.set({"i"}, "<C-Tab>",luasnip.expand, opts)
vim.keymap.set({"i", "s"}, "<C-l>", function() luasnip.jump(1) end, opts)
vim.keymap.set({"i", "s"}, "<C-h>", function() luasnip.jump(-1) end, opts)

vim.keymap.set({"i", "s"}, "<C-n>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, opts)

vim.keymap.set({"i", "s"}, "<C-p>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end, opts)
