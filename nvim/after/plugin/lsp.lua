local servers = {
    "gopls",
    "lua_ls",
    "jsonls",
    "yamlls",
    "sqlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

-- Default capabilities applied to every server (cmp + LSP)
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
)

vim.lsp.config("*", {
    capabilities = capabilities,
})

-- Per-server overrides
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime     = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace   = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry   = { enable = false },
        },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            usePlaceholders = true,
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
})

vim.lsp.config("yamlls", {
    settings = {
        yaml = { keyOrdering = false },
    },
})

-- Activate everything
vim.lsp.enable(servers)
if vim.fn.executable("dart") == 1 then
    vim.lsp.enable("dartls")
end

-- Per-buffer keymaps & symbol-highlight on attach
-- Strip Neovim 0.11's default LSP keymaps. They are GLOBAL (not buffer-local),
-- and `gri`/`grn`/`gra`/`grt` shadow substitute.nvim's `gr<motion>` operator
-- because Vim picks the longer match when both `gr` and `gri` are complete.
-- We rebind these actions on different keys (gh, gi, gy, <leader>rn, <leader>a).
for _, lhs in ipairs({ "grn", "grr", "gri", "grt" }) do
    pcall(vim.keymap.del, "n", lhs)
end
pcall(vim.keymap.del, { "n", "x" }, "gra")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        -- Goto (telescope pickers close on select; quickfix lingers)
        local tb = require("telescope.builtin")
        map("n", "gd", tb.lsp_definitions,      "LSP: Go to definition")
        map("n", "gy", tb.lsp_type_definitions, "LSP: Go to type definition")
        map("n", "gi", tb.lsp_implementations,  "LSP: Go to implementation")
        map("n", "gh", function() require("config.lsp_pickers").references() end, "LSP: References")
        map("n", "K",  vim.lsp.buf.hover,           "LSP: Hover")
        map("i", "<C-s>", vim.lsp.buf.signature_help, "LSP: Signature help")

        -- Diagnostics (preserve coc's ge / gE)
        map("n", "ge", function() vim.diagnostic.jump({ count = 1,  float = true }) end, "Diagnostic: next")
        map("n", "gE", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Diagnostic: prev")

        -- Refactor / actions
        map("n", "<leader>rn", vim.lsp.buf.rename,      "LSP: Rename")
        map("n", "<leader>a",  vim.lsp.buf.code_action, "LSP: Code action")
        map("x", "<leader>a",  vim.lsp.buf.code_action, "LSP: Code action (visual)")
        map("n", "<leader>ac", vim.lsp.buf.code_action, "LSP: Code action at cursor")

        -- Highlight symbol under cursor on CursorHold (replaces coc's CocActionAsync('highlight'))
        if client and client.server_capabilities.documentHighlightProvider then
            local grp = vim.api.nvim_create_augroup("LspDocHighlight" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                group = grp,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = bufnr,
                group = grp,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})

-- Diagnostic UI tweaks
vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    severity_sort = true,
    float = { border = "rounded", source = true },
})

-- :Format command (matches the one you had under coc)
vim.api.nvim_create_user_command("Format", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, {})
