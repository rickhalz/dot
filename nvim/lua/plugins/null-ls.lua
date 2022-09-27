local null_ls = require('null-ls')

local fmt = null_ls.builtins.formatting
local dgn = null_ls.builtins.diagnostics
local cda = null_ls.builtins.code_actions

null_ls.setup {
	sources = {
		-- Formatting --
		fmt.trim_whitespace.with({
			filetypes = { 'text', 'zsh', 'make', 'conf' },
		}),
		fmt.prettier,
		fmt.black,
		fmt.gofmt,
		fmt.clang_format,
		fmt.cmake_format,
		fmt.rustfmt,
		fmt.eslint_d,
		fmt.shfmt,
		fmt.stylua,
		-- Diagnostics --

		dgn.eslint_d,
		dgn.shellcheck,
		dgn.flake8,

		-- CodeActions --
		cda.eslint_d,
		cda.shellcheck,
	},
}
