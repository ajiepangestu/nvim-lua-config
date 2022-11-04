-- Gruvbox Theme
--------------------------------------------------------
-- local status_ok, _ = pcall(require, 'gruvbox')
-- if not status_ok then
--     return
-- end
-- vim.o.background = 'dark'
-- vim.cmd([[colorscheme gruvbox]])

-- One Dark Theme
--------------------------------------------------------
-- local status_ok, onedark = pcall(require, 'onedark')
-- if not status_ok then
--     return
-- end
-- onedark.setup {
--     style = 'deep'
-- }
-- onedark.load()

-- Monokai Theme
--------------------------------------------------------
local status_ok, _ = pcall(require, 'monokaipro')
if not status_ok then
    return
end
vim.cmd [[colorscheme monokaipro]]
