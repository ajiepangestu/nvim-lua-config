-- File Manager
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

nvim_tree.setup {}

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {})

