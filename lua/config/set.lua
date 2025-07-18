--      [[ Settings options ]]
--      See `:help vim.opt`

vim.g.have_nerd_font = true
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

--      4 width tab default
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

--      detect indent
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.mouse = "a"

-- Wrapped text will continue at same indent
vim.opt.breakindent = true

--      maybe change
vim.opt.undofile = true

--      Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

--      mapleader doesn't timeout
vim.opt.ttimeout = false

vim.opt.splitright = true
vim.opt.splitbelow = true

--      some autocomplete
vim.opt.inccommand = "split"

--      easily see cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

--      for autosession
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"

-- Adding cbnf file support
vim.filetype.add({ extension = { cbnf = "cbnf" } })
-- Adding basm file support
vim.filetype.add({ extension = { basm = "basm" } })
