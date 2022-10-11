-- Monokai Pro Theme
local status_ok, _ = pcall(require, 'monokaipro')
if not status_ok then
    return
end

vim.g.monokaipro_filter = 'octogon'
vim.cmd [[colorscheme monokaipro]]
