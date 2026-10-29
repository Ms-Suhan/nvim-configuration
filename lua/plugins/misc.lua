-- 1. Put the logic OUTSIDE and ABOVE the return table
local function apply_transparency()
  local groups = {
    "Normal", 
    "NormalNC", 
    "SignColumn",
    "NeoTreeNormal", 
    "NeoTreeNormalNC", 
    "NeoTreeSignColumn", 
    "NeoTreeEndOfBuffer",
    "WinSeparator",
    "NeoTreeWinSeparator",
    "ToggleTerm"
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

apply_transparency()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = apply_transparency,
})

-- 2. Return a clean, empty table at the very bottom for lazy.nvim
return {}

