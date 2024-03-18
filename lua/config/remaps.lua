--      [[ Basic Keymaps ]]
--      See `:help vim.keymap.set()`

--      NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--      Reduce boilerplate
local Utils = require("utils")
local nmap = Utils.nmap

--      Utils for buffers
nmap("<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
nmap("<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
nmap("<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })

--      Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
nmap("<leader>Y", [["+Y]])
--      Paste to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
nmap("<leader>P", [["+P]])

--      Diagnostic keymaps
nmap(
  "[d",
  vim.diagnostic.goto_prev,
  { desc = "Go to previous [D]iagnostic message" }
)
nmap(
  "]d",
  vim.diagnostic.goto_next,
  { desc = "Go to next [D]iagnostic message" }
)
nmap(
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror messages" }
)
nmap(
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)

--      Training wheels
nmap("<left>", '<cmd>echo "Use h to move!!"<CR>')
nmap("<right>", '<cmd>echo "Use l to move!!"<CR>')
nmap("<up>", '<cmd>echo "Use k to move!!"<CR>')
nmap("<down>", '<cmd>echo "Use j to move!!"<CR>')

--      Navigate panes
nmap("<C-h>", "<C-w><C-h>", { desc = "left" })
nmap("<C-l>", "<C-w><C-l>", { desc = "right" })
nmap("<C-j>", "<C-w><C-j>", { desc = "lower" })
nmap("<C-k>", "<C-w><C-k>", { desc = "upper" })
--      Resize panes
nmap("<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
nmap("<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
nmap(
  "<C-Left>",
  "<cmd>vertical resize -2<cr>",
  { desc = "Decrease window width" }
)
nmap(
  "<C-Right>",
  "<cmd>vertical resize +2<cr>",
  { desc = "Increase window width" }
)

--      Lazy
nmap("<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
