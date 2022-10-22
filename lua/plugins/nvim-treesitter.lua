-- Treesitter (Syntax Highlighting)
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
    ensure_installed = {
        'bash',
        'make',
        'html',
        'javascript',
        'css',
        'scss',
        'lua',
        'yaml',
        'jsonc',
        'markdown',
        'python',
        'typescript',
        'php',
        'vue',
        'dockerfile'
    },
    sync_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    }
}
