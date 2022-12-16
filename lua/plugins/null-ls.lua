-- (Linter, Formatter and Code Actions) Bridge for non LSP
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

-- Code action
local code_actions = null_ls.builtins.code_actions
-- Diagnostic
local diagnostics = null_ls.builtins.diagnostics
-- Formatting
local formatting = null_ls.builtins.formatting

-- Sources
local sources = {
    -- Python
    diagnostics.pylint.with {
        extra_args = {
            '--rc-file=' .. vim.fn.getcwd() .. '/.pylintrc'
        }
    },
    formatting.autopep8,

    -- JavaScript, TypeScript
    code_actions.eslint_d,
    diagnostics.eslint_d,
    formatting.prettier_standard,

    -- Spell Checker
    diagnostics.codespell,
}

null_ls.setup({
    sources = sources,
    debug = true,
    update_in_insert = true
})
    
