-- Git Blame Label
local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
    return
end

gitsigns.setup {
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
        ignore_whitespace = false,
    },
    signs = {
        add = { text = '+' },
        delete = { text = '-' },
        change = { text = '~' }
    }
}
