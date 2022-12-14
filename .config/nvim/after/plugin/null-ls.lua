local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
		end
	end,
	sources = {
		formatting.prettierd,
		formatting.stylua,
		diagnostics.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		code_actions.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
	},
})
