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

    -- File Manager
    use 'kyazdani42/nvim-tree.lua'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopair
    use 'windwp/nvim-autopairs'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Multi Cursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- Treesitter (Syntax Highlighting)
    use 'nvim-treesitter/nvim-treesitter'

    -- Color Scheme
    use 'navarasu/onedark.nvim'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Bufferline
    use { 'akinsho/bufferline.nvim', tag = 'v2.*' }

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- Telescope (Finder)
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Comment
    use 'terrortylor/nvim-comment'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Auto Complete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- Lua Snip
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    }

    -- Git Commit Label
    use 'lewis6991/gitsigns.nvim'

    -- Terminal Toggle
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- Monokai Pro
    use {
        'https://gitlab.com/__tpb/monokai-pro.nvim',
        as = 'monokai-pro.nvim'
    }

    -- Package Manager
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Packer  Bootsrap
    if packer_bootstrap then
        require('packer').sync()
    end
end)
