local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons") -- dope icons
	use("kyazdani42/nvim-tree.lua") -- fancier nerdtree
	use("akinsho/bufferline.nvim") -- nice visual buffer line at the top
	use("moll/vim-bbye") -- quit buffers without accidentally leaving nvim
	use("nvim-lualine/lualine.nvim") -- nice status line
	use("akinsho/toggleterm.nvim") -- floating terminal app
	use("ahmedkhalf/project.nvim") -- automatically cd to the root of a project
	use("lewis6991/impatient.nvim") -- speed up nvim with a byte cache
	use("lukas-reineke/indent-blankline.nvim") -- show the indent depth and current context
	use("goolord/alpha-nvim") -- tasty startup screens
	use("folke/which-key.nvim") -- helpful hotkey exploration
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	-- ported from my older config
	use("tpope/vim-sleuth") -- auto-set indent to match files being openeed
	use("tpope/vim-vinegar") -- way better netrw
	use("tpope/vim-repeat") -- expand repeating to more types of things
	use("tpope/vim-surround") -- expand repeating to more types of things
	use("justinmk/vim-sneak") -- type 's' and 2 characters to sneak around

	-- themes
	use("folke/tokyonight.nvim")
	use("lunarvim/darkplus.nvim")
	use("EdenEast/nightfox.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp server support
	use("hrsh7th/cmp-nvim-lua") -- specifically add nvim lua completion

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- lsp
	use("neovim/nvim-lspconfig") -- enable lsp
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- telescope
	use("nvim-telescope/telescope.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- git
	use("tpope/vim-fugitive") -- amazing git support
	use("lewis6991/gitsigns.nvim") -- nvim native tool

	-- trouble
	use("folke/trouble.nvim") -- tell you all about the trouble your code is causing

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
