-- :help options for documentation of all of these
local options = {
	backup = false, -- don't create backup files
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- add more space in the command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- tuning for cmp
	conceallevel = 0, -- so `` is visible in markdown files
	fileencoding = "utf-8", -- why do anything else in 2022
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- case sensitive searching sucks
	mouse = "a", -- allow mouse use
	pumheight = 10, -- height of pop up menus
	showmode = false, -- I don't need to see INSERT
	showtabline = 2, -- always show tabs,
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smart again
	splitbelow = true, -- horizontal splits go below
	splitright = true, -- vertical splits exit stage right
	swapfile = false, -- no swap files either. Gross.
	termguicolors = true, -- sexy colors plz
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in ms)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (300ms is faster than 4000ms)
	writebackup = false, -- don't let editing happen if another app has it locked
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- 2 spaces per tab
	tabstop = 4, -- 2 spaces for tab
	cursorline = true, -- highlight the current line
	number = true, -- show line numbers
	relativenumber = false, -- turn off relative numbers. Use absolute, bro
	numberwidth = 4, -- set number column width
	signcolumn = "yes", -- always show the sign column so it doesn't shift text
	wrap = false, -- show lines as one long line
	scrolloff = 8, -- minimum number of lines around the cursor visible
	sidescrolloff = 8, -- same but vertical
	terse = true,
	sm = true,
}

-- old config had 'hidden' on 

vim.opt.shortmess:append "c" -- turn off search/completion messages (x of y)

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "let g:sneak#label = 1" -- turn on a minimmalist alternative to easymotion
vim.cmd "set whichwrap+=<,>,[,],h,l" -- extra keys which enable wrapping at the end of lines
vim.cmd [[set iskeyword+=-]] -- include hyphens as being part of the same `w`ord
