-- Treesitter (Syntax Highlighting)
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
}
