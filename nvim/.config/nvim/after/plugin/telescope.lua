local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")
local layout = require("telescope.actions.layout")

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 10000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "\\*lock", ".git", "build" },
		mappings = {
			n = {
				["q"] = actions.close,
				["<C-p>"] = layout.toggle_preview,
			},
			i = {
				["<C-p>"] = layout.toggle_preview,
			},
		},
		buffer_previewer_maker = new_maker,
		preview = {
			hide_on_startup = true,
		},
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>f", function()
	builtin.find_files({
		no_ignore = true,
		hidden = true,
		cwd = vim.fn.FindRootDirectory(),
	})
end)

keymap.set("n", "<leader>r", function()
	builtin.live_grep()
end)

keymap.set("n", "<leader>\\", function()
	builtin.buffers()
end)

keymap.set("n", "<leader>e", function()
	builtin.diagnostics()
end)
