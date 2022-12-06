local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap
local silent = { silent = true }

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    auto_reload_on_write = true,
    open_on_setup = false,
    view = {
        adaptive_size = false,
        relativenumber = true,
        number = true,
        mappings = {
            custom_only = true,
            list = {
                { key = { "<CR>", "<2-LeftMouse>", "l" }, action = "edit" },
                { key = { "<Tab>" }, action = "preview" },
                { key = "<BS>", action = "toggle_dotfiles" },
                { key = "cd", action = "cd"},
                { key = "a", action = "create" },
                { key = "y", action = "copy" },
                { key = "d", action = "cut" },
                { key = "p", action = "paste" },
                { key = "r", action = "rename" },
                { key = "D", action = "remove" },
            },
        },
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 60,
                height = 24,
                row = 8,
                col = 60,
            }
        }
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = "all",
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "M",
                    staged = "A",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "D",
                    ignored = "I",
                },
            },
        },
    },
    filters = {
        dotfiles = true,
        custom = { "^.git$" }
    },
    diagnostics = {
        enable = true,
        icons = { hint = "", info = "", warning = "", error = "" },
        show_on_dirs = true
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
})

nnoremap("<leader><leader>", ":NvimTreeToggle<CR>", silent)
