require("hlchunk").setup {
    chunk = {
        enable = false,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
                   left_bottom = "╰",
                   right_arrow = ">",
        },
        style = "#806d9c",
    },
    indent = {
        enable = true,
        chars = { "│" },
        style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
    },
    blank = {
        enable = true,
        chars = { "·" },
        style = {
            { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("whitespace")), "fg", "gui"), "" },
        },
    },
}
