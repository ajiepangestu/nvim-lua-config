-- Formatter and Linter Manager
local status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not status_ok then
    return
end

mason_null_ls.setup {
    ensure_installed = {
        -- Python
        'pylint', -- linter
        'autopep8', -- formatter

        -- JavaScript
        'eslint_d', -- code actions
        'prettier', -- formatter

        -- Spell Checker
        'codespell', -- linter
    }
}
