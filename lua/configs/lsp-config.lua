local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").pyright.setup{}

require("lspconfig").html.setup{ capabilities = capabilities }
require("lspconfig").jsonls.setup{ capabilities = capabilities }
require("lspconfig").cssls.setup{ capabilities = capabilities }

require("lspconfig").csharp_ls.setup{}
require("lspconfig").markdown_oxide.setup{}
require("lspconfig").vuels.setup{}
