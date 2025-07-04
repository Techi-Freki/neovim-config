local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- basic functionality
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear the highlighted search term"})
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

-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Find file using grep" })
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Find in buffers" })
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "Find help" })
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc = "Find recently opened files" })

-- themery
map("n", "<leader>cs", "<cmd>Themery<CR>", { desc = "Toggles the theme picker" })

-- url-open
map("n", "<leader>ou", "<cmd>URLOpenUnderCursor<CR>", { desc = "Opens the url under the cursor" })
map("n", "<leader>oh", "<cmd>URLOpenHighlightAll<CR>", { desc = "Highlights all url in the current buffer" })
map("n", "<leader>oc", "<cmd>URLOpenHighlightAllClear<CR>", { desc = "Clears all highlighted urls in the current buffer" })

-- buffer bindings
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycles to the next buffer in the bufferline" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycles to the previous buffer in the bufferline" })
map("n", "<leader>b", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Closes the current buffer without closing the window" })

-- [[ Plugin Bindings --]]

-- neotree
map("n", "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Toggles the file explorer" })

-- toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm size=24 direction=horizontal<CR>", { desc = "Opens a horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=64 direction=vertical<CR>", { desc = "Opens a vertical terminal" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Opens a tab terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Opens a floating terminal" })

-- peek
map("n", "<leader>md", "<cmd>PeekOpen<CR>", { desc = "Open markdown document in browser" })

-- follow-md-links
map("n", "<bs>", ":edit #<CR>", { silent = true })

-- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.fub=0<CR>", { desc = "Buffer diagnostics toggle filter.buf=0<CR>" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus-false win.position=right<CR>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" })

-- tabs-vs-spaces
map("n", "<leader>St", "<cmd>TabsVsSpacesConvert spaces_to_tabs<CR>", { desc = "Convert spaces to tabs for buffer" })
map("v", "<leader>St", "<cmd>TabsVsSpacesConvert spaces_to_tabs<CR>", { desc = "Convert spaces to tabs for range" })
map("n", "<leader>tS", "<cmd>TabsVsSpacesConvert tabs_to_spaces<CR>", { desc = "Convert tabs to spaces for buffer" })
map("v", "<leader>tS", "<cmd>TabsVsSpacesConvert tabs_to_spaces<CR>", { desc = "Convert tabs to spaces for range" })

-- splitjoin
map("n", "<leader>,", "<cmd>MiniSplitjoin.toggle()<CR>", { desc = "Toggles splitjoin on arguments and arrays" })

-- nvim-dap
map("n", "<F5>", function() require("dap").continue() end, { desc = "Start debugging" } )
map("n", "<F8>", function() require("dap").step_over() end, { desc = "Step over" } )
map("n", "<F11>", function() require("dap").into() end, { desc = "Step into" } )
map("n", "<shift><F8>", function() require("dap").step_out() end, { desc = "Step out" } )
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" } )

-- venv-selector
map("n", "<leader>fs", "<cmd>VenvSelect<CR>", { desc = "Opens venv selector" })
