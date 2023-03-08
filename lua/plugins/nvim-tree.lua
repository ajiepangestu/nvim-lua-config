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
        highlight_git = true,
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
    },
    diagnostics = {
        enable = true
    },
    view = {
        adaptive_size = true
    }
}

local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
