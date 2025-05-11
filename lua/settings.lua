local opt = vim.opt

-- colors
opt.termguicolors = true

-- line numbers
opt.number = true
opt.relativenumber = true

-- whitespace
opt.list = true
opt.listchars = "tab:» ,lead:.,trail:.,eol:⏎"

opt.wrap = false --wordwrap false
opt.tabstop = 4 -- indentation
opt.filetype = on -- ftplugin files
opt.scrolloff = 999 -- center cursor in large files

-- cursorline and cursorcolumn
opt.cursorline = true
opt.cursorlineopt = "both"
opt.cursorcolumn = true

-- folding (ufo) options
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
