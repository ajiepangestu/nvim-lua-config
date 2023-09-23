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
        'json',
        'jsonc',
        'markdown',
        'python',
        'typescript',
        'php',
        'vue',
        'dockerfile',
        'c_sharp',
        'cpp',
        'c'
    },
    sync_install = false,
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
