-- Terminal
local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup {
    direction = 'float',
    float_opts = {
        border = 'curved'
    }
    shade_terminals = false
}

-- Keymap
local opts = {}
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', opts)
vim.api.nvim_set_keymap('t', '<leader>c', [[<C-\><C-n>]], opts)
vim.api.nvim_set_keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.api.nvim_set_keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.api.nvim_set_keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.api.nvim_set_keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)

-- Lazy git
local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

