" Plugins {{{
call plug#begin()

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
Plug 'majutsushi/tagbar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'dag/vim-fish'

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

"Disable bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Telescope mappings
nnoremap <Leader>ff <cmd> Telescope find_files<cr>
nnoremap <Leader>fb <cmd> Telescope buffers<cr>
nnoremap <Leader>ft <cmd> Telescope tags<cr>
nnoremap <Leader>fg <cmd> Telescope live_grep<cr>
nnoremap <Leader>fb <cmd> Telescope git_branches<cr>

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

" cmp-nvim
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['yamlls'].setup {
  }
  require('lspconfig')['terraformls'].setup {
  }
  require('lspconfig')['bashls'].setup {
  }
  require('lspconfig')['sumneko_lua'].setup {
    settings = {
      runtime = {
        version = 'LuaJIT'
      }
    },
    telemetry = {
      enable = false,
    }
  }

  require('nvim-autopairs').setup{}
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
  require'nvim-treesitter.configs'.setup{}
EOF
