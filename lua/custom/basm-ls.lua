local util = require("lspconfig.util")

return {
  default_config = {
    cmd = { "/home/yahya/project_files/basm/target/debug/basm-ls" },
    filetypes = { "basm" },
    root_dir = function(fname)
      return util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    init_options = {},
    settings = {
      basm = {},
    },
  },
  -- TODO: add commands
  commands = {},
  docs = {
    description = [[
https://github.com/4lineclear/basm

An engine for basic asm
]],
  },
}
