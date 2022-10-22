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
    diagnostics.pylint.with({
        prefer_local = ".venv/bin"
    }),
    formatting.autopep8.with({
        prefer_local = ".venv/bin"
    }),

    -- JavaScript, TypeScript
    code_actions.eslint.with({
        prefer_local = "node_modules/.bin"
    }),
    diagnostics.eslint.with({
        prefer_local = "node_modules/.bin"
    }),
    formatting.eslint.with({
        prefer_local = "node_modules/.bin"
    }),

    -- Spell Checker
    diagnostics.codespell,
}

null_ls.setup({
    sources = sources,
    debug = true,
    update_in_insert = true
})
