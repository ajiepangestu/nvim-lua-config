local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local on_attach = require('keymaps').lsp_on_attach

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- List of supported language server
local language_servers = {
    'bashls', -- bash
    'html', -- html
    'cssls', -- css
    'yamlls', -- yaml
    'jsonls', -- json with comment
    'marksman', -- markdown
    'pyright', -- python
    'eslint', -- javascript
    'tsserver', -- typescript
    'vuels', -- vue
    'intelephense', -- php
}

for _, language_server in pairs(language_servers) do
    lspconfig[language_server].setup {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Lua language server
lspconfig['sumneko_lua'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
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
