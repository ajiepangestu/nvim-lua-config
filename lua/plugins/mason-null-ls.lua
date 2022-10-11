-- Formatter and Linter Manager
local status_ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not status_ok then
    return
end

mason_null_ls.setup {
    ensure_installed = {
        -- Formatter
        'stylua', -- lua
        'autopep8', -- python
        'prettier', -- js, ts, json, md, yaml
        'phpcbf', -- php
        'clang_format', -- c, cpp, cs, java, cuda

        -- Linter
        'hadolint', -- dockerfile
        'pylint', -- python
        'yamllint', -- yaml
        'eslint_d', -- js
        'cmakelang', -- makefile
        'markdownlint', -- markdown
        'misspell', -- spelling checking
    }
}
