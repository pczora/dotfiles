
" Vundle/Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Utility functions/stuff used by other plugins
Plugin 'L9'

Plugin 'unimpaired.vim'
Plugin 'surround.vim'
Plugin 'EasyMotion'
Plugin 'SuperTab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf.vim'
" VCS
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" general coding stuff
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'spf13/vim-autoclose'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'

" JS, React, GraphQL, ...
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'jparise/vim-graphql'
Plugin 'prettier/vim-prettier'
Plugin 'elzr/vim-json'

" Go
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" colorschemes
Plugin 'dracula/vim'
Plugin 'AlessandroYorba/Alduin'
Plugin 'github-theme'
Plugin 'Skittles-Berry'
Plugin 'chriskempson/base16-vim'

" Ansible
Plugin 'pearofducks/ansible-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

set autowrite
let &t_Co=256
:set background=dark
:syntax on
:set cc=80
colorscheme base16-gruvbox-dark-medium
:set number
:set nocompatible
:set hidden
:set foldmethod=syntax

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
filetype plugin on
"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
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

" Let YCM and Ultisnips both use TAB
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Go
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
let g:go_fmt_experimental = 1 " Prevent VIM from refolding all folds on save

"Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Fuzzyfinder mappings
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Tags<cr>

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

" Enable neocomplete (i.e. suggest completions w/o needing to us C-x C-o)
let g:neocomplete#enable_at_startup = 1
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" JS stuffs
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers = ['eslint']

" Because I often type ':W' instead of ':w'
:command W w

" Do not check spelling please, thank you very much
set nospell

let g:vim_markdown_folding_disabled = 1

" Use shortcut to toggle paste mode
set pastetoggle=<F2>

" Use shortcut to toggle Tagbar
nmap <F3> :TagbarToggle<CR>
" Don't sort tags in Tagbar by name
let g:tagbarSort = 0

" Use shortcut to toggle NERDTree
nmap <F4> :NERDTreeToggle<CR>
" Close NERDTRee when opening a file
let g:NERDTreeQuitOnOpen = 1

:set guioptions-=m "Don't show menu bar
:set guioptions-=T "Don't show tool bar
:set guioptions-=r "Don't show scroll bar (right)
:set guioptions-=L "Don't show scroll bar (left)

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set rtp+=/usr/local/opt/fzf

