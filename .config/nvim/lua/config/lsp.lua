require(".config.lsp.bashls")
require(".config.lsp.clangd")
require(".config.lsp.docker_compose_language_service")
require(".config.lsp.dockerls")
require(".config.lsp.html")
require(".config.lsp.intelephense")
require(".config.lsp.kotlin_language_server")
require(".config.lsp.lua_ls")
require(".config.lsp.phpactor")
require(".config.lsp.pylsp")
require(".config.lsp.pyright")
require(".config.lsp.tailwindcss")
require(".config.lsp.ts_ls")
require(".config.lsp.vtsls")

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
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
