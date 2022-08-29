-- Variable
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Disable ruby
g['loaded_ruby_provider'] = 0

-- Disable Perl
g['loaded_perl_provider'] = 0

-- Python 3 Default
g['python3_host_prog'] = '~/.env/python/python3.8/bin/python'

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noinsert,noselect'

-- NeoVIM Theme
g.monokaipro_filter = "spectrum"
cmd[[colorscheme monokaipro]]

-- NeoVIM UI
opt.number = true
opt.showmatch = true
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true

-- Tabs, Indent
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Disable NeoVIM Intro
opt.shortmess:append "sI"

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}
for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 0
end

