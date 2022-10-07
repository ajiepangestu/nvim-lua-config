-- File Manager
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

nvim_tree.setup {
    auto_reload_on_write = true,
    filters = {
        dotfiles = false,
        custom = { '^.git$' }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
    }
}
