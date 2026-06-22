-- opencode runs externally in another tmux pane (`opencode --port`).
-- opencode.nvim auto-discovers the running instance; we just need to stop it
-- from ever trying to spawn its own embedded terminal.
local noop = function()
    vim.notify(
        "opencode is managed externally — start it with `opencode --port` in another pane",
        vim.log.levels.WARN
    )
end

---@type opencode.Opts
vim.g.opencode_opts = {
    server = {
        port   = nil,   -- nil = auto-discover any running opencode instance
        start  = noop,
        stop   = noop,
        toggle = noop,
    },
}

-- Required so opts.events.reload can refresh buffers when opencode edits files
vim.o.autoread = true

local function oc()
    return require("opencode")
end

-- All keymaps here send data to the externally-running opencode.
-- (No <leader>oo / toggle binding — we don't manage the terminal.)
vim.keymap.set({ "n", "x" }, "<leader>oa", function() oc().ask("@this: ", { submit = true }) end,
    { desc = "opencode: ask about cursor/selection" })

vim.keymap.set({ "n", "x" }, "<leader>oA", function() oc().ask() end,
    { desc = "opencode: ask (blank prompt)" })

vim.keymap.set({ "n", "x" }, "<leader>os", function() oc().select() end,
    { desc = "opencode: select prompt/action" })

-- Operator: send a motion/range to opencode (`go<motion>`, `goo` for line)
vim.keymap.set({ "n", "x" }, "go",  function() return oc().operator("@this ") end,
    { desc = "opencode: add range", expr = true })
vim.keymap.set("n",          "goo", function() return oc().operator("@this ") .. "_" end,
    { desc = "opencode: add line", expr = true })
