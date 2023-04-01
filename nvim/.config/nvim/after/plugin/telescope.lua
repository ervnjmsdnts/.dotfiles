local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "\\*lock", ".git", "build" },
		mappings = {
			n = {
				["q"] = actions.close,
			},
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
