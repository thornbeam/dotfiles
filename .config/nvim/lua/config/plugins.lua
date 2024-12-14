local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('vim-airline/vim-airline')
Plug ('vim-airline/vim-airline-themes')

Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

Plug ('tpope/vim-fugitive')

Plug ('neovim/nvim-lspconfig')

Plug ('williamboman/mason.nvim')

Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate'})

Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')

Plug ('windwp/nvim-autopairs')

Plug('lukas-reineke/indent-blankline.nvim')

vim.call('plug#end')
