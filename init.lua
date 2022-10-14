-- General
require('keymaps')
require('options')

-- Plugins
require('plugins/packer')
require('plugins/bufferline')
-- require('plugins/onedark')
require('plugins/lualine')
require('plugins/mason')
require('plugins/mason-lspconfig')
require('plugins/mason-null-ls')
require('plugins/monokaipro')
require('plugins/null-ls')
require('plugins/gitsigns')
require('plugins/indent-blankline')
require('plugins/nvim-autopairs')
require('plugins/nvim-cmp')
require('plugins/nvim-colorizer')
require('plugins/nvim-comment')
require('plugins/nvim-lspconfig')
require('plugins/nvim-search-and-replace')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/sessions')
require('plugins/telescope')
require('plugins/toggleterm')
require('plugins/vim-multi-cursor')


-- Handle WSL Clipboard
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
        paste = {
            ["+"] = {
                "nvim_paste"
            },
            ["*"] = {
                "nvim_paste"
            }
        },
        cache_enabled = true
    }
end

