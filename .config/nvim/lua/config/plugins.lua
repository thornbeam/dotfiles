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

Plug ('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' })

Plug('ckipp01/stylua-nvim')

Plug ('mattn/emmet-vim')

Plug ('rhysd/vim-clang-format')

Plug ('stephpy/vim-php-cs-fixer')

vim.call('plug#end')
