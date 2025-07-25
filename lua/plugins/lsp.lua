return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "folke/neodev.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    -- local lspconfig = require("lspconfig")
    -- local configs = require("lspconfig.configs")
    -- if not configs["cbnf_ls"] then
    --   configs["cbnf_ls"] = require("../custom/cbnf-ls")
    --   vim.keymap.set("n", "<leader>dr", function()
    --     vim.cmd([[LspRestart cbnf_ls]])
    --     vim.cmd(
    --       [[! kill $(pgrep -f /home/yahya/project_files/cbnf/target/debug/cbnf-ls)]]
    --     )
    --   end, { desc = "Restart cbnf-ls" })
    -- end
    -- if not configs["basm_ls"] then
    --   configs["basm_ls"] = require("../custom/basm-ls")
    --   vim.keymap.set("n", "<leader>dr", function()
    --     vim.cmd([[LspRestart basm_ls]])
    --     vim.cmd(
    --       [[! kill $(pgrep -f /home/yahya/project_files/basm/target/debug/basm-ls)]]
    --     )
    --   end, { desc = "Restart basm-ls" })
    -- end
    -- lspconfig.basm_ls.setup({})

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

        local builtin = require("telescope.builtin")
        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-T>.
        map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")

        -- Find references for the word under your cursor.
        map("gr", builtin.lsp_references, "[G]oto [R]eferences")

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Fuzzy find all the symbols in your current workspace
        --  Similar to document symbols, except searches over your whole project.
        map(
          "<leader>ws",
          builtin.lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        -- Add visual mode cde action
        vim.keymap.set(
          "v",
          "<leader>ca",
          vim.lsp.buf.code_action,
          { buffer = event.buf, desc = "LSP: " .. "[C]ode [A]ction" }
        )

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map("K", vim.lsp.buf.hover, "Hover Documentation. Redo to navigate")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      "force",
      capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            -- extraEnv = {
            --   RUSTFLAGS = "--cfg rust_analyzer",
            -- },
            procMacro = {
              enable = true,
            },
          },
        },
      },
      ts_ls = {
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      },
      -- cbnf = require("../custom/cbnf-ls"),
    }

    require("mason").setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- Used to format lua code
      "rust-analyzer", -- Rust LSP
      "ts_ls", -- ts
    })
    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
    })

    require("lspconfig").gleam.setup({})

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend(
            "force",
            {},
            capabilities,
            server.capabilities or {}
          )
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
