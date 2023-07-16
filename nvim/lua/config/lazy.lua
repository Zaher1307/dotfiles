local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local opts = {
    concurrency = 4, ---@type number
    install = {
        colorscheme = { 'catppuccin' },
    },
    change_detection = {
        enabled = true,
        notify = true,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'tarPlugin',
                'netrwPlugin',
                'zipPlugin',
            },
        },
    },
}

-- Map leader key to <space>
vim.g.mapleader = ' '

require('lazy').setup({
    'kyazdani42/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'nvim-lualine/lualine.nvim',
    'CRAG666/code_runner.nvim',
    { 'williamboman/mason.nvim', config = true },
    'mfussenegger/nvim-dap',
    'mxsdev/nvim-dap-vscode-js',
    'rcarriga/nvim-dap-ui',
    'kyazdani42/nvim-tree.lua',
    'akinsho/toggleterm.nvim',
    'lewis6991/gitsigns.nvim',
    { 'toppair/peek.nvim', build = 'deno task --quiet build:fast' },
    { 'catppuccin/nvim', name = 'catppuccin' },
    'voldikss/vim-floaterm',
    {
        'ptzz/lf.vim',
        keys = {
            { '<leader>lf', vim.cmd.Lf, desc = 'lf' },
        },
    },
    'vim-scripts/ReplaceWithRegister',
    'segeljakt/vim-silicon',
    {'neoclide/coc.nvim', branch = 'release'},
}, opts)
