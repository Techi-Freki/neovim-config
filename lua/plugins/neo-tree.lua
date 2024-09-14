return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "saifulapm/neotree-file-nesting-config",
    },
    cmd = "Neotree",
    opts = {
        hide_root_node = true,
        retain_hidden_root_indent = true,
        filesystem = {
            filtered_items = {
                show_hidden_count = false,
                never_show = {
                    ".DS_Store",
                },
            },
        },
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_collapsed = "",
                expander_expanded = "",
            },
        },
    },
    config = function(_, opts)
        opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
        require("neo-tree").setup(opts)
    end,
}
