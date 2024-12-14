require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.docker_compose_language_service.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.kotlin_language_server.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.ts_ls.setup{}

-- Customizing how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Show line diagnostics automatically in hover window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, border="rounded"})
  end
})
