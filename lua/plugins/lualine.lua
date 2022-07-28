local status, plugin = pcall(require, 'lualine')
if not status then
    return
end
plugin.setup {
    sections = {
        lualine_x = {'filetype'}
    },
    options = {
        disabled_filetypes = {
            'NvimTree',
        }
    }
}
