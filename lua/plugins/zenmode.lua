return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" } },
  },
  opts = true,
  -- config = function()
  --   vim.api.nvim_create_user_command("SuperZen", function()
  --     require("zen-mode").toggle()
  --   end, {})
  -- end,
}
