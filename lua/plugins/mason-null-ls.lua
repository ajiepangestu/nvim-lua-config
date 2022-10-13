-- Formatter and Linter Manager
local status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not status_ok then
    return
end

mason_null_ls.setup {
    ensure_installed = {
        -- Formatter
        'autopep8', -- python
        'prettier', -- js, ts, json, md, yaml

        -- Linter
        'pylint', -- python
        'misspell', -- spelling checking
    }
}
