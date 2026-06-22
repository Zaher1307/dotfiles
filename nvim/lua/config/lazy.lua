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
    'kyazdani42/nvim-tree.lua',
    'akinsho/toggleterm.nvim',
    'lewis6991/gitsigns.nvim',
    { 'toppair/peek.nvim', build = 'deno task --quiet build:fast' },
    { 'catppuccin/nvim', name = 'catppuccin' },
    {
        'ptzz/lf.vim',
        keys = {
            { '<leader>e', vim.cmd.Lf, desc = 'lf' },
        },
    },
    'gbprod/substitute.nvim',
    'segeljakt/vim-silicon',

    -- LSP + Mason
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',

    -- Snippets
    { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
    'rafamadriz/friendly-snippets',

    -- Formatting
    'stevearc/conform.nvim',

    -- Editing helpers
    'windwp/nvim-autopairs',
    'lukas-reineke/indent-blankline.nvim',
    'stevearc/oil.nvim',
    'kdheepak/lazygit.nvim',
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
    },

    -- AI coding assistant
    {
        'nickjvandyke/opencode.nvim',
        version = '*',
        dependencies = { 'folke/snacks.nvim' },
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require('nvim-lastplace').setup {
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            }
        end
    },
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.2',
        config = function()
            require('distant').setup {
                -- Applies Chip's personal settings to every machine you connect to
                --
                -- 1. Ensures that distant servers terminate with no connections
                -- 2. Provides navigation bindings for remote directories
                -- 3. Provides keybinding to jump into a remote file's parent directory
                ['*'] = require('distant.settings').chip_default()
            }
        end
    },
    -- 'github/copilot.vim',
    {
        'nosduco/remote-sshfs.nvim',
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    },
}, opts)
