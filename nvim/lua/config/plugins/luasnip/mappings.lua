local luasnip = require("luasnip")

vim.keymap.set({"i"}, "<Tab>", function() luasnip.expand() end, {silent = true})
vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
vim.keymap.set({"i"}, "<C-S-K>", function() luasnip.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-j>", function() luasnip.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<M-k>", function() luasnip.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
