
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
Plugin 'airblade/vim-gitgutter'
Plugin 'SuperTab'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

" coding stuff
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'mxw/vim-jsx'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'lervag/vim-latex'
Plugin 'leafgarland/typescript-vim'

" colorschemes
Plugin 'dracula/vim'
Plugin 'AlessandroYorba/Alduin'
Plugin 'github-theme'
Plugin 'Skittles-Berry'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

let &t_Co=256
:set background=dark
:syntax on
:set cc=100
colorscheme dracula
:set number
:set nocompatible
:set hidden

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
let g:airline_theme = 'base16'

set encoding=utf-8

set wrap
set linebreak
let &showbreak='↪ '

" Search
set incsearch " Preview as you type "
set ignorecase " Don't be case sensitive "
set smartcase " If you type a capital letter, be case sensitive "

"Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Fuzzyfinder mappings
nnoremap <Leader>f :FufFile **/<cr>
nnoremap <Leader>b :FufBuffer<cr>
nnoremap <Leader>t :FufTag<cr>

"Automatically reload files on change
set autoread

"Switch buffers more conveniently
"Shift+J & Shift+K
map <S-K> :bnext<CR>
map <S-J> :bprevious<CR>

"Backspace works for everything in insert mode
set backspace=2

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

let g:jsx_ext_required = 0
