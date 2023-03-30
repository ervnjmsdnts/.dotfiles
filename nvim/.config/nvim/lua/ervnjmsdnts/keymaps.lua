vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("i", "jk", "<Esc>")

keymap.set("n", "x", '"_x"')

keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "<Space>l", "<C-w>l")
keymap.set("n", "<Space>k", "<C-w>k")
keymap.set("n", "<Space>j", "<C-w>j")
keymap.set("n", "<Space>h", "<C-w>h")
