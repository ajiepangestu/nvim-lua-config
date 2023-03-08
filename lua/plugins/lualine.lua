-- Statusline
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

lualine.setup {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            { 'diagnostics', sources = { 'nvim_lsp' } }
        },
        lualine_c = {
            {
                'filename',
                path = 1
            }
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}
