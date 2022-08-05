local status, plugin = pcall(require, 'gitsigns')
if not status then
    return
end
plugin.setup {
    current_line_blame = true,
    numhl = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
        ignore_whitespace = false
    },
}

