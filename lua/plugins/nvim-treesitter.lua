-- Treesitter (Syntax Highlighting)
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
    return
end

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'cmake',
        'html',
        'javascript',
        'typescript',
        'css',
        'scss',
        'lua',
        'vim',
        'yaml',
        'json',
        'jsonc',
        'markdown',
        'python',
        'htmldjango',
        'php',
        'vue',
        'dockerfile',
        'c_sharp',
        'cpp',
        'c',
        'gitignore'
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
