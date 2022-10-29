local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = true,
				disable_float_background = true,
				disable_italics = false,
			})

			vim.cmd("colorscheme poimandres")
		end,
	})
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/cmp-path")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("L3MON4D3/LuaSnip")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")

	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")
	use({
		"airblade/vim-rooter",
		config = function()
			vim.api.nvim_set_var("rooter_patterns", { ".git", ".svn", "package.json", "!node_modules" })
		end,
	})
end)
