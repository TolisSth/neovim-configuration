local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

vim.call('plug#end')

-- FYI: You will need to download this first: rustup component add rust-src
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

require'lspconfig'.rust_analyzer.setup{}
require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.pyright.setup{}