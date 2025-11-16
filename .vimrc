" Basic Settings
set nocompatible                " required
set noexpandtab
set tabstop=4
set number                      " Show line number
set showmatch                   " Highlight matches {[()]}
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set ignorecase smartcase
set encoding=utf-8
set termguicolors
set nowrap

" MarkDown

" https://github.com/preservim/vim-markdown?tab=readme-ov-file#syntax-concealing
" set conceallevel=2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_borderless_table = 1

" Display Settings
set hlsearch                    " Highlights search results
set showcmd                     " Shows current command in the statusline
set cursorline
set exrc                        " Read <cwd>/.vimrc
set ttyfast                     " More characters will be sent to the screen for redrawing
set wildmenu                    " A better menu in command mode
set wildmode=longest:full,full
" set laststatus=2
set statusline=%f\:%l\:%c\ \[%L\]

" Color Settings
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight SpellBad term=reverse ctermbg=red
highlight Search ctermbg=DarkGray
highlight Search ctermfg=Red
highlight QuickFixLine term=reverse ctermbg=52  " Change QuickFix selected line color

" Syntax and Filetype Settings
syntax on
" filetype off                    " required
filetype plugin indent on       " required

" Runtime Paths
set runtimepath^=~/.fzf
set runtimepath^=~/.vim/plugged/fzf.vim
set runtimepath+=~/.vim/bundle/Vundle.vim

" Grep Program
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" ======= let Vundle manage Vundle, required ==========================
" ======= add all your plugins here ===================================
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required

" Vim-Plug Plugin Manager
" ===================== https://github.com/junegunn/vim-plug =====
call plug#begin()
" Post-update hook can be a lambda expression
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" ===================== Customize mapping =========================
let mapleader = "\<space>"

" ycm-core/YouCompleteMe
let g:Ycm_python_binary_path='python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Nerdtree mappings. nt = toggle, nf = find.
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
" Commenting Lines
nnoremap <Leader># :normal I#<Esc>

" ======= Python PEP8 Settings ==================================================
au BufNewFile,BufRead *.py
    \ set textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=darkred

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ======================= atom one dark scheme ==============================
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

" JS, HTML, CSS, YAML, JSON Settings
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml, *.json
    \ set noexpandtab
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Enable Folding
set foldmethod=indent
set foldlevel=99
" Enable Folding with the spacebar
nnoremap <space> za

" +========= Shell Script Template ===========================================
au bufnewfile *.sh 0r $HOME/.vim/shell_header.temp

" +========= YAML Configs ====================================================
let g:syntastic_yaml_checkers = ['yamllint']

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match yamlDelimiter	"[:,-]"
syntax match yamlBlock "[\[\]\{\}\|\>]"
syntax match yamlOperator "[?^+-]\|=>"

syntax region yamlComment	start="\#" end="$"
syntax match yamlIndicator	"#YAML:\S\+"

syntax region yamlString	start="'" end="'" skip="\\'"
syntax region yamlString	start='"' end='"' skip='\\"' contains=yamlEscape
syntax match  yamlEscape	+\\[abfnrtv'"\\]+ contained
syntax match  yamlEscape	"\\\o\o\=\o\=" contained
syntax match  yamlEscape	"\\x\x\+" contained

syntax match  yamlType	"!\S\+"

syntax keyword yamlConstant NULL Null null NONE None none NIL Nil nil
syntax keyword yamlConstant TRUE True true YES Yes yes ON On on
syntax keyword yamlConstant FALSE False false NO No no OFF Off off

syntax match  yamlKey	"\w\+\ze\s*:"

syntax match  yamlAnchor	"&\S\+"
syntax match  yamlAlias	"*\S\+"

" Setup the highlighting links
highlight link yamlConstant Keyword
highlight link yamlIndicator PreCondit
highlight link yamlAnchor	Function
highlight link yamlAlias	Function
highlight link yamlKey		Identifier
highlight link yamlType	Type

highlight link yamlComment	Comment
highlight link yamlBlock	Operator
highlight link yamlOperator	Operator
highlight link yamlDelimiter	Delimiter
highlight link yamlString	String
highlight link yamlEscape	Special
