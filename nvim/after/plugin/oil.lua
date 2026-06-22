require("oil").setup({
    default_file_explorer = false, -- keep nvim-tree as the default for `nvim <dir>`
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["q"]     = { "actions.close", mode = "n" },
        ["<C-h>"] = false, -- don't shadow window navigation
        ["<C-l>"] = false,
    },
    float = {
        padding = 2,
        max_width  = 100,
        max_height = 30,
        border = "rounded",
    },
})

vim.keymap.set("n", "-", function() require("oil").open() end,
    { silent = true, desc = "Oil: open parent directory" })

vim.keymap.set("n", "<leader>-", function() require("oil").open_float() end,
    { silent = true, desc = "Oil: open in floating window" })
