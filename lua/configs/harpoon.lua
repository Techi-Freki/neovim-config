local harpoon = require("harpoon")
local map = vim.keymap.set

harpoon:setup({})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
		end

		require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
						results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
		}):find()
end

map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Adds a buffer to the harpoon list" })
map("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggles the harpoon list" })

map("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Opens the first item in the harpoon list" })
map("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Opens the 2nd item in the harpoon list" })
map("n", "<leader>h3", function() harpoon:list():select(2) end, { desc = "Opens the 3rd item in the harpoon list" })
map("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Opens the 4th item in the harpoon list" })
map("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = "Opens the 5th item in the harpoon list" })

map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Navigates to the previous buffer in the harpoon list" })
map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Navigates to the next buffer in the harpoon list" })
