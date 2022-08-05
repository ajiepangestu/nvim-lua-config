local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------------------------------------
-- NeoVIM Configurations
-------------------------------------------------
-- Change leader to a space
vim.g.mapleader = ' '

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Change split orientation
map('n', '<leader>th', '<C-w>t<C-w>K')
map('n', '<leader>tv', '<C-w>t<C-w>H')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Save
map('n', '<leader>w', ':w<CR>')

-- Close Editor
map('n', '<leader>d', ':q<CR>')

-- Force Close Editor
map('n', '<leader>dd', ':q!<CR>')

-------------------------------------------------
-- Plugins Configurations
-------------------------------------------------

-- NVIM Tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')

-- Telescope
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')

-- Bufferline
map('n', '<leader>b', ':BufferlineToggle<CR>')
map('n', '<leader>p', ':bprevious<CR>')
map('n', '<leader>n', ':bnext<CR>')

