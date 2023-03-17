-- Statusline
local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

lualine.setup {
    options = {
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                separator = {
                    left = '',
                    right = ''
                },
            },
        },
        lualine_b = {
            {
                'branch',
                separator = {
                    right = ''
                }
            },
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
        lualine_x = {},
        lualine_y = {
            'progress'
        },
        lualine_z = {
            {
                'filetype',
                separator = {
                    left = ''
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
