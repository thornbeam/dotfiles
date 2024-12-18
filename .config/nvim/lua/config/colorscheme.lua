--local colorscheme = "vim"
local colorscheme = "vim"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- LSP hover configuration with borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",  -- Set the border style (single, double, rounded, etc.)
  focusable = false,   -- Disable focusing on the hover window
})

-- Custom highlight groups for float window
vim.cmd [[
  highlight clear LineNr
  highlight NormalFloat guibg=NONE
  highlight FloatBorder guibg=NONE guifg=#ffffff
]]
