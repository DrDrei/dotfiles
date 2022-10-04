local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Don't show the virtual text
vim.diagnostic.config({
	virtual_text = false,
})

-- All the clients and their configs that we want to use
local clients = {
	sumneko_lua = {
		single_file_support = true,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	tailwindcss = {},
	tsserver = {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
		end,
	},
}

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function()
		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	end,
})

for key, options in pairs(clients) do
	lspconfig[key].setup(options)
end

vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	desc = "LSP actions",
	callback = function(_, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, bufopts)
		vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	end,
})
