local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  local null_ls = require "null-ls"
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  local formatting = null_ls.builtins.formatting
  --local diagnostics =  null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.gofmt,
      formatting.goimports,
      formatting.rubocop,
      formatting.prettier,
      --formatting.stylua,
      --formatting.black,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- diagnostics.flake8,
      --null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({bufnr = bufnr })
          end
        })
      end
    end
  }
end

return M
