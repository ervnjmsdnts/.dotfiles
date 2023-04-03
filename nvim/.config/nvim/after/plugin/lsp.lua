local status, lsp = pcall(require, "lsp-zero")
if not status then
	return
end

lsp.preset({ name = "recommended", set_lsp_keymaps = false, manage_nvim_cmp = { set_sources = "recommended" } })

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
})

lsp.set_sign_icons({
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

local cmp = require("cmp")
local cmp_action = lsp.cmp_action()

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<C-Space>"] = cmp_action.toggle_completion(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
})

lsp.setup()
