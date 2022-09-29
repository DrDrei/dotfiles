local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lsp_ok then
  return
end

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = {
    'tsserver',
    'sumneko_lua'
  }
})
