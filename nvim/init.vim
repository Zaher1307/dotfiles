syntax on
set nocompatible 
set secure exrc
set path+=**,.**
set wildmenu
set clipboard=unnamedplus
set guicursor=i:hor20
set noerrorbells
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile
set nowrap
set colorcolumn=80
set nohlsearch
set encoding=utf-8
set showcmd
set incsearch
set hidden
set scrolloff=10
set mouse=a
set laststatus=2
set signcolumn=no

au BufReadPost $HOME/.scripts/* set syntax=sh

call plug#begin('$HOME/.vim/plugged')

" color schemes and icons
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'}

" git integration
Plug 'lewis6991/gitsigns.nvim'

" Telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" syntax highlighting
Plug 'kovetskiy/sxhkd-vim' 
Plug 'sheerun/vim-polyglot'
Plug 'mboughaba/i3config.vim'
Plug 'fladson/vim-kitty'

" formatter 
Plug 'vim-autoformat/vim-autoformat'

" undotree
Plug 'mbbill/undotree'

" Lualine statusline
Plug 'nvim-lualine/lualine.nvim'

" debugger
Plug 'puremourning/vimspector'

" comments plugin
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" code runner
Plug 'CRAG666/code_runner.nvim'

" sml
Plug 'jez/vim-better-sml'

" vim find and replace
Plug 'kqito/vim-easy-replace'

call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> ca <Plug>(coc-codeaction)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <silent> cd :call ShowDocumentation()<CR>

" general binds
let mapleader=' '
nmap <silent> <Tab> :bn<cr>
nmap <silent> <S-Tab> :bp<cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>fm :Autoformat<cr>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <c-a> ggVG
nnoremap <leader>p <Plug>MarkdownPreview
nnoremap <leader>s <Plug>MarkdownPreviewStop
nnoremap <leader>t <Plug>MarkdownPreviewToggle
nnoremap q <cmd>wqa<CR>
nnoremap <S-q> <cmd>q<CR>
inoremap <silent> <esc> <cmd>wa<CR><esc>
nnoremap <silent> <esc> <cmd>wa<CR><C-l><esc>
nnoremap D "_d
xnoremap D "_d
nnoremap dw diw
nnoremap cw ciw
inoremap <C-BS> <C-w>

" ShowDocumentation config
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" lualine config 
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'modus-vivendi',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'} 
  },
  extensions = {}
}
END
" Restores the cursor position and its autocmd.
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" sml configuration
function! UseREPL()
  write
  SMLReplStart
  wincmd J
  resize 10
  wincmd k
  SMLReplClear
  sleep 90m
  SMLReplUse
endfunction

augroup vimbettersml

  au!
  au FileType sml nnoremap <silent> <buffer> <leader>iu :call UseREPL()<CR>
  au FileType sml nnoremap <silent> <buffer> <F1> :SMLReplStop<CR>:call UseREPL()<CR>
  au FileType sml nnoremap <silent> <buffer> <F2> :SMLReplStop<CR>

  " ----- Other settings -----
  let g:sml_smlnj_executable = '/usr/lib/smlnj/bin/sml'

augroup END

" Code runner configuration
lua << END
require('code_runner').setup {
    mode = 'term',
    focus = true,
    term = {
        size = 11
    },
    filetype = {
        go = 'go run $fileName',
        javascript = 'node $fileName',
        rust = 'rustc $fileName && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        c = 'gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        cpp = 'g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        python = 'python $fileName',
    },

    vim.keymap.set('n', '<F4>', ':w<CR>:RunCode<CR>i', { noremap = true, silent = true }),
    vim.keymap.set('n', '<F16>', ':RunClose<CR>', { noremap = true, silent = true }),
}
END

" color theme configuration
lua << END
local palettes = {
    nightfox = {
        black   = '#282a36',
        white   = '#f8f8f2',
        red     = '#ff5555',
        green   = '#78b060',
        blue    = '#5377c6',
        yellow  = '#f1fa8c',
        magenta = '#bd93f9',
        cyan    = '#8be9fd',
        orange  = '#ffb86c',
        pink    = '#ff79c6',
        comment = '#7c839c',
        sel1    = '#44475a',
        sel2    = '#c082a1'
    }
}

local options = {
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = 'italic',
        conditionals = 'italic,bold',
        functions = 'bold',
        types = 'italic',
    }
}

require('nightfox').setup {
    options = options,
    palettes = palettes
}

vim.cmd('colorscheme nightfox')
END

lua << END
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  }
}
END

