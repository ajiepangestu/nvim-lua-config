-- Toggle Terminal
local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
    return
end

toggleterm.setup {
    direction = 'float',
    float_opts = {
        border = 'curved'
    }
}

-- Lazy git
local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

