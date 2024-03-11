-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function mapper(mode, lhs, rhs, opts) 
  if opts then
    return function(...)
      vim.keymap.set(mode, lhs, rhs, opts, ...)
    end
  end
  if rhs then
    return function(...)
      vim.keymap.set(mode, lhs, rhs, ...)
    end
  end
  if lhs then
    return function(...)
      vim.keymap.set(mode, lhs, ...)
    end
  end
  if mode then
    return function(...)
      vim.keymap.set(mode, ...)
    end
  end
  return function(...)
      vim.keymap.set(...)
  end
end

-- Utility function
local nmap = mapper("n");
local tmap = mapper("t");

-- Diagnostic keymaps

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

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
tmap(
  "<Esc><Esc>",
  "<C-\\><C-n>",
  { desc = "Exit terminal mode" }
)

nmap("<left>", '<cmd>echo "Use h to move!!"<CR>')
nmap("<right>", '<cmd>echo "Use l to move!!"<CR>')
nmap("<up>", '<cmd>echo "Use k to move!!"<CR>')
nmap("<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
local function mapWMove(d, dName)
  local key = "<C-" .. d .. ">"
  local opts = { desc = "Move focus to the " .. dName .. " window" }
  nmap(key, "<C-w>" .. key, opts)
end

mapWMove("h", "left")
mapWMove("l", "right")
mapWMove("j", "lower")
mapWMove("k", "upper")
