local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local KEYMAPS = {}

-------------------------------------------------------------------
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

-- Split horizontal
map('n', '<leader>[', '<C-w>v')
map('n', '<leader>]', '<C-w>s')

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
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope file_browser<CR>')

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

-- LSP Config
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts) -- Show error inline
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- Go to next error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- Go to previous error
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts) -- Show all error in opened file

KEYMAPS.lsp_on_attach = function(_, bufnr)
    local buffopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, buffopts) -- Create new directory
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, buffopts) -- Remove directory
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, buffopts) -- Show documentation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buffopts) -- Goto definition, <C-o> go back
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, buffopts) -- Rename variable
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, buffopts) -- Format Code
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, buffopts) -- Code action
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, buffopts) -- Goto references of variable
end

return KEYMAPS
