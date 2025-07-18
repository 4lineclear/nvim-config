return {
  -- 'neovim/nvim-lspconfig',
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
          "saadparwaiz1/cmp_luasnip",
          "mlaursen/vim-react-snippets",
        },
        "benfowler/telescope-luasnip.nvim",
      },
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      config = function(_, opts)
        if opts then
          require("luasnip").config.setup(opts)
        end
        vim.tbl_map(function(type)
          require("luasnip.loaders.from_" .. type).lazy_load()
        end, { "vscode", "snipmate", "lua" })
        require("vim-react-snippets").lazy_load()
        -- friendly-snippets - enable standardized comments snippets
        local langs = {
          typescript = "tsdoc",
          javascript = "jsdoc",
          lua = "luadoc",
          python = "pydoc",
          rust = "rustdoc",
          cs = "csharpdoc",
          java = "javadoc",
          c = "cdoc",
          cpp = "cppdoc",
          php = "phpdoc",
          kotlin = "kdoc",
          ruby = "rdoc",
          sh = "shelldoc",
        }
        for lang, doc in pairs(langs) do
          require("luasnip").filetype_extend(lang, { doc })
        end
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },

      mapping = cmp.mapping.preset.insert({
        -- Select the [n]ext item
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        -- Accept the completion.
        ["<Enter>"] = cmp.mapping.confirm({ select = true }),

        -- Manually trigger a completion from nvim-cmp.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Move through snippet
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
