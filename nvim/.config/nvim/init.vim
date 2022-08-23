" Plugins {{{
call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'

" UML
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Zen
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" VCS
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'

" general coding stuff
Plug 'preservim/nerdcommenter'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'dag/vim-fish'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/symbols-outline.nvim'

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'vim/'}

" Rust
Plug 'rust-lang/rust.vim'

" HTML, CSS, JS, TS, ...
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" colorschemes
Plug 'dracula/vim'
Plug 'AlessandroYorba/Alduin'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'

" Ansible
Plug 'pearofducks/ansible-vim'

" Terraform
Plug 'hashivim/vim-terraform'

" AVR ASM
Plug 'vim-scripts/avrasm.vim'

" Ledger
Plug 'ledger/vim-ledger'

" Java
Plug 'mfussenegger/nvim-jdtls'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" }}}

set autowrite
let &t_Co=256
:set background=dark
:syntax on
:set cc=80
:set number
:set nocompatible
:set hidden
:set foldmethod=syntax
:set shell=/usr/local/bin/bash

" Tabs & Autoindentation {{{
:set expandtab     " don't use actual tab character (ctrl-v)
:set shiftwidth=2
:set softtabstop=2
:set autoindent    " turns it on
" }}}

" Type jj/jk instead of <ESC> to exit insert mode
inoremap jj l
inoremap jk ^[l

:set laststatus=2	" Show statusbar always
:set cursorline		" highlight the current line

" vim-latex
" " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
"filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:latex_view_general_viewer='open -a Preview'
let g:latex_view_method='general'

let g:latex_complete_close_braces=1
let g:latex_complete_recursive_bib=1

" Airline
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀︎'

set encoding=utf-8

let g:vim_markdown_folding_disabled = 1

set wrap
set linebreak
let &showbreak='↪ '

" Search
set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "

" Go
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "gopls"
let g:go_fmt_fail_silently = 0
let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
autocmd FileType go nmap <leader>gb <Plug>(go-build)
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
let g:go_fmt_experimental = 1 " Prevent VIM from refolding all folds on save
let g:go_metalinter_command = "golangci-lint"

"Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Telescope mappings
nnoremap <Leader>ff <cmd> Telescope find_files<cr>
nnoremap <Leader>fbu <cmd> Telescope buffers<cr>
nnoremap <Leader>ft <cmd> Telescope tags<cr>
nnoremap <Leader>fg <cmd> Telescope live_grep<cr>
nnoremap <Leader>fbr <cmd> Telescope git_branches<cr>
nnoremap <Leader>fr <cmd> Telescop lsp_references<cr>
nnoremap <Leader>fd <cmd> Telescop lsp_references<cr>

" fugitive mappings
nnoremap <Leader>gc <cmd> Git commit<cr>
nnoremap <Leader>gs <cmd> Git<cr>
nnoremap <Leader>gps <cmd> Git push<cr>
nnoremap <Leader>gpl <cmd> Git pull<cr>

"Automatically reload files on change
set autoread

" Shorten update time (default: 800 ms)
set updatetime=100

"Switch buffers more conveniently
"Shift+h & Shift+l
map <S-l> :bnext<CR>
map <S-h> :bprevious<CR>

"Backspace works for everything in insert mode
set backspace=2


" Because I often type ':W' instead of ':w'
:command W w

" Do not check spelling please, thank you very much
set nospell

let g:vim_markdown_folding_disabled = 1

" Use shortcut to toggle paste mode
set pastetoggle=<F2>

" Use shortcut to toggle symbols-outline
nmap <F3> :SymbolsOutline<CR>

nmap <F4> :NvimTreeToggle<CR>

:set guioptions-=m "Don't show menu bar
:set guioptions-=T "Don't show tool bar
:set guioptions-=r "Don't show scroll bar (right)
:set guioptions-=L "Don't show scroll bar (left)

 "nerdcommenter
let g:NERDCreateDefaultMappings = 0
noremap <leader>c<space> <plug>NERDCommenterToggle

" Rust
let g:rustfmt_autosave = 1

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set rtp+=/usr/local/opt/fzf

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

colorscheme nord
let g:limelight_conceal_ctermfg = 'gray'

" cmp-nvim
set completeopt=menuone,noselect,noinsert

lua <<EOF
require('config')
EOF
