--local colorscheme = "vim"
local colorscheme = "vim"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.cmd('hi clear LineNr')
vim.cmd('hi NormalFloat guibg=NONE')
vim.cmd('hi FloatBorder guifg=white guibg=NONE')
