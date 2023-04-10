-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local opts = {
    concurrency = 4, ---@type number limit the maximum amount of concurrent tasks
    install = {
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "catppuccin" },
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "netrwPlugin",
                "zipPlugin",
            },
        },
    },
}

-- Map leader key to <space>
vim.g.mapleader = " "
require("lazy").setup({
    'EdenEast/nightfox.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'andymass/vim-matchup',
    'mbbill/undotree',
    'nvim-lualine/lualine.nvim',
    'tpope/vim-commentary',
    'CRAG666/code_runner.nvim',
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',
    'nvim-lua/lsp_extensions.nvim',
    'simrat39/symbols-outline.nvim',
    'j-hui/fidget.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'simrat39/rust-tools.nvim',
    { 'tzachar/cmp-tabnine', build = "./install.sh" },
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'nanotee/sqls.nvim',
    'MunifTanjim/nui.nvim',
    'guysherman/pg.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'mxsdev/nvim-dap-vscode-js',
    'kyazdani42/nvim-web-devicons',
    'folke/trouble.nvim',
    'tpope/vim-surround',
    'windwp/nvim-autopairs',
    'kyazdani42/nvim-tree.lua',
    'akinsho/toggleterm.nvim',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'farmergreg/vim-lastplace',
    { 'toppair/peek.nvim', build = "deno task --quiet build:fast"},
    { "catppuccin/nvim", name = "catppuccin" },
    "voldikss/vim-floaterm",
    {
        "ptzz/lf.vim",
        keys = {
            { "<leader>lf", vim.cmd.Lf, desc = "lf" },
        },
    },
    "vim-scripts/ReplaceWithRegister",
    "segeljakt/vim-silicon",
    "andymass/vim-matchup",
})
