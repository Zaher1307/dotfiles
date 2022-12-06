local Remap = require("config.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local inoremap = Remap.inoremap
local nmap = Remap.nmap

local silent = {silent = true}

nnoremap('<Tab>', ':bn<cr>', silent)
nnoremap('<S-Tab>', ':bp<cr>', silent)
nnoremap('<c-a>', 'ggVG')
nnoremap('q', '<cmd>wqa<CR>')
nnoremap('Q', '<cmd>q<CR>')
nnoremap('<S-q>', '<cmd>q<CR>')
nnoremap('<leader>w', '<cmd>wa<CR>', silent)
nnoremap('D', '"_d')
nnoremap('dw', 'diw')
nnoremap('cw', 'ciw')
nnoremap('dA', 'gg"_dG<cmd>w<CR><C-l><esc>', silent)
nnoremap('cA', 'gg"_cG<cmd>w<CR>', silent)
nnoremap('<leader>u', 'gUiw')
nnoremap('<leader>d', '<cmd>bd<CR>')
nnoremap('<leader>fm', '<cmd>Neoformat<CR>', silent)

inoremap('<esc>', '<cmd>wa<CR><esc>', silent)
inoremap('<C-BS>', '<C-w>')

xnoremap('D', '"_d')

vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
