local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- more control over if you format or not
_G.conditional_formatting = function()
	if vim.bo.filetype ~= "markdown" then
		vim.lsp.buf.formatting_sync()
	end
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
null_ls.setup({
	debug = false,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
	augroup LspFormatting
		autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua conditional_formatting()
	augroup END
]])
		end
	end,
	sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.gofmt,
		formatting.goimports,
		diagnostics.markdownlint,
		diagnostics.write_good,
	},
})
