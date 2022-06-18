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

au BufReadPost $HOME/.scripts/* set syntax=sh

call plug#begin('$HOME/.vim/plugged')
" color schemes and icons
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" syntax highlighting
Plug 'kovetskiy/sxhkd-vim' 
Plug 'sheerun/vim-polyglot'
Plug 'mboughaba/i3config.vim'
Plug 'fladson/vim-kitty'

" undotree
Plug 'mbbill/undotree'

" Lualine statusline
Plug 'nvim-lualine/lualine.nvim'

" markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" debugger
Plug 'puremourning/vimspector'

" comments plugin
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" code runner
Plug 'xianzhon/vim-code-runner'

" sml
Plug 'jez/vim-better-sml'

" vim find and replace
Plug 'kqito/vim-easy-replace'

call plug#end()

" markdown config
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default emptkd
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" code runner options
let g:code_runner_save_before_execute = 1

" gruvbox config
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

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

" Code runner customization
let g:code_runner_save_before_execute = 1
let g:code_runner_output_window_size = 8
let g:CodeRunnerCommandMap = {
            \ 'c' : 'gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
            \ 'cpp' : 'g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt', 
            \ 'racket' : 'racket $fileName'
            \}

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

" general binds
let mapleader=' '
nmap <silent> <Tab> :bn<cr>
nmap <silent> <S-Tab> :bp<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <c-a> ggVG
nnoremap <leader>p <Plug>MarkdownPreview
nnoremap <leader>s <Plug>MarkdownPreviewStop
nnoremap <leader>t <Plug>MarkdownPreviewToggle
nnoremap q <cmd>q<CR>
nnoremap <S-q> <cmd>wq<CR>
inoremap <silent> <esc> <cmd>w<CR><esc>
nnoremap <silent> <esc> <cmd>w<CR><C-l><esc>
nnoremap D "_d
xnoremap D "_d
nnoremap <F4> <Plug>CodeRunner<CR>i
nnoremap dw diw
nnoremap cw ciw

" lualine config 
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
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
