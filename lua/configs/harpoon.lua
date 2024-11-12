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

map("n", "<leader>ha", function() harpoon:list():add() end)
map("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<leader>h1", function() harpoon:list():select(1) end)
map("n", "<leader>h2", function() harpoon:list():select(2) end)
map("n", "<leader>h3", function() harpoon:list():select(2) end)
map("n", "<leader>h4", function() harpoon:list():select(4) end)
map("n", "<leader>h5", function() harpoon:list():select(5) end)

map("n", "<leader>hp", function() harpoon:list():prev() end)
map("n", "<leader>hn", function() harpoon:list():next() end)
