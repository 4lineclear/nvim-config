local config = function()
  local config = require("lualine").get_config()
  config.extensions = { "oil" }
  return config
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup(config())
  end,
}
