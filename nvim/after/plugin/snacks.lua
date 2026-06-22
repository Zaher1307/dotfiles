require("snacks").setup({
    -- Performance helpers
    bigfile   = { enabled = true },   -- auto-disable expensive features on huge files
    quickfile = { enabled = true },   -- render the file before plugins fully load on startup

    -- UI improvements
    notifier  = { enabled = true, timeout = 3000 }, -- replaces vim.notify with a nicer UI
    input     = { enabled = true },                  -- prettier vim.ui.input (rename popup, etc.)
    statuscolumn = { enabled = false },              -- you already use signcolumn = "yes"

    -- Buffer / window helpers
    bufdelete = { enabled = true },                  -- :Snacks bufdelete keeps window layout
    rename    = { enabled = true },                  -- LSP rename + update buffer/file name

    -- Scratch / toggles
    scratch   = { enabled = true },
    toggle    = { enabled = true },

    -- Picker enabled so opencode.nvim's select() is enhanced.
    -- Telescope still owns its own keymaps; this just hooks vim.ui.select.
    picker = {
        enabled = true,
        ui_select = true,
        actions = {
            -- <A-a> in any picker input sends the selected result(s) to opencode.
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
        },
        win = {
            input = {
                keys = {
                    ["<A-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
            },
        },
    },

    -- Disabled (you have dedicated plugins for these)
    lazygit   = { enabled = false },
    terminal  = { enabled = false },
    dashboard = { enabled = false },
    scope     = { enabled = false },                 -- indent-blankline handles this
    words     = { enabled = false },                 -- LSP CursorHold highlight handles this
})

-- Replace your existing <leader>bd (which used :bd and would close the window too)
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end,
    { silent = true, desc = "Delete buffer (keep window layout)" })

vim.keymap.set("n", "<leader>.", function() Snacks.scratch() end,
    { silent = true, desc = "Scratch buffer" })

vim.keymap.set("n", "<leader>nh", function() Snacks.notifier.show_history() end,
    { silent = true, desc = "Notification history" })
