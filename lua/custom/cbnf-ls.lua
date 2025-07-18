local util = require("lspconfig.util")

return {
  default_config = {
    cmd = { "/home/yahya/project_files/cbnf/target/debug/cbnf-ls" },
    filetypes = { "cbnf" },
    root_dir = function(fname)
      return util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    init_options = {},
    settings = {
      cbnf = {},
    },
  },
  -- TODO: add commands
  commands = {},
  docs = {
    description = [[
https://github.com/4lineclear/cbnf

An engine for Complex Backus-Naur Form
]],
  },
}
