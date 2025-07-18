return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("tokyonight-night")
  end,
}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "latte",
--     })
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }

-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("github-theme").setup({})
--     vim.cmd("colorscheme github_light")
--   end,
-- }

-- return {
--   "EdenEast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nightfox").setup({
--       options = {
--         styles = {
--           keywords = "italic,bold",
--           conditionals = "italic,bold",
--           constants = "bold",
--           operators = "bold",
--         },
--       },
--     })
--     vim.cmd.colorscheme("duskfox")
--   end,
-- }

-- return {
--   "Mofiqul/dracula.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("dracula")
--   end,
-- }

-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("catppuccin-mocha")
--   end,
-- }
