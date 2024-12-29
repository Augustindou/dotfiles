" ---------------------------------------------
" Settings
" ---------------------------------------------

" Line numbering 
set number
set relativenumber

" Tabs & indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smartindent

" Undo & temporary files
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Wrap lines
set nowrap

" Search
set nohlsearch
set incsearch

" Colors
set termguicolors

" Keep 8 lines above / below cursor
set scrolloff=8

" Column for special indications
set signcolumn=yes

" Which characters are included in file names
set isfname+=@-@

" Crash recovery
set updatetime=50

" ??
set exrc

let mapleader=" "

" ---------------------------------------------
" Remaps
" ---------------------------------------------

" Project view
nnoremap <leader>pv :Ex

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor in place when joining lines
nnoremap J mzJ`z

" Keep cursor in the middle when jumping or searching
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep yanked word when pasting over text
xnoremap <leader>p \"_dP

" Delete without overriding yanked value
nnoremap <leader>d \"_d
vnoremap <leader>d \"_d

" Yank to clipboard (asbjornHaland)
nnoremap <leader>y \"+y
vnoremap <leader>y \"+y
vnoremap <leader>Y \"+Y

" Other
nnoremap Q <nop>
