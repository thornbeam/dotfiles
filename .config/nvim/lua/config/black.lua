vim.api.nvim_create_user_command(
  'Black',
  function()
    vim.cmd('!black %')
  end,
  { nargs = 0 }
)
