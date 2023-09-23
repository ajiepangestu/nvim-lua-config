local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

-- Set Debug Log
vim.lsp.set_log_level("off")

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)                  -- Create new directory
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)               -- Remove directory
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)                                         -- Show documentation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)                                   -- Goto definition, <C-o> go back
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)                                  -- Goto declaration
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)                               -- Goto implementation
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)                                   -- Goto references of variable
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)                                 -- Rename variable
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) -- Format Code
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)                            -- Code action
end

-- Set debounce on change code
local lsp_flags = {
    debounce_text_changes = 100,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- List of supported language server
local language_servers = {
    'bashls',       -- bash
    'html',         -- html
    'cssls',        -- css
    'yamlls',       -- yaml
    'jsonls',       -- json with comment
    'marksman',     -- markdown
    'eslint',       -- javascript
    'tsserver',     -- typescript
    'vuels',        -- vue
    'intelephense', -- php
    'omnisharp',    -- c#
    'tailwindcss',  -- tailwind css
    'emmet_ls',     -- emmet
}
for _, language_server in pairs(language_servers) do
    lspconfig[language_server].setup {
        flags = lsp_flags,
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Python language server
lspconfig['pyright'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }

    }
}

-- Lua language server
lspconfig['lua_ls'].setup {
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
local signs = {
    Error = '? ',
    Warn = '? ',
    Hint = '? ',
    Info = '? '
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

-- Diagnostic Symbols Configuration
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    float = {
        source = 'always',
    },
})
