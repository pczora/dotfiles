" vim:fdm=marker
filetype off                  " required

" Vundle/Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'unimpaired.vim'
Plugin 'lervag/vim-latex'
Plugin 'surround.vim'
Plugin 'EasyMotion'
Bundle 'jellybeans.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Plugin 'airblade/vim-gitgutter'
Plugin 'mattr555/vim-instacode'
Plugin 'flazz/vim-colorschemes'
Plugin 'trailing-whitespace'
Plugin 'delimitMate.vim'
Plugin 'The-NERD-Commenter'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Skittles-Berry'
Plugin 'github-theme'
Plugin 'SuperTab'
Plugin 'syntastic'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Bundle 'honza/vim-snippets'
"Plugin 'UltiSnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rust-lang/rust.vim'
Plugin 'bling/vim-airline'
Plugin 'mikewest/vimroom'
Plugin 'ajh17/VimCompletesMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

let &t_Co=256
:colorscheme gruvbox
:set background=dark
:syntax on
:set number
:set cc=80
:set nocompatible
:set hidden

" Set correct font when using MacVIM
"if has("gui_running")
    "let s:uname = system("uname")
    "if s:uname == "Darwin\n"
        "set guifont=Inconsolata\ for\ Powerline:h12
    "endif
"endif

" Tabs & Autoindentation {{{
:set tabstop=8     " tabs are at proper location
:set expandtab     " don't use actual tab character (ctrl-v)
:set shiftwidth=4  " indenting is 4 spaces
:set autoindent    " turns it on
:set smartindent   " does the right thing (mostly) in programs
":set cindent       " stricter rules for C programs
" }}}

" Type jj instead of <ESC> to exit insert mode
inoremap jj l

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
let g:latex_view_general_viewer='open'
let g:latex_view_method='general'

let g:latex_complete_close_braces=1
let g:latex_complete_recursive_bib=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀︎'

set encoding=utf-8

set wrap
set linebreak

let &showbreak='↪ '

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
map <S-J> :bnext<CR>
map <S-K> :bprevious<CR>

"Backspace works for everything in insert mode
set backspace=2

"Indentation for Python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"YouCompleteME
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags fromCtags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in string
