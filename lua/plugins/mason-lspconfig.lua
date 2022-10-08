-- LSP Manager
local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
    return
end

mason_lspconfig.setup {
    ensure_installed = {
        'bashls', -- bash
        'html', -- html
        'cssls', -- css
        'sumneko_lua', -- lua
        'yamlls', -- lua
        'jsonls', -- json with comment
        'marksman', -- markdown
        'pyright', -- python
        'tsserver', -- typescript
        'volar', -- vue
        'intelephense', -- php
    }
}