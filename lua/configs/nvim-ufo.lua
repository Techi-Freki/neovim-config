local ufo = require("ufo").setup {}
local map = vim.keymap.set
local o = vim.o

-- mappings
map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
map("n", "zM", ufo.closeAllFolds, { desc = "Closes all folds" })
map("n", "zr", ufo.openFoldsExceptKinds, { desc = "Opens folds except kind" })
map("n", "zm", ufo.closeFoldsWith, { desc = "Close all folds" })
map("n", "K", function()
		local winid = ufo.peekFoldedLinesUnderCursor()
		if not winid then
				vim.lsp.buf.hover()
		end
end)
