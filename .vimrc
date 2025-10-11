" ------------Keybinds-------------- " 
let mapleader = "\<Space>"

set autoindent expandtab tabstop=4 shiftwidth=4

"netrw"
nnoremap <leader>pv :Lexplore<CR>

"tab system"
nnoremap <leader>tp :tabnew<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tb :tabp<CR>

"movement"
inoremap jk <esc>

" ------------Plugins--------------- "

" Vim plugins
call plug#begin('~/.vim/plugged')

Plug 'srcery-colors/srcery-vim'
Plug 'rose-pine/vim'    
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'for':['zig','cmake','rust',
     \'java','json', 'haskell', 'ts','sh', 'cs',
     \'yaml', 'c', 'cpp', 'd', 'go',
     \'python', 'dart', 'javascript', 'vim', 'php', 'html', 'css'], 'branch': 'release'}

Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" ------------General--------------- "
set termguicolors

set background=dark
colorscheme srcery

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
if has('syntax')
    syntax on
endif

set number relativenumber
set cursorline

" ------------Lightline Config---------- "

" Always show statusline
set laststatus=2

" Don't show mode in command line (lightline shows it)
set noshowmode

" Basic lightline config
let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ }

" ------------Clipboard--------------- "
if has('clipboard')
    set clipboard=unnamedplus
endif

" ------------FZF Config--------------- "

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --glob "!*.log"'
  set grepprg=rg\ --vimgrep
endif

" Ctrl-p to search files
nnoremap <leader>p :Files<CR>

" Search in open buffers
nnoremap <leader>b :Buffers<CR>

" Search in file content (requires ripgrep)
nnoremap <leader>f :Rg<CR>

" Search in lines of current buffer
nnoremap <leader>l :BLines<CR>

" Search in all lines of all open buffers
nnoremap <leader>L :Lines<CR>

" Search git commits
nnoremap <leader>gc :Commits<CR>

" Search commands
nnoremap <leader>: :Commands<CR>

" ---------- background settings ------------ "
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Swap files 
set swapfile
set dir=~/swaps
