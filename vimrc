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

set updatetime=300
"" Override Italics
set t_ZH=[3m
set t_ZR=[23m
set noerrorbells
set vb t_vb=
set ruler
"" Shows cursor line, sets it to highlight line in near black and bold text
set cursorline
hi CursorLine cterm=BOLD ctermbg=16 ctermfg=NONE
hi Comment cterm=italic
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

"" backspace through anything
set backspace=indent,eol,start

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
"" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"" CoC configuration
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"" netrw tree style
let g:netrw_liststyle = 3
let g:netrw_banner = 0

"" fzf window colors match colorscheme
""let g:fzf_colors =
""\ { 'fg':      ['fg', 'Normal'],
""  \ 'bg':      ['bg', 'Normal'],
""  \ 'hl':      ['fg', 'Comment'],
""  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
""  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
""  \ 'hl+':     ['fg', 'Statement'],
""  \ 'info':    ['fg', 'PreProc'],
""  \ 'border':  ['fg', 'Ignore'],
""  \ 'prompt':  ['fg', 'Conditional'],
""  \ 'pointer': ['fg', 'Exception'],
""  \ 'marker':  ['fg', 'Keyword'],
""  \ 'spinner': ['fg', 'Label'],
""  \ 'header':  ['fg', 'Comment'] }

"" Show file preview when :Files is called
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': '--info=inline'}), <bang>0)

"" searching
set hlsearch
set incsearch
set ignorecase

"" Navigate between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" Split panes to the right
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

nnoremap <leader>fzf :Files<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>co G:read .co_auth<CR>gg
nnoremap <leader>ser :-1read ~/.vim/templates/rails/service_template.rb<CR>ggfSi
nnoremap <leader>yf :let @+ = expand("%")<CR>
nnoremap <leader><leader>e :CocCommand explorer<CR>
