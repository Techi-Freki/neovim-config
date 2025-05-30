local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_argroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.formatting_seq_sync() end
		})
	end
end

capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").pyright.setup{}
require("lspconfig").ts_ls.setup{
	on_attach = on_attach,
	filetypes = { "typescript" },
	cmd = { "typescript-language-server", "--stdio" }
}
require("lspconfig").volar.setup{}

require("lspconfig").html.setup{ capabilities = capabilities }
require("lspconfig").jsonls.setup{ capabilities = capabilities }
require("lspconfig").cssls.setup{ capabilities = capabilities }

require("lspconfig").emmet_language_server.setup{}
require("lspconfig").csharp_ls.setup{}
require("lspconfig").markdown_oxide.setup{}
require("lspconfig").vuels.setup(
		{ opt = { commentstring = "//", } }
)
