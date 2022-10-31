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
nnoremap('<leader>u', 'gUiw')
nnoremap('<leader>d', '<cmd>bd<CR>')
nnoremap('q', '<cmd>wqa<CR>')
nnoremap('<S-q>', '<cmd>q<CR>')
inoremap('<esc>', '<cmd>wa<CR><esc>', silent)
nnoremap('<esc>', '<cmd>wa<CR><C-l><esc>', silent)
nnoremap('D', '"_d')
xnoremap('D', '"_d')
nnoremap('dw', 'diw')
nnoremap('cw', 'ciw')
nnoremap('dA', 'ggdG')
nnoremap('<leader>fm', '<cmd>Neoformat<CR>', silent)
inoremap('<C-BS>', '<C-w>')
vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
