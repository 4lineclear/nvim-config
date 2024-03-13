return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      keymaps = { ["h"] = "actions.parent", ["l"] = "actions.preview" },
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
    })
    vim.keymap.set(
      "n",
      "<leader><leader>",
      "<CMD>Oil<CR>",
      { desc = "Open Dir" }
    )
  end,
}
