local g = vim.g
local opt = vim.opt

-- General Configurations
opt.mouse = 'a' -- Enable mouse support
opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.cursorline = true -- Show cursor line
opt.completeopt = 'menu,menuone,noselect' -- Autocomplete options
opt.number = true -- Show line number
opt.showmatch = true -- Highlight matching parenthesis
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.undodir = '~/.nvim/data/backup' -- Undo directory
opt.encoding = 'UTF-8' -- Encoding
opt.shortmess:append 'sI' -- Disable NeoVIM Intro

-- Disable builtin plugins
local plugins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
    'tutor',
    'rplugin',
    'synmenu',
    'optwin',
    'compiler',
    'bugreport',
    'ftplugin',
}

for _, plugin in pairs(plugins) do
    g['loaded_' .. plugin] = 1
end

-- Disable Language Provider
local languages = {
    'ruby',
    'perl'
}
for _, language in pairs(languages) do
    g['loaded_' .. language .. '_provider'] = 0
end

-- Python Host
g.python3_host_prog = '~/.virtualenvs/python/bin/python'

