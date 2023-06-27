local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Don't show the virtual text
vim.diagnostic.config({
	virtual_text = false,
})

-- All the clients and their configs that we want to use
local servers = {
	tsserver = {},
	lua_ls = {
		diagnostics = {
			globals = { "vim" },
		},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)

local on_attach = function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

	nmap("ga", vim.lsp.buf.code_action, "[G]ode [A]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	-- nmap('<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '[W]orkspace [L]ist Folders')

	-- vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })

	-- Document Formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	end
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })

	-- if client.server_capabilities.documentHighlightProvider then
	--   vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
	--   vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
	--   vim.api.nvim_create_autocmd("CursorHold", {
	--     callback = vim.lsp.buf.document_highlight,
	--     buffer = bufnr,
	--     group = "lsp_document_highlight",
	--     desc = "Document Highlight",
	--   })
	--   vim.api.nvim_create_autocmd("CursorMoved", {
	--     callback = vim.lsp.buf.clear_references,
	--     buffer = bufnr,
	--     group = "lsp_document_highlight",
	--     desc = "Clear All the References",
	--   })
	-- end
end

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})
