local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

function M.config()
	local servers = {
		"lua_ls",
		"cssls",
		"html",
		"bashls",
		"jsonls",
		"gopls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})

	local mason_tool_installer = require("mason-tool-installer")

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"eslint_d", -- js linter
			"golangci-lint", -- golang linter
			"rubocop", -- ruby linter
		},
	})
end

return M
