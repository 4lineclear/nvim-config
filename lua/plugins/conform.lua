return { -- Autoformat
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      rust = { "rustfmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      sql = { "sql_formatter", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      ["*"] = { "injected" },
    },
    formatters = {
      injected = {
        options = {
          ignore_errors = true,
          lang_to_ext = {
            sql = "sql",
          },
        },
      },
      sql_formatter = {
        prepend_args = {
          "-c",
          vim.fn.expand("~/.config/sql-formatter/config.json"),
        },
        stdin = true,
      },
      -- sqlfluff = {
      --   prepend_ars = {
      --     "parse",
      --   },
      -- },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    require("utils").nmap(
      "<leader>cf",
      "<cmd>Format<cr>",
      { desc = "[F]ormat file" }
    )
    vim.api.nvim_create_user_command("Format", function(args)
      require("conform").format({ bufnr = args.buf })
    end, {})
  end,
}
