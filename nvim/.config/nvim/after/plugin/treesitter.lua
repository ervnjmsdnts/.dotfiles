local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	auto_install = true,
	ensure_installed = {
		"vim",
		"help",
		"tsx",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"javascript",
		"typescript",
		"markdown",
		"markdown_inline",
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
