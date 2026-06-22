require("nvim-autopairs").setup({
    check_ts = true,           -- treesitter-aware (don't pair inside strings/comments)
    fast_wrap = {              -- <M-e> to wrap the next pair
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
    },
})

-- Insert "(" automatically after confirming function completions in nvim-cmp
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
