" Mappings
let mapleader="\<space>"
let maplocalleader="\<space>"

" uppercase current word
nnoremap <leader><c-u> viwU
" open vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" reload vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" wrap current word in \"
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" wrap current word in '
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" wrap selection in "
vnoremap <leader>" xi"<esc>pa"<esc>
" wrap selection in '
vnoremap <leader>' xi'<esc>pa'<esc>

" open command promp
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"toggles between buffers
nnoremap <leader><TAB> <c-^>" Abbreviations

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" exit fast
inoremap jk <esc>

inoremap <C-j> <esc>
vnoremap <C-j> <esc>

inoremap <C-c> <esc>
vnoremap <C-c> <esc>

" lines 
map H ^
map L $

" No arrow keys --- force yourself to use the home row
"nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Save file faster
nmap <leader>w :w<CR>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

iabbrev @@ pzartem@gmail.com
iabbrev copy Copyright 2019 Artem Puzanov, all rights reserved.

