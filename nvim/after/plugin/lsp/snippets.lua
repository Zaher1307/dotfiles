-- Snippets
require("luasnip.loaders.from_vscode").lazy_load({
	paths = vim.env.HOME .. "/.vim/plugged/friendly-snippets/",
	include = nil, -- Load all languages
	exclude = {},
})
