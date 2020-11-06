"" What can I say, I like the colors
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
syntax on
execute pathogen#infect()
filetype plugin indent on
autocmd VimEnter * echo ">^.^<"
"" Don't try to be compatible with Vi
set nocompatible

set noerrorbells
set vb t_vb=
set ruler
"" Shows cursor line, sets it to highlight line in near black and bold text
set cursorline
hi CursorLine cterm=BOLD ctermbg=16 ctermfg=NONE
"" Shows numbers and numbers relative to cursor
set number
set rnu
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set sr
set nowrap
set autoindent
set smartindent
set t_Co=256
"" Shows light line and hides original mode indicator
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"" Show 80 character line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"" netrw tree style
let g:netrw_liststyle=3

"" searching
set hlsearch
set incsearch
set ignorecase

"" Navigate between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" I guess I can use the mouse sometimes
set mouse=n
set ttymouse=xterm2

"" remap esc
imap ∆ <ESC>
"" remap - to move line down and _ to move line up
map - ddp
map _ ddkP
"" set leader key to space
let mapleader = " "

nnoremap <leader>noh :noh<CR>
nnoremap <leader>rn :set rnu!<CR>
nnoremap <leader>sp :set spell!<CR>

nnoremap <leader>ff :grep -r
nnoremap <leader>gs :G<CR>
nnoremap <leader>w :w<CR>
