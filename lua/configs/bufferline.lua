require("bufferline").setup{
	options = {
		offsets = {
			filetype = "NvimTree",
			text = "Project",
			highlight = "Directory",
			separator = true,
		},
		hover = {
			enabled = true,
			delay = 150,
			reveal = { "close" }
		},
	},
}
