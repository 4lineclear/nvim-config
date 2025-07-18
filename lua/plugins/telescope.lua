return {
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
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    local Utils = require("utils")
    local nmap = Utils.nmap

    -- Enable telescope extensions, if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    local nlmap = function(keys, bi, dc)
      nmap("<leader>" .. keys, bi, { desc = dc })
    end
    nlmap("sh", builtin.help_tags, "[S]earch [H]elp")
    nlmap("sk", builtin.keymaps, "[S]earch [K]eymaps")
    nlmap("sf", builtin.find_files, "[S]earch [F]iles")
    nlmap("ss", builtin.builtin, "[S]earch [S]elect Telescope")
    nlmap("sw", builtin.grep_string, "[S]earch current [W]ord")
    nlmap("sg", builtin.live_grep, "[S]earch by [G]rep")
    nlmap("sd", builtin.diagnostics, "[S]earch [D]iagnostics")
    nlmap("sr", builtin.resume, "[S]earch [R]esume")
    nlmap("s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')

    -- Slightly advanced example of overriding default behavior and theme
    nmap("<leader>/", function()
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
    nmap("<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your neovim configuration files
    nmap("<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
    -- Search home dir
    nmap("<leader>se", function()
      builtin.find_files({ cwd = "~" })
    end, { desc = "[S]earch Hom[e]" })
    -- Search project dir
    nmap("<leader>sp", function()
      builtin.find_files({ cwd = "~/project_files/" })
    end, { desc = "[S]earch [P]roject Files" })
  end,
}
