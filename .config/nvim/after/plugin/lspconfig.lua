local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
})

require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
})
