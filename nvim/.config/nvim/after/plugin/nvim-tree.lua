local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

local status_config, nvim_tree_config = pcall(require, "nvim-tree.config")
if not status_config then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	open_on_setup = true,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			error = " ",
			warning = " ",
			hint = " ",
			info = " ",
		},
	},
	git = {
		enable = true,
		timeout = 500,
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	view = {
		width = 30,
		hide_root_folder = false,
		adaptive_size = true,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "h", cb = tree_cb("close_node") },
			},
		},
		number = false,
		relativenumber = false,
	},
})

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
