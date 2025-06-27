# Installation Guide
Here is my neovim configuration. This is specifically catered to my tastes as a programmer so I wouldn't use it if you're not me. I would use [`kickstart`](https://github.com/nvim-lua/kickstart.nvim) to learn how to configure neovim properly and create your own bespoke neovim experience.

- [Directory Structure](#directory-structure)
- [.vimrc](#vimrc)
- [Fonts](#fonts)
- [Settings](#settings)
- [Mappings](#mappings)
- [Plugins](#plugins)
    - [Package Management](#package-management)
    - [Fuzzy Finder](#fuzzy-finder)
    - [Language Server Protocol](#lsp)
    - [Colorschemes](#colorschemes)
    - [Colorscheme Switcher](#colorscheme-switcher)
    - [Indentation](#indentation)
    - [Utilities](#utilities)
    - [Decoration](#decoration)
    - [Git Integration](#git-integration)


<a id="directory-structure"></a>
## Directory Structure
> *~/.config/nvim*
```
after/
    ftplugin/
lua/
    configs/
    plugins/
    filetypes.lua
    mappings.lua
    settings.lua
init.lua
.vimrc
```

<a id="vimrc"></a>
## .vimrc
Converting tabs to 4 spaces.
> *~/.config/nvim/.vimrc*
```
set tabstop=4
set shiftwidth=4
set smarttab=true
set expandtab=true
set softtabstop=true
```

<a id="fonts"></a>
## Fonts
The plugins and settings I use need to have a decent nerd font installed on your machine to appear correctly. I'm using the [nerd-fonts-noto-sans-mono](https://aur.archlinux.org/packages/nerd-fonts-noto-sans-mono) package from the Arch user reposotory.
```
$ yay -S nerd-fonts-noto-sans-mono
```

<a id="settings"></a>
## Settings
Some basic settings for neovim.

> *~/.config/nvim/lua/settings.lua*
```
local opt = vim.opt

-- colors
opt.termguicolors = true

-- line numbers
opt.number = true
opt.relativenumber = true

-- whitespace
opt.list = true
opt.listchars = "tab:» ,lead:.,trail:.,eol:⏎"

-- cursorline and cursorcolumn
opt.cursorline = true
opt.cursorlineopt = "both"
opt.cursorcolumn = true
opt.colorcolumn = "79" -- PEP-8

opt.wrap = false -- wordwrap false
opt.tabstop = 4 -- indentation
opt.filetype = on -- ftplugin files
opt.scrolloff = 999 -- center cursor in large files when moving vertically
```

<a id="mappings"></a>
## Mappings
Basic mappings I use.

> *~/.config/nvim/lua/mappings.lua*
```
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
```

<a id="plugins"></a>
## Plugins
Here is the list of plugins that I am using.

<a id="package-management"></a>
### Package Management
I'm currently using [`lazy.nvim`](https://github.com/folke/lazy.nvim) for my package manager.

> *~/.config/nvim/lua/config/lazy.lua*
```
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end
```

> *~/.config/nvim/init.lua*
```
require("config.lazy")
```
---

<a id="fuzzy-finder"></a>
### Fuzzy Finder
I'm using [`telescope`](https://github.com/nvim-telescope/telescope.nvim)
> *~/.config/nvim/lua/plugins/telescope.lua*
```
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = "nvim-lua/plenary.nvim",
}
```

Then add the mappings.
> *~/.config/nvim/lua/mappings.lua*
```
...
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Find file using grep" })
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { desc = "Find in buffers" })
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "Find help" })
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { desc = "Find recently opened files" })
```
---

<a id="lsp"></a>
### Language Server Protocol
I'm using [`lsp-config`](https://github.com/neovim/nvim-lspconfig)

> *~/.config/nvim/lua/plugins/lsp-config.lua*
```
return { "neovim/nvim-lspconfig" }
```

#### Languages
Now you need to install the language servers that you will be using. [Here](https://wiki.archlinux.org/title/Language_Server_Protocol) is a list of other language servers for arch.

- [Python](#python)
- [TypeScript](#typescript)
- [Deno](#deno)
- [VUEJS](#vuejs)
- [HTML](#html)
- [JSON](#json)
- [CSS](#css)
- [C#](#csharp)
- [Markdown](#markdown)
- [Lua](#lua)
- [Emmet](#emmet)
- [Yuck](#yuck)
- [Termux](#termux)
- [ftconfig](#ftconfig)


<a id="python"></a>
##### Python
```
# pacman -S pyright
```

<a id="typescript"></a>
##### TypeScript
```
# pacman -S typescript
```

<a id="deno"></a>
##### Deno
For JavaScript
```
# pacman -S deno
```

<a id="vuejs"></a>
##### VUEJS
```
# pacman -S vue-language-server
```

<a id="html"></a>
##### HTML
```
# pacman -S vscode-html-languageserver
```

<a id="json"></a>
##### JSON
```
# pacman -S vscode-json-languageserver
```

<a id="CSS"></a>
##### CSS
```
# pacman -S vscode-css-languageserver
```

<a id="lua"></a>
##### Lua
```
# pacman -S lua-language-server
```

<a id="csharp"></a>
##### C#
```
$ yay -S csharp-ls
```

<a id="markdown"></a>
##### Markdown
```
$ yay -S markdown-oxide-git
```

<a id="emmet"></a>
##### Emmet
```
$ yay -S emmet-language-server
```

<a id="yuck"></a>
##### Yuck
```
$ yay -S yuckls-git
```

Add this file to the plugins directory for the yuck language server.

> *~/.config/nvim/lua/plugins/yuck-vim.lua*

```
return { "elkowar/yuck.vim", }
```

<a id="termux"></a>
##### Termux
For build.sh, PKGBUILD, ebuild
```
$ yay -S termux-language-server
```

Now you need to create the config file for these langauge servers.
> *~/.config/nvim/lua/configs/lsp-config.lua*
```
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_argroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").pyright.setup{}
require("lspconfig").ts_ls.setup{
    on_attach = on_attach,
    filetypes = { "typescript" },
    cmd = { "typescript-language-server", "--stdio" }
}
require("lspconfig").volar.setup{}

require("lspconfig").html.setup{ capabilities = capabilities }
require("lspconfig").jsonls.setup{ capabilities = capabilities }
require("lspconfig").cssls.setup{ capabilities = capabilities }

require("lspconfig").emmet_language_server.setup{}
require("lspconfig").csharp_ls.setup{}
require("lspconfig").markdown_oxide.setup{}
require("lspconfig").vuels.setup(
        { opt = { commentstring = "//", } }
)
```

And add the language server configuration to your init file.
> *~/.config/nvim/init.lua*
```
...
require("configs.lsp-config")
```

<a id="ftconfig"></a>
#### ftconfig
This lets me have different settings for neovim depending on file type.
```
!mkdir ~/.config/nvim/after/ftconfig
```

> *~/.config/nvim/after/ftconfig/py.vim*
```
set tabstop=4 -- Number of spaces that a <Tab> in the file counts for
set shiftwidth=2 -- Number of spaces to use for each step of (auto)indent
set softtabstop=4 -- Number of spaces that a <Tab> counts for while performing editing operations
set expandtab -- In Insert mode use the appropriate number of spaces to insert a <Tab>
```
This will make sure that all python files use the correct white space while you're programming.

---

<a id="colorschemes"></a>
### Colorschemes
Here is my colorscheme configuration.
> *~/.config/nvim/lua/plugins/colorschemes.lua*
```
return {
    { "Mofiqul/dracula.nvim" },
    { "folke/tokyonight.nvim" },
    { "navarasu/onedark.nvim" },
    { "tanvirtin/monokai.nvim" },
}
```

I like to use the deep palette with onedark
> *~/.config/nvim/lua/configs/onedark-deep.lua*
```
require("onedark").setup({ style = "deep" })
```

And add the config to the `init.lua` file.
> *~/.config/nvim/init.lua*
```
...
require("configs.onedark-deep")
```
---

<a id="colorscheme-switcher"></a>
### Colorscheme Switcher
Gonna be using [`themery`](https://github.com/zaldih/themery.nvim) for this one.
> *~/.config/nvim/lua/plugins/themery.lua*
```
return { "zaldih/themery.nvim" }
```

> *~/.config/nvim/lua/configs/themery.lua*
```
require("themery").setup({
    themes = {
        { name = "Dracula", colorscheme = "dracula" },
        { name = "Monokai", colorscheme = "monokai" },
        { name = "Tokyo Night", colorscheme = "tokyonight" },
        { name = "One Dark (deep)", colorscheme = "onedark" },
    },
    livePreview = true,
    cmd = "Themery",
})
```
And the keymaps

> *~/.config/nvim/lua/mappings.lua*
```
...
map("n", "<leader>cs", "<cmd>Themery<CR>", { desc = "Toggles the theme picker" })
```
---

<a id="indentation"></a>
### Indentation
Here are some plugins that help out with indentation.

- [hlchunk](#hlchunk)
- [guess-indent](#guess-indent)

<a id="hlchunk"></a>
#### [`hlchunk`](https://github.com/shellRaining/hlchunk.nvim?tab=readme-ov-file)
This plugin will highlight indented chunks of code.
> *~/.config/nvim/lua/plugins/hlchunk.lua*
```
return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup{}
    end
}
```

> *~/.config/nvim/lua/configs/hlchunk.lua*
```
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
```

<a id="guess-indent"></a>
#### [`guess-indent`](https://github.com/NMAC427/guess-indent.nvim)
Guess the indent style on a newly opened buffer.
> *~/.config/nvim/lua/plugins/guess-indent.lua*
```
return {
    "nmac472/guess-indent.nvim",
    config = function()
        require("guess-indent").setup {}
    end
}
```

> *~/.config/nvim/lua/configs/guess-indent.lua*
```
require("guess-indent").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.guess-indent")
```
---

<a id="utilities"></a>
### Utilities
Here are some plugins to help with various utilitarian tasks.
- [automkdir](#automkdir)
- [url-open](#url-open)
- [nvim-ufo](#nvim-ufo)
- [mini.pairs](#mini-pairs)
- [mini.ai](#mini-ai)
- [mini.splitjoin](#mini-splitjoin)
- [mini.completion](#mini-completion)
- [toggleterm](#toggleterm)
- [tabs-vs-spaces](#tabs-vs-spaces)
- [which-key](#which-key)
- [harpoon](#harpoon)
- [neo-tree](#neo-tree)
- [peek](#peek)
- [nvim-emmet](#nvim-emmet)
- [tidy](#tidy)
- [vim-loremipsum](#vim-loremipsum)

<a id="automkdir"></a>
#### [`automkdir`](https://github.com/mateuszwieloch/automkdir.nvim)
Automatically creates parent directories when creating new files and directories.
> *~/.config/nvim/lua/plugins/automkdir.lua*
```
return { "mateuszwieloch/automkdir.nvim" }
```

<a id="url-open"></a>
#### [`url-open`](https://github.com/sontungexpt/url-open)
Open urls in a browser.
> *~/.config/nvim/lua/plugins/url-open.lua*
```
return {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
        local status_ok, url_open = pcall(require, "url-open")
        if not status_ok then
            return
        end
        url_open.setup ({})
    end,
}
```

And add the keymappings.
> *~/.config/nvim/lua/mappings.lua*
```
...
map("n", "<leader>ou", "<cmd>URLOpenUnderCursor<CR>", { desc = "Opens the url under the cursor" })
map("n", "<leader>oh", "<cmd>URLOpenHighlightAll<CR>", { desc = "Highlights all urls in the current buffer" })
map("n", "<leader>oc", "<cmd>URLOpenHighlightAllClear<CR>", { desc = "Clears all highlighted urls in the current buffer" })
```

<a id="nvim-ufo"></a>
#### [`nvim-ufo`](https://github.com/kevinhwang91/nvim-ufo)
Allows for easy code folding.
> *~/.config/nvim/lua/plugins/nvim-ufo.lua*
```
return {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
}
```

> *~/.config/nvim/lua/settings.lua
```
...
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
```

> *~/.config/nvim/lua/configs/nvim-ufo.lua*
```
require("ufo").setup {}

map("n", "zR", require("ufo").openAllFolds, { desc = "Opens all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Closes all folds" })
map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Opens folds except kind" })
map("n", "zm", reqquire("ufo").closeFoldsWith, { desc = "Close all folds" })
map("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)
```

<a id="mini-pairs"></a>
#### [`mini.pairs`](https://github.com/echasnovski/mini.pairs)
Automatically adds matching pairs of parenthesis, brackets, etc.
> *~/.config/nvim/lua/plugins/mini-pairs.lua*
```
return {
    "echasnovski/mini.pairs",
    version = false,
}
```

> *~/.config/nvim/lua/configs/mini-pairs.lua*
```
require("mini.pairs").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.mini-pairs")
```

<a id="mini-ai"></a>
#### [`mini.ai`](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md)
Additional functionality to inside and around.
> *~/.config/nvim/lua/plugins/mini-ai.lua*
```
return {
    "echasnovski/mini.ai",
    version = false,
}
```

> *~/.config/nvim/lua/configs/mini-ai.lua*
```
require("mini.ai").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.mini-ai")
```

<a id="mini-splitjoin"></a>
#### [`mini.splitjoin`](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-splitjoin.md)
Split and join arguments.
> *~/.config/nvim/lua/plugins/mini-splitjoin.lua*
```
return {
    "echasnovski/mini.splitjoin",
    version = false,
}
```

> *~/.config/nvim/lua/configs/mini-spllitjoin.lua*
```
require("splitjoin").setup {}
```

> *~/.config/nvim/init.lua*
```
require("configs.splitjoin")
```

<a id="mini-completion"></a>
#### [`mini.completion`](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md)
Adds autocomplete functionality.
> *~/.config/nvim/lua/plugins/mini-completion.lua*
```
return {
    "echasnovski/mini.completion",
    version = false,
}
```
> *~/.config/nvim/lua/configs/mini-completion.lua*
```
require("mini.completion").setup {}
```
> *~/.config/nvim/init.lua*
```
...
require("configs.mini-completion")
```

<a id="toggleterm"></a>
#### [`toggleterm`](https://github.com/akinsho/toggleterm.nvim)
Terminal integration.
> *~/.config/nvim/lua/plugins/toggleterm.lua*
```
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
}
```
> *~/.config/nvim/lua/mappings.lua*
```
...
map("n", "<leader>th", "<cmd>ToggleTerm size=24 direction=horizontal<CR>", { desc = "Opens a horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=64 direction=vertical<CR>", { desc = "Opens a vertical terminal" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Opens a tab terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Opens a floating terminal" })
```

<a id="tabs-vs-spaces"></a>
#### [`tabs-vs-spaces`](https://github.com/tenxsoydev/tabs-vs-spaces.nvim)
Hint and fix deviations in indentation.
> *~/.config/nvim/lua/plugins/tabs-vs-spaces.lua*
```
return { "tenxsoydev/tabs-vs-spaces.nvim" }
```
> *~/.config/nvim/lua/configs/tabs-vs-spaces.lua*
```
require("tabs-vs-spaces").setup {
    indentation = "auto",
    cmd = { "TabsVsSpacesToggle", "TabsVsSpacesStandardize", "TabsVsSpacesConvert" },
}
```
> *~/.config/nvim/init.lua*
```
...
require("configs.tabs-vs-spaces")
```

<a id="harpoon"></a>
#### [`harpoon`](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
Quickly "pin" and navigate to buffers.
> *~/.config/nvim/lua/plugins/harpoon.lua*
```
return {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",

        dependencies = "nvim-lua/plenary.nvim",
}
```

> *~/.config/nvim/lua/configs/harpoon.lua*
```
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
```

<a id="neo-tree"></a>
#### [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree)

> *~/.config/nvim/lua/plugins/neo-tree.lua*
```
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
```

> *~/.config/nvim/lua/configs/neo-tree.lua*
```
require("neo-tree").setup{
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
}
```

> *~/.config/nvim/lua/mappings.lua*
```
...
map("n", "<leader>e", "<cmd>Neotree toggle current reveal_force_cwd<CR>", { desc = "Toggles the file explorer" })
```

> *~/.config/nvim/init.lua*
```
require("configs.neo-tree")
```

<a id="tidy"></a>
#### [`tidy`](https://github.com/mcauley-penney/tidy.nvim)
Removes trailing whitespace and empty lines at EOF on save.
> *~/.config/nvim/lua/plugins/tidy.lua*
```
return {
    "mcauley-penney/tidy.nvim",
    config = true,
}
```

> *~/.config/lua/configs/tidy.lua*
```
require("tidy").setup { enabel_on_save = true }
```

> */.config/nvim/init.lua*
```
...
require("configs.tidy")
```

<a id="vim-loremipsum"></a>
#### [`vim-loremipsum`](https://github.com/wolandark/vim-loremipsum)
A dummy text generator.
> *~/.config/nvim/lua/plugins/vim-loremipsum.lua*
```
return { "wolandark/vim-loremipsum" }
```

---

<a id="decoration"></a>
### Decoration
Adding visual elements to neovim.

- [lualine](#lualine)
- [bufferline](#bufferline)
- [nvim-web-devicons](#nvim-web-devicons)
- [mini.icons](#mini.icons)
- [tiny-devicons-auto-colors](#tiny-devicons-auto-colors)
- [todo-comments](#todo-comments)
- [twilight](#twilight)
- [csvlens](#csvlens)
- [render-markdown](#render-markdown)
- [nvim-colorizer](#nvim-colorizer)

<a id="lualine"></a>
#### [`lualine`](https://github.com/nvim-lualine/lualine.nvim)
A blazing fast and easy to configure Neovim statusline written in lua.
> *~/.config/nvim/lua/plugins/lualine.lua*
```
return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
}
```

> *~/.config/nvim/lua/configs/lualine.lua*
```
require("lualine").setup{
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.lualine")
```

<a id="bufferline"></a>
#### [`bufferline`](https://github.com/akinsho/bufferline)
A *snazzy* buffer line (with tabpage integration) for Neovim built using lua.
> *~/.config/nvim/lua/plugins/bufferline.lua*
```
return {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicon",
}
```

> *~/.config/nvim/lua/configs/bufferline.lua*
```
require("bufferline").setup{}
```

> *~/.config/nvim/init.lua*
```
require("configs.bufferline")
```

<a id="nvim-web-devicons"></a>
#### [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)
Nerd font icons.
> *~/.config/nvim/lua/plugins/nvim-web-devicons.lua*
```
return { "nvim-tree/nvim-web-devicons" }
```

<a id="mini-icons"></a>
#### [`mini.icons`](https://github.com/echasnovski/mini.icons)
Icons from [`mini.nvim`](https://github.com/echasnovski/mini.nvim)
> *~/.config/nvim/lua/plugins/mini-icons.lua*
```
return { "echasnovski/mini.icons", version = false }
```

<a id="tiny-devicons-auto-colors"></a>
#### [`tiny-devicons-auto-colors`](https://github.com/rachartier/tiny-devicons-auto-colors.nvim)
> *~/.config/nvim/lua/plugins/tiny-devicons-auto-colors.lua*
```
return {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
}
```

> *~/.config/nvim/lua/configs/tiny-devicons-auto-color*
```
require("tiny-devicons-auto-colors").setup()
```

> *~/.config/nvim/init.lua*
```
require("configs.tiny-devicons-auto-colors")
```

<a id="todo-comments"></a>
#### [`todo-comments`](https://github.com/folke/todo-comments.nvim)
Highlights TODO, HACK, and o ther types of in code. Use \<leader\>tn and \<leader\>tp to navigate to next and previous comments.
> *~/.config/nvim/lua/plugins/todo-comments.lua*
```
return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
}
```

> *~/.config/nvim/lua/configs/todo-comments.lua*
```
local map = vim.key.map
require("todo-comments").setup({})

map("n", "<leader>tn", require("todo_comments").find_next(), { desc = "Jumps to the next TODO comment" })
map("n", "<leader>tp", require("todo_comments").find_prev(), { desc = "Jumps to the previous TODO comment" })
```
 > *~/.config/nvim/init.lua*
```
...
require(".configs.todo-comments")
```

<a id="twlight"></a>
#### [`twilight`](https://github.com/folke/twilight.nvim)
Visually dims unreferenced code.
> *~/.config/nvim/lua/plugins/twlight.lua*
```
return { "folke/twlight.nvim" }
```

> *~/.config/nvim/lua/configs/twilight.lua*
```
require("twilight").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.twilight")
```


<a id="csvlens"></a>
#### [`csvlens`](https://github.com/theKnightsOfRohan/csvlens.nvim)
Renders csv files for easier viewing.

> *~/.config/nvim/lua/plugins/csvlens.lua*
```
return {
        "theKnightsOfRohan/csvlens.nvim",
        dependencies = "akinsho/toggleterm.nvim",
        config = true,
}
```

> *~/.config/nvim/lua/configs/csvlens.lua*
```
require("csvlens").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.csvlens")
```

<a id="render-markdown"></a>
#### [`render-markdown`](https://github.com/MeanderingProgrammer/render-markdown.nvim)
Renders markdown to make it a little more readable.
> *~/.config/nvim/lua/render-markdown.lua*
```
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.nvim",
    },
}
```

> *~/.config/nvim/configs/render-markdown.lua*
```
require("render-markdown").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.render-markdown")
```

<a id="nvim-colorizer"></a>
#### [`nvim-colorizer`](https://github.com/NvChad/nvim-colorizer.nvim)
> *~/.config/nvim/lua/plugins/nvim-colorizer.lua*
```
return { "NvChad/nvim-colorizer.lua" }
```

> *~/.config/nvim/lua/configs/nvim-colorizer.lua*
```
require("colorizer").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.nvim-colorizer")
```

---

<a id="git-integration"></a>
### Git Integration

<a id="gitsigns"></a>
#### [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim)
> *~/.config/nvim/lua/plugins/gitsigns.lua*
```
return { "lewis6991/gitsigns.nvim" }
```

> *~/.config/nvim/lua/configs/gitsigns.lua*
```
require("gitsigns").setup {}
```

> *~/.config/nvim/init.lua*
```
...
require("configs.gitsigns")
```

> [!NOTE]
> I tend to do my git staging, committing, merging using the cli so this is all I need. I use toggle term to open a terminal and do all my git operations there. You could use [`lazygit`](https://github.com/jesseduffield/lazygit) if you wanted to try a terminal user interface to simplify things. It is in the main arch repos.

```
# pacman -S lazygit
```
