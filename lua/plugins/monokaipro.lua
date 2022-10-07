-- Monokai Pro Theme
local status_ok, monokaipro = pcall(require, "monokaipro")
if not status_ok then
    return
end

vim.g.monokaipro_filter = "spectrum"
vim.cmd [[colorscheme monokaipro]]
