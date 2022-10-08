-- Search and replace
local status_ok, nvim_search_and_replace = pcall(require, 'nvim-search-and-replace')
if not status_ok then
    return
end

nvim_search_and_replace.setup {
    -- File patterns to ignore
    ignore = { '**/node_modules/**', '**/.git/**', '**/.gitignore', '**/.gitmodules', 'build/**' },

    -- Save the changes after replace
    update_changes = false,

    -- Keymap for search and replace
    replace_keymap = '<leader>gr',
}
