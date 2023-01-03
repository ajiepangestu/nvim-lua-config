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
        'eslint', -- javascript
        'pyright', -- python
        'tsserver', -- typescript
        'vuels', -- vue
        'intelephense', -- php
        'omnisharp', -- c#
        'tailwindcss', -- tailwind css
        'emmet_ls', -- emmet
    }
}
