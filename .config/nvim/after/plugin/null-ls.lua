local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  -- on_attach = function(client)
  --   if client.resolved_capabilities.document_formatting then
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --   end
  -- end,
  sources = {
    formatting.stylua,
    formatting.prettier,
    diagnostics.eslint,
    completion.spell,
  },
})
