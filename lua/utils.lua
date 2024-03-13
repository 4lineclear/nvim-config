local function mapper(mode, lhs, rhs, opts)
  if opts then
    return function()
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
  if rhs then
    return function(...)
      vim.keymap.set(mode, lhs, rhs, ...)
    end
  end
  if lhs then
    return function(...)
      vim.keymap.set(mode, lhs, ...)
    end
  end
  if mode then
    return function(...)
      vim.keymap.set(mode, ...)
    end
  end
  return function(...)
    vim.keymap.set(...)
  end
end

local Utils = {
  mapper = mapper,
  map = mapper(),
  nmap = mapper("n"),
  tmap = mapper("t"),
}

return Utils
