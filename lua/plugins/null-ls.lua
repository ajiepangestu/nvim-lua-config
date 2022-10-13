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
	code_actions.pylint,
	diagnostics.pylint,
	formatting.autopep8,

	-- JS, TS
	code_actions.eslint,
	diagnostics.eslint,
	formatting.prettier,

	-- Spell Checker
	diagnostics.misspell,
}

null_ls.setup({
	sources = sources,
	debug = true,
})
