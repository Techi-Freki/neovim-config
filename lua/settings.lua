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
