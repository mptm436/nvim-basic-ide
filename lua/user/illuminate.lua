vim.g.Illuminate_ftblacklist = { "alpha", "NvimTree" }
--[[ vim.api.nvim_set_keymap("n", "<C-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<C-p>",
	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
	{ noremap = true }
) ]]
