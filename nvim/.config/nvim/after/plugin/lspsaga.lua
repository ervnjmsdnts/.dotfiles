local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	server_filetype_map = {},
	symbol_in_winbar = {
		enable = false,
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap.set("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
keymap.set("n", "rn", "<Cmd>Lspsaga rename<CR>", opts)
keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap.set("n", "<C-t>", "<Cmd>Lspsaga term_toggle<CR>", opts)
