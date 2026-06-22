local sub = require("substitute")

sub.setup({
    on_substitute = nil,
    yank_substituted_text = false,
    preserve_cursor_position = false,
    modifiers = nil,
    range = {
        prefix = "s",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        subject = nil,
        range = nil,
        suffix = "",
        auto_apply = false,
        cursor_position = "end",
    },
    exchange = {
        motion = false,
        use_esc_to_cancel = true,
        preserve_cursor_position = false,
    },
})

-- Replace-with-register style: same UX as the old ReplaceWithRegister plugin.
vim.keymap.set("n", "gr",  sub.operator, { silent = true, desc = "Replace with register (motion)" })
vim.keymap.set("x", "gr",  sub.visual,   { silent = true, desc = "Replace with register (visual)" })
vim.keymap.set("n", "grr", sub.line,     { silent = true, desc = "Replace with register (line)" })
vim.keymap.set("n", "gR",  sub.eol,      { silent = true, desc = "Replace with register (to EOL)" })
