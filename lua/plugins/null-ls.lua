-- Formatter and Linter
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- Diagnostic
local diagnostics = null_ls.builtins.diagnostics
-- Formatting
local formatting = null_ls.builtins.formatting

-- Sources
local sources = {
	-- Formatter
	-- lua
	formatting.stylua.with({
		filetypes = { "lua" },
	}),
	-- python
	formatting.autopep8.with({
		filetypes = { "python" },
	}),
	-- js, ts, json, md, yaml
	formatting.prettier.with({
		filetypes = { "javascript", "typescript", "json", "markdown", "yaml" },
	}),
	-- php
	formatting.phpcbf.with({
		filetypes = { "php" },
	}),
	-- c
	formatting.clang_format.with({
		filetypes = { "c", "cpp", "cs", "java", "cuda" },
	}),
	-- End of formatter

	-- Linter
	-- dockerfile
	diagnostics.hadolint.with({
		filetypes = { "dockerfile" },
	}),
	-- python
	diagnostics.pylint.with({
		filetypes = { "python" },
	}),
	-- yaml
	diagnostics.yamllint.with({
		filetypes = { "yaml" },
	}),
	-- js, eslint
	diagnostics.eslint.with({
		filetypes = { "javascript", "typescript" },
	}),
	-- markdown
	diagnostics.markdownlint.with({
		filetypes = { "markdown" },
	}),
	-- Spell Checker
	diagnostics.misspell,
}

null_ls.setup({
	sources = sources,
	debug = true,
})
