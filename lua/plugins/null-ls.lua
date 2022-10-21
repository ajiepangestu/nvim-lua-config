-- Formatter and Linter
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

    -- JS, TS
    code_actions.eslint.with({
        prefer_local = "node_modules/.bin"
    }),
    diagnostics.eslint.with({
        prefer_local = "node_modules/.bin"
    }),
    formatting.prettier.with({
        prefer_local = "node_modules/.bin"
    }),

    -- Spell Checker
    code_actions.cspell.with {
        filetypes = { '*' }
    },
    diagnostics.misspell.with {
        filetypes = { '*' }
    },
}

null_ls.setup({
    sources = sources,
    debug = false,
    update_in_insert = true
})
