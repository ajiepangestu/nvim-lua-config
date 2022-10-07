-- Package Manager
local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

-- LSP Manager
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason.setup {}

mason_lspconfig.setup {
    ensure_installed = {
        'bashls',
        'html',
        'cssls',
        'sumneko_lua',
        'yamlls',
        'jsonls',
        'marksman',
        'pyright',
        'tsserver',
        'volar',
        'intelephense',
    }
}
