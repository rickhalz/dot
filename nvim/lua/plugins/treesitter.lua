vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		underline = true,
		virtual_text = {
			spacing = 5,
			severity_limit = 'Warning',
		},
		update_in_insert = true,
	}
)

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'html', 'javascript', 'lua', 'tsx', 'css', 'json', 'yaml', 'php', 'c', 'rust', 'scss', 'python', 'go',
	},
	highlight = {
		enable = true, additional_vim_regex_highlighting = false
	},
	autotag = {
		enable = true
	},
	rainbow = {
		enable = true,
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = {
		enable = true
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	}
}
