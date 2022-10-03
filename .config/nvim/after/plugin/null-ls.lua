local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
  sources = {
    formatting.prettier.with {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "solidity",
      },
      prefer_local = 'node_modules/.bin'
    },
    formatting.stylua,
    diagnostics.eslint.with({
      prefer_local = 'node_modules/.bin'
    }),
    code_actions.eslint.with({
      prefer_local = 'node_modules/.bin'
    }),
    completion.spell,
  },
})
