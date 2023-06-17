return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
  settings = {
    python = {
      formatting = { provider = 'black' },
      analysis = {
	autoSearchPaths = true,
	useLibraryCodeForTypes = true,
	diagnosticMode = 'workspace',
      },
    },
  },
}
