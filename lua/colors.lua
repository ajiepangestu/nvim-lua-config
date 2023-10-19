-- Monokai Pro Theme
local status_ok, _ = pcall(require, 'monokaipro')
if not status_ok then
    return
end

-- vim.g.monokaipro_filter = "spectrum"
vim.g.monokaipro_italic_functions = true
vim.g.monokaipro_flat_term = true
vim.cmd [[colorscheme monokaipro]]

