require("conform").setup({
    formatters_by_ft = {
        lua        = { "stylua" },
        go         = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        json       = { "prettierd", "prettier", stop_after_first = true },
        yaml       = { "prettierd", "prettier", stop_after_first = true },
        markdown   = { "prettierd", "prettier", stop_after_first = true },
        sh         = { "shfmt" },
    },
    -- format-on-save intentionally disabled; trigger manually with <leader>fm
})

-- Manual format keymaps (replace coc's <Plug>(coc-format))
vim.keymap.set({ "n", "x" }, "<leader>fm", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { silent = true, desc = "Format buffer / selection" })
