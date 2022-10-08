local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Neovim
-------------------------------------------------------------------
-- Change leader to semicolon
vim.g.mapleader = ';'

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jj
map('i', 'jj', '<Esc>')

-- Clear search highlighting
map('n', '<leader>c', ':nohl<CR>')

-- Splig horizontal
map('n', '<leader>[', '<C-w>v')
map('n', '<leader>]', '<C-w>h')

-- Move focus
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Save
map('n', '<leader>w', ':w<CR>')
map('i', '<leader>w', '<C-c>:w<CR>')

-- Close Window
map('n', '<leader>q', ':qa!<CR>')
map('n', '<leader>d', ':q<CR>')
-------------------------------------------------------------------


-- Plugin Configurations
-------------------------------------------------------------------
-- Nvim Tree
map('n', '<C-e>', ':NvimTreeToggle<CR>')

-- Bufferline
map('n', '<leader>p', ':bprevious<CR>')
map('n', '<leader>n', ':bnext<CR>')

-- File Finder
map('n', 'ff', ':Telescope find_files<CR>')
map('n', 'fg', ':Telescope live_grep<CR>')
map('n', 'fb', ':Telescope file_browser<CR>')

-- Terminal
map('n', '<leader>t', ':ToggleTerm<CR>')
map('t', '<leader>t', [[<C-\><C-n>]])

-- Terminal Window
map('t', '<leader>j', [[<Cmd>wincmd j<CR>]])
map('t', '<leader>k', [[<Cmd>wincmd k<CR>]])
map('t', '<leader>l', [[<Cmd>wincmd l<CR>]])
map('t', '<leader>h', [[<Cmd>wincmd h<CR>]])

-- Lazy git
function LAZYGIT_TOGGLE()
    local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true })
    lazygit:toggle()
end
map('n', '<leader>g', '<cmd>lua LAZYGIT_TOGGLE()<CR>')
-------------------------------------------------------------------
