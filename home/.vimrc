" Vim configuration

if has('vim_starting')
  set nocompatible
endif

" General
set encoding=utf-8
set number
set nowrap
set showmatch
set showcmd
set hlsearch
set ignorecase
set smartcase
set history=1000
set undolevels=1000
set ttyfast
set termguicolors
set wildmenu
set wildmode=longest:full,full
set wildignore=*.swp,*.bak,*.pyc
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set foldmethod=indent
set foldlevel=99
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set splitright
set splitbelow
set updatetime=300

" Filetypes and plugins
filetype plugin indent on
syntax enable

" Plugin manager
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --all' }
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'joshdick/onedark.vim'
call plug#end()

" Leader and mappings
let mapleader = "\<Space>"
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
nnoremap <silent> <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <leader># :normal! I#<CR>
nnoremap <silent> <Space> za

" YouCompleteMe
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1

" Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_borderless_table = 1

" Appearance
set statusline=%f\:%l\:%c\ \[%L\]
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight SpellBad term=reverse ctermbg=red guibg=darkred
highlight Search ctermbg=DarkGray ctermfg=Red
highlight QuickFixLine term=reverse ctermbg=52
highlight BadWhitespace ctermbg=red guibg=darkred

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
try
  colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

" Language-specific settings
augroup editor_filetypes
  autocmd!
  autocmd FileType python setlocal textwidth=79 expandtab tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType javascript,html,css,yaml,json setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
  autocmd BufNewFile *.sh if filereadable(expand('~/.vim/shell_header.temp')) | 0read ~/.vim/shell_header.temp | endif
augroup END

let python_highlight_all = 1
let NERDTreeIgnore = ['\.pyc$', '\~$']
let g:syntastic_yaml_checkers = ['yamllint']
