-- Replace with register
vim.keymap.set("n", "gr", "<Plug>ReplaceWithRegisterOperator")
vim.keymap.set("x", "gr", "<Plug>ReplaceWithRegisterVisual")
vim.keymap.set("n", "grr", "<Plug>ReplaceWithRegisterLine==")
vim.keymap.set("n", "gR", "<Plug>ReplaceWithRegisterOperator$")

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

vim.keymap.set('x', '<leader>d', '"_d')
vim.keymap.set('x', '<leader>c', '"_c')
vim.keymap.set('x', "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('x', "K", ":m '<-2<CR>gv=gv", {silent = true})

