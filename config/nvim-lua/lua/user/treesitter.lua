local configs = require("nvim-treesitter.configs")
configs.setup({
	incremental_selection = {
		enable = enable,
		keymaps = {
			-- mappings for incremental selection (visual mappings)
			init_selection = "gnn", -- maps in normal mode to init the node/scope selection
			node_incremental = "grn", -- increment to the upper named parent
			scope_incremental = "grc", -- increment to the upper scope (as defined in locals.scm)
			node_decremental = "grm", -- decrement to the previous node
		},
	},
	textobjects = {
		-- syntax-aware textobjects
		enable = enable,
		lsp_interop = {
			enable = enable,
			peek_definition_code = {
				["DF"] = "@function.outer",
				["DF"] = "@class.outer",
			},
		},
		keymaps = {
			["iL"] = {
				-- you can define your own textobjects directly here
				go = "(function_definition) @function",
			},
			-- or you use the queries from supported languages with textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["aC"] = "@class.outer",
			["iC"] = "@class.inner",
			["ac"] = "@conditional.outer",
			["ic"] = "@conditional.inner",
			["ae"] = "@block.outer",
			["ie"] = "@block.inner",
			["al"] = "@loop.outer",
			["il"] = "@loop.inner",
			["is"] = "@statement.inner",
			["as"] = "@statement.outer",
			["ad"] = "@comment.outer",
			["am"] = "@call.outer",
			["im"] = "@call.inner",
		},
		move = {
			enable = enable,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = enable,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
					go = "(method_declaration) @function",
				},
			},
		},
		swap = {
			enable = enable,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
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
			"pcl",
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
	},
})
