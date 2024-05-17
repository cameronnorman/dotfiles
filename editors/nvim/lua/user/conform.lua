local M = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt" },
			ruby = { "rubocop" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			sql = { "sqlfluff" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
			quiet = true,
			async = true,
		},
		config = true,
	})
end

return M
