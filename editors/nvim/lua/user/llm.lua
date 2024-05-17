-- https://github.com/huggingface/llm.nvim#readme

local M = {
	"huggingface/llm.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	local llm = require("llm")

	llm.setup({
		model = "starcoder2:3b",
		url = "http://localhost:11434/api/generate",
		backend = "ollama",
		request_body = {
			parameters = {
				-- stream = true,
				-- max_new_tokens = 60,
				temperature = 0.2,
				top_p = 0.95,
			},
		},
		-- tokens_to_clear = { "<EOT>" },
		tokens_to_clear = { "<|endoftext|>" },
		-- fim = {
		-- 	enabled = true,
		-- 	prefix = "<PRE> ",
		-- 	middle = " <MID>",
		-- 	suffix = " <SUF>",
		-- },
		fim = {
			enabled = true,
			prefix = "<fim_prefix>",
			middle = "<fim_middle>",
			suffix = "<fim_suffix>",
		},
		debounce_ms = 150,
		accept_keymap = "<Tab>",
		dismiss_keymap = "<S-Tab>",
		tls_skip_verify_insecure = false,
		-- llm-ls configuration, cf llm-ls section
		lsp = {
			bin_path = nil,
			host = nil,
			port = nil,
			version = "0.5.2",
		},
		tokenizer = nil,
		context_window = 16384, -- max number of tokens for the context window
		enable_suggestions_on_startup = false,
		-- enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
	})
end

return M
