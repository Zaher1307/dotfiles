call plug#begin('$HOME/.vim/plugged')
" color schemes and icons
Plug 'EdenEast/nightfox.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'p00f/nvim-ts-rainbow'
Plug 'andymass/vim-matchup'

" undotree
Plug 'mbbill/undotree'

" Lualine statusline
Plug 'nvim-lualine/lualine.nvim'

" comments plugin
Plug 'tpope/vim-commentary'

" code runner
Plug 'CRAG666/code_runner.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'j-hui/fidget.nvim'

" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/rust-tools.nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" sql
Plug 'nanotee/sqls.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'guysherman/pg.nvim'

" debugger 
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'

" other
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'sbdchd/neoformat'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'farmergreg/vim-lastplace'

call plug#end()

" general binds
let mapleader=' '

lua require("config")
