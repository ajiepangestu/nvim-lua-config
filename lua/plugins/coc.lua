vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = 'yes'

vim.g.coc_global_extensions = {
    'coc-css',
    'coc-html',
    'coc-tsserver',
    'coc-emmet',
    'coc-docker',
    'coc-sql',
    'coc-json',
    'coc-phpls',
    'coc-pyright',
    'coc-lua'
}

local opts = {
    silent = true,
    nowait = true
}

-- COC code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", opts)
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", opts)
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", opts)
vim.keymap.set("n", "gr", "<Plug>(coc-references)", opts)

-- Show Documentation
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', opts)

-- Symbol renaming
vim.keymap.set("n", "<space>r", "<Plug>(coc-rename)", opts)

-- Formatting
vim.keymap.set("x", "<space>f", "<Plug>(coc-format-selected)", opts)
vim.keymap.set("n", "<space>f", "<Plug>(coc-format-selected)", opts)

-- Code Actions
vim.keymap.set("x", "<space>a", "<Plug>(coc-codeaction-selected)", opts)
vim.keymap.set("n", "<space>a", "<Plug>(coc-codeaction-selected)", opts)

-- Show all diagnostics
vim.keymap.set("n", "<space>e", ":<C-u>CocList diagnostics<cr>", opts)

-- Goto diagnostic
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", opts)
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", opts)

-- Outline
vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", opts)

-- Do default action for next item
vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", opts)

-- Do default action for previous item
vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", opts)

-- Resume latest coc list
vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- Auto Completion
opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
}

vim.keymap.set("i", "<c-j>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    opts)
vim.keymap.set("i", "<c-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Format Command
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Fold Command
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Display coc in Statusbar
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
