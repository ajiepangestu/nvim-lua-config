-- Telescope (File Finder)
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

telescope.setup {}

telescope.load_extension "file_browser"

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { noremap = true, silent = true })

