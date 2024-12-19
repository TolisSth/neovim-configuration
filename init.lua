local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Code tree
Plug 'nvim-tree/nvim-tree.lua'
Plug('nvim-tree/nvim-web-devicons')

-- LSP servers
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

-- Code completion
Plug('ms-jpq/coq_nvim')
Plug('ms-jpq/coq.artifacts')

-- Auto pairs
Plug('windwp/nvim-autopairs')

-- Theme
Plug 'ellisonleao/gruvbox.nvim'

-- Syntax highlighting / dependecy for telescope
Plug 'nvim-treesitter/nvim-treesitter'

-- Fuzzy finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- Copilot 
Plug 'github/copilot.vim'

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", "copilot#Accept('<CR>')", { silent = true, expr = true })

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

-- That's telescope, telescope needs ripgrep (Arch: ripgrep & rg) and fd (Arch: fd)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

require('nvim-treesitter.configs').setup {
                ensure_installed = { 'rust', 'python' },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                auto_install = false,
                highlight = {
                    enable = true,
                },
            }
require'lspconfig'.rust_analyzer.setup{}
require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.pyright.setup{}
require("nvim-autopairs").setup {}
require("nvim-tree").setup()

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.wo.number = true

