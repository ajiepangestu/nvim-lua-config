-------------------------------------------------------------------
-- Neovim
-------------------------------------------------------------------
-- Change leader to semicolon
vim.g.mapleader = ';'

-- Disable arrow keys
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')

-- Map Esc to jj
vim.keymap.set('i', 'jj', '<Esc>')

-- Clear search highlighting
vim.keymap.set('n', '<leader>c', ':nohl<CR>')

-- Split horizontal
vim.keymap.set('n', '<leader>[', '<C-w>v')
vim.keymap.set('n', '<leader>]', '<C-w>s')

-- Move focus
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')

-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('i', '<leader>w', '<C-c>:w<CR>')

-- Close NeoVIM
vim.keymap.set('n', '<leader>q', ':qa!<CR>')


-------------------------------------------------------------------
-- Plugin Configurations
-------------------------------------------------------------------
-- Nvim Tree
vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>')

-- Bufferline
vim.keymap.set('n', '<leader>p', ':bp<CR>') -- Goto previous tab
vim.keymap.set('n', '<leader>n', ':bn<CR>') -- Goto next tab
vim.keymap.set('n', '<leader>d', ':bd<CR>') -- Close tab

-- File Finder
vim.keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<CR>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>')

-- Terminal
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')
vim.keymap.set('t', '<leader>t', [[<C-\><C-n>]])

-- Terminal Window
vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]])
vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]])

-- Lazy git
function LAZYGIT_TOGGLE()
    local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true })
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>g', '<cmd>lua LAZYGIT_TOGGLE()<CR>')

-- LSP Config
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true }) -- Show error inline
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })        -- Go to next error
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })        -- Go to previous error
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true }) -- Show all error in opened file

-- Search box
vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')

-- Treesitter Context
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

