--      [[ Setting options ]]
--      See `:help vim.opt`

--      make sure terminal using nf
vim.g.have_nerd_font = true
--      line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
--      4 width tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--      detect indent
vim.opt.smartindent = true
--      no highlight AFTER search
vim.opt.hlsearch = false
vim.opt.incsearch = true
--      useful
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
--      keep indent on line wrap
vim.opt.breakindent = true
--      maybe change
vim.opt.undofile = true
--      Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
--      May be better to decrease to 50
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
--      mapleader doesn't timeout
vim.opt.ttimeout = false
--      split to bottom-right
vim.opt.splitright = true
vim.opt.splitbelow = true
--      easily see line indent
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
--      some autocomplete
vim.opt.inccommand = "split"
--      easily see cursor line
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
