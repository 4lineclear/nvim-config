return {
  "rmagatti/auto-session",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("auto-session").setup({
      log_level = "error",
    })
    require("lualine").setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_c = { require("auto-session.lib").current_session_name },
      },
    })
  end,
}
