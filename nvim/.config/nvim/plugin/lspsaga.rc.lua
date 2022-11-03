local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	server_filetype_map = {},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "rn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", ";ca", "<Cmd>Lspsaga code_action<CR>", opts)
