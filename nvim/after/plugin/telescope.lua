local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local lga_actions = require("telescope-live-grep-args.actions")

local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end

require("telescope").setup {
    defaults = {
        -- buffer_previewer_maker = new_maker,
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = {         -- extend mappings
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
            -- ... also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_config = { mirror=true }, -- mirror preview pane
        }
    }
}


vim.keymap.set("n", "<leader>ff", function()
    require('telescope.builtin').find_files({ layout_strategy = 'vertical', layout_config = { width = 0.8 } })
end)

vim.keymap.set("n", "<leader>fg", function()
    require('telescope.builtin').git_files()
end)

vim.keymap.set("n", "<leader>fb", function()
    require('telescope.builtin').buffers({ layout_strategy = 'vertical', layout_config = { width = 0.8 } })
end)

vim.keymap.set("n", "<leader>fh", function()
    require('telescope.builtin').help_tags()
end)

vim.keymap.set("n", "<leader>ft", function()
    require('telescope.builtin').tags({ layout_strategy = 'vertical', layout_config = { width = 0.8 } })
end)

vim.keymap.set("n", "<leader>fs", function()
    require('telescope.builtin').treesitter()
end)

vim.keymap.set("n", "<leader>fz", function()
    require('telescope.builtin').current_buffer_fuzzy_find()
end)

vim.keymap.set("n", "<leader>tk", function()
    require('telescope.builtin').keymaps()
end)

vim.keymap.set("n", "<leader>lg", function()
    require('telescope.builtin').live_grep()
end, { desc = "Live Grep" })

vim.keymap.set("n", "<leader>la", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.api.nvim_set_keymap('n', '<leader>se', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
