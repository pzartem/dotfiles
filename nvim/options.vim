filetype indent plugin on
set nocompatible

"  UI
syntax on
" let g:dracula_colorterm = 0
" colorscheme dracula
" color dracula

set t_Co=256
set background=dark
colorscheme PaperColor


set langmenu=en_US " set eng
set hidden " be able to switch buffers without file save
set showcmd " shows command in the last line
set showmatch "highlight matchjng (){}{}"
set cursorline "show current line
set nostartofline " some command move to the first non-blank line

"set relativenumber " Relative line numbers

set number " Also show current absolute lineet number
set signcolumn=yes " Always show sign color for ale or gitgutter

set autoindent " copy indent from current line when starting a new line
set smarttab " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set expandtab " spaces instead of tabs

set softtabstop=2 " the number of spaces to use when expanding tabs set shiftwidth=4 " the number of spaces to use when indenting -- or de-indenting -- a line
set tabstop=4 " the number of spaces that a tab equates to

" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set colorcolumn=100 " and give me a colored column
set mouse=a " Enable mouse usage (all modes) in terminals

" Folding
" set foldmethod=syntax
" set foldcolumn=1
" set foldlevelstart=99

set exrc " enable project specific .nvimrc files
set secure " disable write/shell commands in those files
set clipboard=unnamed

set splitbelow " put the new window below the current one
set splitright " put the new window right of the current one

" Disabling swap files
set noswapfile

" Ignore case when searching
set ignorecase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Show those damn hidden character
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•,space:·

" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=100 " and give me a colored column

" Autocomplete
set completeopt=menu,preview
autocmd CompleteDone * pclose

