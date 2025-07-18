return {
  "nono/lezer.vim",
  config = function()
    local vim = vim
    local Plug = vim.fn["plug#"]

    vim.call("plug#begin")
    Plug("nono/lezer.vim")
    vim.call("plug#end")
  end,
}
