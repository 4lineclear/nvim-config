return { -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    -- Enable telescope extensions, if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    local nmap_leader = function(keys, bi, dc)
      vim.keymap.set("n", "<leader>" .. keys, bi, { desc = dc })
    end
    nmap_leader("sh", builtin.help_tags, "[S]earch [H]elp")
    nmap_leader("sk", builtin.keymaps, "[S]earch [K]eymaps")
    nmap_leader("sf", builtin.find_files, "[S]earch [F]iles")
    nmap_leader("ss", builtin.builtin, "[S]earch [S]elect Telescope")
    nmap_leader("sw", builtin.grep_string, "[S]earch current [W]ord")
    nmap_leader("sg", builtin.live_grep, "[S]earch by [G]rep")
    nmap_leader("sd", builtin.diagnostics, "[S]earch [D]iagnostics")
    nmap_leader("sr", builtin.resume, "[S]earch [R]esume")
    nmap_leader(
      "s.",
      builtin.oldfiles,
      '[S]earch Recent Files ("." for repeat)'
    )
    nmap_leader("<leader>", builtin.buffers, "[ ] Find existing buffers")
    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        })
      )
    end, { desc = "[/] Fuzzily search in current buffer" })
    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
