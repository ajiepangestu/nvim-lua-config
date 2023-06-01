-- Statusline
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

lualine.setup {
    sections = {
        lualine_a = {
            'mode',
        },
        lualine_b = {
            'branch',
            'diff',
        },
        lualine_c = {
            {
                'diagnostics',
                sources = {
                    'nvim_lsp'
                }
            }
        },
        lualine_x = { 'filename' },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'filetype',
        }
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
