local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local silent = {silent = true}
-- Replace with register
vim.keymap.set("n", "gr", "<Plug>ReplaceWithRegisterOperator")
vim.keymap.set("x", "gr", "<Plug>ReplaceWithRegisterVisual")
vim.keymap.set("n", "grr", "<Plug>ReplaceWithRegisterLine==")
vim.keymap.set("n", "gR", "<Plug>ReplaceWithRegisterOperator$")

nnoremap('<Tab>', ':bn<cr>', silent)
nnoremap('<S-Tab>', ':bp<cr>', silent)
nnoremap('<c-a>', 'ggVG')
nnoremap('<leader>q', '<cmd>wqa<CR>')
nnoremap('<leader>Q', '<cmd>q!<CR>')
nnoremap('<leader>d', '"_d')
nnoremap('<leader>c', '"_c')
nnoremap('<leader>x', '"_x')
nnoremap('dw', 'diw')
nnoremap('cw', 'ciw')
nnoremap('dA', 'gg"_dG', silent)
nnoremap('cA', 'gg"_cG', silent)
nnoremap('<leader>u', 'gUiw')
nnoremap('<leader>bd', '<cmd>bd<CR>')
nnoremap('<leader>fm', function()
    vim.lsp.buf.format({
        timeout_ms = 10000,
    })
end, silent)
nnoremap('<leader>w', '<cmd>wa<CR><C-l><esc>', silent)
nnoremap('<leader>p', function ()
    local peek = require('peek')
    if peek.is_open() then
        peek.close()
    else
        peek.open()
    end
end)

inoremap('<C-BS>', '<C-w>')

xnoremap('<leader>d', '"_d')
xnoremap('<leader>c', '"_c')
xnoremap("J", ":m '>+1<CR>gv=gv", silent)
xnoremap("K", ":m '<-2<CR>gv=gv", silent)

