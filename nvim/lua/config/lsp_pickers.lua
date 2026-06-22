local M = {}

-- LSP references that ALWAYS opens telescope, even with a single result.
-- (telescope.builtin.lsp_references uses list_or_jump and auto-jumps on a single hit.)
function M.references()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/references" })
    if #clients == 0 then
        vim.notify("No LSP client supports references", vim.log.levels.WARN)
        return
    end

    local offset_encoding = clients[1].offset_encoding or "utf-16"
    local params = vim.lsp.util.make_position_params(0, offset_encoding)
    params.context = { includeDeclaration = false }

    vim.lsp.buf_request_all(bufnr, "textDocument/references", params, function(results)
        local items = {}
        for client_id, response in pairs(results) do
            if response.result then
                local client = vim.lsp.get_client_by_id(client_id)
                local enc = (client and client.offset_encoding) or "utf-16"
                vim.list_extend(items, vim.lsp.util.locations_to_items(response.result, enc))
            end
        end

        if vim.tbl_isempty(items) then
            vim.notify("No references found", vim.log.levels.INFO)
            return
        end

        local pickers     = require("telescope.pickers")
        local finders     = require("telescope.finders")
        local make_entry  = require("telescope.make_entry")
        local conf        = require("telescope.config").values

        pickers.new({}, {
            prompt_title = "LSP References (" .. #items .. ")",
            finder = finders.new_table({
                results     = items,
                entry_maker = make_entry.gen_from_quickfix({}),
            }),
            previewer = conf.qflist_previewer({}),
            sorter    = conf.generic_sorter({}),
        }):find()
    end)
end

return M
