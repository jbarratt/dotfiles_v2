local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {
		"lua",
		"bash",
		"css",
		"dot",
		"go",
		"gomod",
		"hcl",
		"html",
		"java",
		"javascript",
		"json",
		"make",
		"markdown",
		"python",
		"typescript",
	},
	sync_install = false,
	ignore_install = { "" }, -- list of parsers to skip if issues
	highlight = {
		enable = "true",
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml", "go" } },
	rainbow = {
		enable = true,
		extended_mode = true, -- also highight html tags, etc
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
