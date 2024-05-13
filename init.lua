local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

vim.call('plug#end')
