-- Treesitter (Syntax Highlighting)
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
    return
end

require('nvim-treesitter.configs').setup {
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
        enable = true
    }
}
