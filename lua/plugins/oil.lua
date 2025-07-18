return {
  "stevearc/oil.nvim",
  opts = {
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
    -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set(
      "n",
      "<leader><leader>",
      "<CMD>Oil<CR>",
      { desc = "Open parent directory" }
    )
  end,
}
