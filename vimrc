"" Adds fzf fuzzy finding
set rtp+=/usr/local/opt/fzf
execute pathogen#infect()

syntax enable
"" What can I say, I like the colors
let g:onedark_termcolors=16
colorscheme onedark

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
set expandtab
set sr
set nowrap
set autoindent
set smartindent
"" Shows light line and hides original mode indicator
set laststatus=2
set noshowmode

"" Persistent undo
set undofile
set undodir=~/.vim/undodir

"" Try to use system clipboard as main register
set clipboard=unnamed

"" Vmath plugin
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

let g:lightline = {
      \ 'colorscheme': 'powerlineish',
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
highlight ColorColumn ctermbg=16 guibg=lightgrey

"" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"" netrw tree style
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"" searching
set hlsearch
set incsearch
set ignorecase

"" Navigate between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Split panes to the right and bottom
set splitbelow
set splitright

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

"" leader mappings
nnoremap <leader>noh :noh<CR>
nnoremap <leader>rn :set rnu!<CR>
nnoremap <leader>sp :set spell!<CR>

nnoremap <leader>fzf :FZF<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>co G:read .co_auth<CR>gg
nnoremap <leader>ser :-1read ~/.vim/templates/rails/service_template.rb<CR>ggfSi
