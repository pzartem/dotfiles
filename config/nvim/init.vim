let mapleader = "\<Space>"

" =============================================================================
" # PLUGINS
" =============================================================================

" Load vundle
set nocompatible
filetype off

call plug#begin()

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/LargeFile'
Plug 'terryma/vim-expand-region'

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux' " Run commands from vim in tmux

" GUI
Plug 'bling/vim-airline'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vimlab/split-term.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax / Linter
"Plug 'w0rp/ale'

" Beautiful snippets
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'honza/vim-snippets'

" Quoting / Parenthesizing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Test
Plug 'janko/vim-test'

" Syntatic language support
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'javascript' }

call plug#end()

" Plugin settings
let g:sneak#label = 1

" COC
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" fancy enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction 
let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Find symbol of current document.
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <leader>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <leader>a  :CocCommand actions.open<cr>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<TAB>" : "\<C-g>u\<CR>"
"
" Remap keys for gotab
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

noremap P :CocCommand<CR>

function! s:show_commands()
    call CocCommand()
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType golang let b:coc_root_patterns = ['.git', '.env']
"
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Ale
let b:ale_enable = 0 
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 500

" 
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
 
let g:ale_virtualtext_cursor = 1

" FZF
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-f> :Rg<cr>

nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>T :Tags<CR>

nnoremap <silent> <leader>gc :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"  \                               'options': '--tiebreak=index'}, <bang>0)

" Git gutter 
set updatetime=100

" Gutten tags 
let g:gutentags_cache_dir='~/.config/nvim/tags'
let g:gutentags_exclude_filetypes=['json', 'xml', 'yaml']

" CocExplorer
let loaded_netrwPlugin = 1
nnoremap <F3> :CocCommand explorer<CR>
nnoremap <leader>n :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.config/nvim/',
\   },
\   'alactiry': {
\      'root-uri': '~/.config/alacritty/',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" YCM
let g:ycm_python_interpreter_path = '/Users/artem/.config/nvim/python3_venv/bin/python'
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/global_extra_conf.py'

" Golang
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0 
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"let g:go_metalinter_enabled = ['vet']
"let g:go_metalinter_autosave_enabled = ['vet']
"let g:go_metalinter_command ='golangci-lint run --print-issued-lines=false --build-tags="" --exclude-use-default=true'
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_deadline = '40s'
"let g:go_list_type = 'quickfix'
"let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 1

" terminal
noremap <Leader>ts :Term<CR>
noremap <Leader>tv :VTerm<CR>


set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

nnoremap <buffer> <Leader>gt :GoTest<CR>
nnoremap <buffer> <Leader>gr :GoRename<CR>

"JavaScript 
" let g:ale_fixers = {'javascript': ['importjs', 'standard']}
" let g:ale_linters = {'javascript': ['importjs', 'standard', 'flow']}

let g:javascript_plugin_flow = 1

set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Rust
let g:rustfmt_autosave = 0
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" =============================================================================
" # Editor settings
" =============================================================================

filetype indent plugin on
set termguicolors

"Theme
syntax on
set t_Co=256
colors dracula
colorscheme dracula

set langmenu=en_US " set eng
set hidden " be able to switch buffers without file save
set showcmd " shows command in the last line
set showmatch "highlight matching (){}{}"
set cursorline "show current line
set nostartofline " some command move to the first non-blank line
set number

set signcolumn=yes " Always show sign color for ale or gitgutter

set autoindent " copy indent from current line when starting a new line


"set softtabstop=2 " the number of spaces to use when expanding tabs set shiftwidth=4 " the number of spaces to use when indenting -- or de-indenting -- a line
set expandtab " spaces instead of tabs
set smarttab " <Tab> in front of a line inserts blanks according to 'shiftwidth'
set tabstop=4 " the number of spaces that a tab equates to
set shiftwidth=4

" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set colorcolumn=120 " and give me a colored column
set mouse=a " Enable mouse usage (all modes) in terminals

" Folding
set nofoldenable

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

set showcmd " Show (partial) command in status line.
set shortmess+=c " don't give |ins-completion-menu| messages.


" Autocomplete
set completeopt=menu,preview
autocmd CompleteDone * pclose

" =============================================================================
" # Mappings
" =============================================================================
let mapleader="\<space>"
let maplocalleader="\<space>"

" open vimrc file
nnoremap <leader>el :CocList explPresets<cr>
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

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
" au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=120

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim

" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
	runtime! plugin/python_setup.vim
endif

function! InstallCocExt()
    CocInstall coc-json coc-go coc-xml coc-yaml coc-tsserver coc-html coc-explorer 
endfunction

command! -nargs=* CocExtSync call InstallCocExt()

