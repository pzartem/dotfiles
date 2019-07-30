call plug#begin('~/.config/nvim/plugged')
" General
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-scripts/LargeFile'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux' " Run commands from vim in tmux

" Status bar
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'

" VimDark
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax / Linter
Plug 'w0rp/ale'

" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'

" Autocomplete
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Quoting / Parenthesizing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'terryma/vim-multiple-cursors'

" Sinppets
Plug 'honza/vim-snippets'

" Golang
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'javascript' }
Plug 'wokalski/autocomplete-flow', { 'for': 'javascript' }

" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()
