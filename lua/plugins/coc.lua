-- Local Variable
local g = vim.g
local opt = vim.opt

-- Additional Configuration
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.signcolumn = 'yes'

-- COC Extensions
g.coc_global_extensions = {
    'coc-clangd',
    'coc-css',
    'coc-cssmodules',
    'coc-docker',
    'coc-eslint',
    'coc-html',
    'coc-json',
    'coc-lua',
    'coc-prettier',
    'coc-pyright',
    'coc-spell-checker',
    'coc-tslint-plugin',
    'coc-tsserver',
    'coc-vetur',
    'coc-yaml'
}
