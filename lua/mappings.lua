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
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "File using grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find in buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })

-- peek
map("n", "<leader>md", "<cmd>PeekOpen<CR>", { desc = "Open markdown document in browser" })
