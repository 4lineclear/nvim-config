local ignore = {
  "help",
  "alpha",
  "dashboard",
  "neo-tree",
  "Trouble",
  "trouble",
  "lazy",
  "mason",
  "notify",
  "toggleterm",
  "lazyterm",
}

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = ignore,
      },
    },
    main = "ibl",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ignore,
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  { "tpope/vim-sleuth" },
}
