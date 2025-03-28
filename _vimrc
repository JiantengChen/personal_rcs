map rc :e D:\softwares\Vim\_vimrc
        
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set scrolloff=5
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap = nzz
noremap - Nzz
let mapleader=" "
noremap <esc><CR> :nohlsearch<CR>
map <C-y> :redo<CR>

noremap R :source .vimrc<CR>
noremap tu :vert term<CR>
map nr :set splitright<CR>:vsplit<CR>
map nl :set nosplitright<CR>:vsplit<CR>
map nd :set splitbelow<CR>:split<CR>
map nu :set nosplitbelow<CR>:split<CR>
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
"map <C-u> :res +5<CR>
"map <C-d> :res -5<CR>
"map <C-l> :vertical resize-5<CR>
"map <C-r> :vertical resize+5<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map tn :tabe<CR>
map tl :-tabnext<CR>
map th :+tabnext<CR>

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start

set laststatus=2
set autochdir


call plug#begin('D:\softwares\Vim\vim90\vimfiles\plugged')

let g:plug_url_format = 'git@github.com:%s.git'
Plug 'vim-airline/vim-airline'
Plug 'hzchirs/vim-material'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'iamcco/markdown-preview.nvim'
Plug 'vim-python/python-syntax'
Plug 'preservim/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
call plug#end()


let g:material_style='oceanic'
set background=dark
colorscheme vim-material

map tt :NERDTreeToggle<CR>
map tf :NERDTreeFind<CR>

map tb :TagbarToggle<CR>

let g:python_highlight_all=1

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" coc.nvim

let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-python', 'coc-tsserver', 'coc-prettier', 'coc-python', 'coc-pyright', 'coc-snippets', 'coc-clangd']
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<LEADER>h"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <C-o> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:snips_author = 'Jianteng Chen'
let g:coc_snippet_next = '<tab>'
