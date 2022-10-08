local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
-- Show error
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

-- Goto next error
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Goto previous error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

-- Show all error
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
    local buffopts = { noremap = true, silent = true, buffer = bufnr }

    -- Create new directory
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, buffopts)

    -- Remove directory
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, buffopts)

    -- Show documentation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, buffopts)

    -- Goto definition, <C-o> go back
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buffopts)

    -- Rename variable
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, buffopts)

    -- Format Code
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, buffopts)

    -- Code action
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, buffopts)

    -- Goto references of variable
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, buffopts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

-- List of supported language server
local language_servers = {
    'bashls', -- bash
    'html', -- html
    'cssls', -- css
    'yamlls', -- yaml
    'jsonls', -- json with comment
    'marksman', -- markdown
    'pyright', -- python
    'tsserver', -- typescript
    'volar', -- vue
    'intelephense', -- php
}

for _, language_server in pairs(language_servers) do
    lspconfig[language_server].setup {
        flags = lsp_flags,
        on_attach = on_attach
    }
end

-- Lua language server
lspconfig['sumneko_lua'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
-- Diagnostic Symbols
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end
-- Diagnostic Symbols Configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = 'always',
    },
})
