-- Packer (Neovim Plugin Manager)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- Packer Bootstrap
local packer_bootstrap = ensure_packer()

-- Plugins
return require('packer').startup(function(use)
    -- Packer Plugin Manager
    use 'wbthomason/packer.nvim'

    -- Monokai Pro Theme
    use {
        'https://gitlab.com/__tpb/monokai-pro.nvim',
        as = 'monokai-pro.nvim'
    }

    -- File Manager
    use 'nvim-tree/nvim-tree.lua'

    -- Icons
    use 'nvim-tree/nvim-web-devicons'

    -- Autopair
    use 'windwp/nvim-autopairs'

    -- Multi Cursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- Autotag
    use "windwp/nvim-ts-autotag"

    -- Treesitter (Syntax Highlighting)
    use 'nvim-treesitter/nvim-treesitter'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- Telescope (Finder)
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Comment
    use 'terrortylor/nvim-comment'

    -- COC
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- Package Manager
    -- use 'williamboman/mason.nvim'

    -- LSP Package Manager
    -- use 'williamboman/mason-lspconfig.nvim'

    -- LSP config
    -- use 'neovim/nvim-lspconfig'

    -- Formatter and Linter Package Manager
    -- use 'jayp0521/mason-null-ls.nvim'

    -- Formatter and Linter
    -- use 'jose-elias-alvarez/null-ls.nvim'

    -- Auto Complete
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     requires = {
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline',
    --         'hrsh7th/cmp-vsnip',
    --         'hrsh7th/vim-vsnip'
    --     }
    -- }

    -- Git Commit Label
    use { 'lewis6991/gitsigns.nvim', branch = 'release' }

    -- Terminal Toggle
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- Barbecue
    use {
        'utilyre/barbecue.nvim',
        requires = {
            "SmiteshP/nvim-navic"
        }
    }

    -- Editory Config
    use 'gpanders/editorconfig.nvim'

    -- Bufferline
    use { 'akinsho/bufferline.nvim', tag = "*" }

    -- Indent Blank Line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Better comment
    use 'Djancyp/better-comments.nvim'

    -- Packer  Bootstrap
    if packer_bootstrap then
        require('packer').sync()
    end
end)
