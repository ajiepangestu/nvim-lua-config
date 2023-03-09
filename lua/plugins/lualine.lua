-- Statusline
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

lualine.setup {
    options = {
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                separator = {
                    left = '',
                    right = '',
                },
            },
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
            },
            {
                'filename',
                path = 1
            }
        },
        lualine_x = {},
        lualine_y = {
            'progress',
            'location',
        },
        lualine_z = {
            {
                'filetype',
                separator = {
                    left = '',
                    right = '',
                },
            }
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
