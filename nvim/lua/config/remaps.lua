-- Replace-with-register: see after/plugin/substitute.lua

-- General maps
vim.keymap.set('n', '<Tab>', ':bn<cr>', {silent = true})
vim.keymap.set('n', '<S-Tab>', ':bp<cr>', {silent = true})
vim.keymap.set('n', '<c-a>', 'ggVG')
vim.keymap.set('n', '<leader>q', '<cmd>wqa<CR>')
vim.keymap.set('n', '<leader>Q', '<cmd>q!<CR>')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>c', '"_c')
vim.keymap.set('n', '<leader>x', '"_x')
vim.keymap.set('n', 'dw', 'diw')
vim.keymap.set('n', 'cw', 'ciw')
vim.keymap.set('n', 'dA', 'gg"_dG', {silent = true})
vim.keymap.set('n', 'cA', 'gg"_cG', {silent = true})
vim.keymap.set('n', '<leader>u', 'gUiw')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>wa<CR><C-l><esc>', {silent = true})
vim.keymap.set('n', '<leader>p', function ()
    local peek = require('peek')
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end)

vim.keymap.set('i', '<C-BS>', '<C-w>')

-- Jump out of terminal-insert mode straight into another window (opencode, :term).
-- For floating terminals (toggleterm, etc.) the key falls through to the shell —
-- otherwise <C-w>l would close the float.
for _, key in ipairs({ 'h', 'j', 'k', 'l' }) do
    vim.keymap.set('t', '<C-' .. key .. '>', function()
        if vim.api.nvim_win_get_config(0).relative ~= '' then
            return '<C-' .. key .. '>'
        end
        return [[<C-\><C-n><C-w>]] .. key
    end, {
        expr = true,
        silent = true,
        replace_keycodes = true,
        desc = 'Move to ' .. key .. ' window from terminal',
    })
end

vim.keymap.set('x', '<leader>d', '"_d')
vim.keymap.set('x', '<leader>c', '"_c')
vim.keymap.set('x', "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('x', "K", ":m '<-2<CR>gv=gv", {silent = true})

