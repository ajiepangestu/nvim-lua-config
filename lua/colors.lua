-- Monokai Pro Theme
local status_ok, monokai_pro = pcall(require, 'monokai-pro')
if not status_ok then
    return
end

monokai_pro.setup {}
vim.cmd([[colorscheme monokai-pro]])
