-- General -----------------------------------------------------------
require('keymaps') -- Keymaps Configurations
require('options') -- Neovim Configurations
require('colors')  -- Theme
-- -------------------------------------------------------------------

-- Base Plugins ------------------------------------------------------
require('plugins/packer')                  -- Plugin Manager
require('plugins/lualine')                 -- Statusbar
require('plugins/nvim-tree')               -- File Manager
require('plugins/nvim-treesitter')         -- Syntax Highlighting
require('plugins/nvim-treesitter-context') -- Current Context Identifier
-- -------------------------------------------------------------------

-- Dev Plugins -------------------------------------------------------
require('plugins/coc') -- COC
-- require('plugins/mason')           -- Package manager
-- require('plugins/mason-lspconfig') -- LSP config package manager
-- require('plugins/mason-null-ls')   -- LSP config package manager
-- require('plugins/nvim-lspconfig')  -- LSP config
-- require('plugins/null-ls')         -- LSP config package manager
-- require('plugins/nvim-cmp')        -- Auto complete
-- -------------------------------------------------------------------

-- Additional Plugins ------------------------------------------------
require('plugins/gitsigns')                -- Git commit
require('plugins/indent-blankline')        -- Indent line
require('plugins/nvim-autopairs')          -- Auto close tag
require('plugins/nvim-colorizer')          -- Display color code
require('plugins/nvim-comment')            -- Comment code
require('plugins/telescope')               -- File Finder
require('plugins/toggleterm')              -- Floating Terminal
require('plugins/vim-multi-cursor')        -- Multi select
require('plugins/barbecue')                -- Outline context
-- -------------------------------------------------------------------
