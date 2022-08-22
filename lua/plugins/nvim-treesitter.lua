local status, plugin = pcall(require, 'nvim-treesitter.configs')
if not status then
    return
end
plugin.setup {
    ensure_installed = { "python" },
    highlight = {
        enable = true
    }
}

