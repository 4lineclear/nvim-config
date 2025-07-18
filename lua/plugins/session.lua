-- return {
--   "rmagatti/auto-session",
--   config = function()
--     ---@diagnostic disable-next-line: missing-fields
--     require("auto-session").setup({
--       log_level = "error",
--     })
--     require("lualine").setup({
--       sections = {
--         lualine_c = { require("auto-session.lib").current_session_name },
--       },
--     })
--   end,
-- }
return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
    { "<leader>ww", "<cmd>SessionSave<CR>", desc = "Save session" },
    {
      "<leader>wa",
      "<cmd>SessionToggleAutoSave<CR>",
      desc = "Toggle autosave",
    },
  },
  config = function(opts)
    require("auto-session").setup(opts)
    require("lualine").setup({
      sections = {
        lualine_c = { require("auto-session.lib").current_session_name },
      },
    })
  end,
}
