local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- basic functionality
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
map("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })

-- terminal mode
map("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window bindings
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<leader>w", "<cmd>close<CR>", { desc = "Closes the current window" })

-- tab bindings
map("n", "<leader>Tn", "<cmd>tabnew<CR>", { desc = "Opens tabpage after the current one" })
map("n", "<leader>Tb", "<cmd>-tabnew<CR>", { desc = "Opens tabpage before the current one" })
map("n", "<leader>Ta", "<cmd>+tabnew<CR>", { desc = "Opens tabpage after the next tabpage" })
map("n", "<leader>Tf", "<cmd>0tabnew<CR>", { desc = "Opens tabpage before the first one" })
map("n", "<leader>Tl", "<cmd>$tabnew<CR>", { desc = "Opens tabpage after the last one" })
map("n", "TL", "<cmd>+tabn<CR>", { desc = "Navigates to the next tabpage" })
map("n", "TH", "<cmd>-tabn<CR>", { desc = "Navigates to the previous tabpage" })
map("n", "<leader>T?", "<cmd>h tabnew<CR>", { desc = "Opens the tab help page" })

-- buffer bindings
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycles to the next buffer in the bufferline" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycles to the previous buffer in the bufferline" })
map("n", "<leader>b", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Closes the current buffer without closing the window" })

-- [[ Plugin Bindings --]]

-- neo-tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggles the file explorer" })

-- themery
map("n", "<leader>cs", "<cmd>Themery<CR>", { desc = "Toggles the theme picker" })

-- toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm size=24 direction=horizontal<CR>", { desc = "Opens a horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=64 direction=vertical<CR>", { desc = "Opens a vertical terminal" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Opens a tab terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Opens a floating terminal" })

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", { desc = "Find files"})
map("n", "<leader>fg", builtin.live_grep, { desc = "File using grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find in buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })

-- peek
map("n", "<leader>md", "<cmd>PeekOpen<CR>", { desc = "Open markdown document in browser" })

-- todo-comments
map("n", "<leader>tn", "<cmd>TodoCommentsNext<CR>", { desc = "Jumps to the next TODO comment" })
map("n", "<leader>tp", "<cmd>TodoCommentsPrev<CR>", { desc = "Jumps to the previous TODO comment" })

-- follow-md-links
map("n", "<bs>", ":edit #<CR>", { silent = true })

-- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.fub=0<CR>", { desc = "Buffer diagnostics toggle filter.buf=0<CR>" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus-false win.position=right<CR>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" })

-- url-open
map("n", "<leader>ou", "<cmd>URLOpenUnderCursor<CR>", { desc = "Opens the url under the cursor" })
map("n", "<leader>oh", "<cmd>URLOpenHighlightAll<CR>", { desc = "Highlights all url in the current buffer" })
map("n", "<leader>oc", "<cmd>URLOpenHighlightAllClear<CR>", { desc = "Clears all highlighted urls in the current buffer" })

-- nvim-ufo
-- map("n", "zR", require("ufo").openAllFolds, { desc = "Opens all folds" })
-- map("n", "zM", require("ufo").closeAllFolds, { desc = "Closes all folds" })
-- map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Opens folds except kind" })
-- map("n", "zm", reqquire("ufo").closeFoldsWith, { desc = "Close all folds" })
-- map("n", "K", function()
--     local winid = require("ufo").peekFoldedLinesUnderCursor()
--     if not winid then
--         vim.lsp.buf.hover()
--     end
-- end)

-- tabs-vs-spaces
map("n", "<leader>St", "<cmd>TabsVsSpacesConvert spaces_to_tabs<CR>", { desc = "Convert spaces to tabs for buffer" })
map("v", "<leader>St", "<cmd>TabsVsSpacesConvert spaces_to_tabs<CR>", { desc = "Convert spaces to tabs for range" })
map("n", "<leader>tS", "<cmd>TabsVsSpacesConvert tabs_to_spaces<CR>", { desc = "Convert tabs to spaces for buffer" })
map("v", "<leader>tS", "<cmd>TabsVsSpacesConvert tabs_to_spaces<CR>", { desc = "Convert tabs to spaces for range" })

-- harpoon
-- local harpoon = require("harpoon")
--
-- harpoon:setup()
--
-- map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Adds the current buffer to the harpoon list"})
-- map("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggles harpoon list" })
--
-- map("n", "<leader>hj", function() harpoon:list():select(1) end, { desc = "Selects the first item in the harpoon list" })
-- map("n", "<leader>hk", function() harpoon:list():select(2) end, { desc = "Selects the second item in the harppon list" })
-- map("n", "<leader>hl", function() harpoon:list():select(3) end, { desc = "Selects the third item in the harpoon list" })
-- map("n", "<leader>h;", function() harpoon:list():select(4) end, { desc = "Selects the fourth item in the harpoon list" })
--
-- map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Goes to the next item in the harpoon list" })
-- map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Goes to the previous item in the harpoon list" })
