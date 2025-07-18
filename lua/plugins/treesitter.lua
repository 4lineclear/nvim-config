return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    local parser_config =
      require("nvim-treesitter.parsers").get_parser_configs()

    parser_config["cbnf"] = {
      install_info = {
        url = "~/project_files/cbnf/tree-sitter-cbnf/", -- local path or git repo
        -- url = "https://github.com/4lineclear/tree-sitter-cbnf.git", -- local path or git repo
        -- branch = "main", -- default branch in case of git repo if different from master
        files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
      },
      filetype = "cbnf", -- if filetype does not match the parser name
    }

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "heex",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "yaml",
        "toml",
        "json",
        "rust",
        "just",
        "sql",
        "cbnf",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.api.nvim_set_hl(
      0,
      "@lsp.type.string.rust",
      { link = "TSVariable", default = true }
    )
  end,
}
