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

    -- Gruvbox Theme
    use 'ellisonleao/gruvbox.nvim'

    -- Monokai Pro Theme
    use {
        'https://gitlab.com/__tpb/monokai-pro.nvim',
        as = 'monokai-pro.nvim'
    }

    -- One Dark Theme
    use 'navarasu/onedark.nvim'

    -- File Manager
    use 'nvim-tree/nvim-tree.lua'

    -- Icons
    use 'nvim-tree/nvim-web-devicons'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopair
    use 'windwp/nvim-autopairs'

    -- Multi Cursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- Treesitter (Syntax Highlighting)
    use 'nvim-treesitter/nvim-treesitter'

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

    -- Git Commit Label
    use { 'lewis6991/gitsigns.nvim', tag = 'release' }

    -- Terminal Toggle
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- Search and replace
    use 's1n7ax/nvim-search-and-replace'

    -- Autotag
    use "windwp/nvim-ts-autotag"

    -- Editory Config
    use 'gpanders/editorconfig.nvim'

    -- Project Manager
    use 'ahmedkhalf/project.nvim'

    -- Scrollbar
    use 'petertriho/nvim-scrollbar'

    -- COC
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Packer  Bootstrap
    if packer_bootstrap then
        require('packer').sync()
    end
end)
