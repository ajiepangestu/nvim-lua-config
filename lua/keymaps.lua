local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local KEYMAPS = {}

-------------------------------------------------------------------
-- Neovim
-------------------------------------------------------------------
-- Change leader to semicolon
vim.g.mapleader = ';'

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jj
map('i', 'jj', '<Esc>')

-- Clear search highlighting
map('n', '<leader>c', ':nohl<CR>')

-- Split horizontal
map('n', '<leader>[', '<C-w>v')
map('n', '<leader>]', '<C-w>s')

-- Move focus
map('n', '<leader>h', '<C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<leader>l', '<C-w>l')

-- Save
map('n', '<leader>w', ':w<CR>')
map('i', '<leader>w', '<C-c>:w<CR>')

-- Close NeoVIM
map('n', '<leader>q', ':qa!<CR>')


-------------------------------------------------------------------
-- Plugin Configurations
-------------------------------------------------------------------
-- Nvim Tree
map('n', '<C-e>', ':NvimTreeToggle<CR>')
map('n', '<leader>e', ':NvimTreeFocus<CR>')

-- Bufferline
map('n', '<leader>p', ':bp<CR>') -- Goto previous tab
map('n', '<leader>n', ':bn<CR>') -- Goto next tab
map('n', '<leader>d', ':bd<CR>') -- Close tab

-- File Finder
map('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope file_browser<CR>')
map('n', '<leader>fp', ':Telescope projects<CR>')

-- Terminal
map('n', '<leader>t', ':ToggleTerm<CR>')
map('t', '<leader>t', [[<C-\><C-n>]])

-- Terminal Window
map('t', '<leader>j', [[<Cmd>wincmd j<CR>]])
map('t', '<leader>k', [[<Cmd>wincmd k<CR>]])
map('t', '<leader>l', [[<Cmd>wincmd l<CR>]])
map('t', '<leader>h', [[<Cmd>wincmd h<CR>]])

-- Lazy git
function LAZYGIT_TOGGLE()
    local lazygit = require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true })
    lazygit:toggle()
end

map('n', '<leader>g', '<cmd>lua LAZYGIT_TOGGLE()<CR>')

-- COC
local api = vim.api
local cmd = api.nvim_command
local fn = vim.fn
local keyset = vim.keymap.set

-- Auto complete
function _G.check_back_space()
    local col = fn.col('.') - 1
    return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Show Documentation
function _G.show_docs()
    local cw = fn.expand('<cword>')
    if fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        cmd('h ' .. cw)
    elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
    else
        cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- Autocomplete
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    { silent = true, noremap = true, expr = true, replace_keycodes = false }
) -- Goto next autocomplete suggestions
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
    { silent = true, noremap = true, expr = true, replace_keycodes = false }
) -- Goto previous autocomplete suggestions
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    { silent = true, noremap = true, expr = true, replace_keycodes = false }
) -- Select autocomplete suggestion

-- Coding Helper
keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true }) -- Goto next rror
keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true }) -- Goto previous error
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true }) -- Goto definition
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true }) -- Goto  type definition
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true }) -- Goto implementation
keyset("n", "gr", "<Plug>(coc-references)", { silent = true }) -- Goto references
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true }) -- Show documentation
keyset("n", "<space>r", "<Plug>(coc-rename)", { silent = true }) -- Rename variable
keyset("n", "<space>q", ":<C-u>CocList diagnostics<cr>", { silent = true, nowait = true }) -- Show all diagnostics
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", { silent = true, nowait = true }) -- Show all symbols
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", { silent = true, nowait = true }) -- Show outline

-- Code Action
keyset("x", "<space>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
keyset("n", "<space>a", "<Plug>(coc-codeaction-selected)", { silent = true, nowait = true })
keyset("n", "<space>ac", "<Plug>(coc-codeaction)", { silent = true, nowait = true })

-- Format Code
keyset("n", "<space>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("x", "<space>f", "<Plug>(coc-format-selected)", { silent = true })

