" Auto install vim-plug if it is not installed.  (per
" junegunn/vim-plug/wiki/tips#automatic-installation)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'fatih/molokai'
" Plug 'molokai'
Plug 'trusktr/seti.vim'

"Easy align
Plug 'junegunn/vim-easy-align'

"Snippets
Plug 'SirVer/ultisnips'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" General editing
Plug 'tpope/vim-repeat'         " remap '.' repeat in a way that plugins can use
Plug 'tpope/vim-surround'       " manage surroundings ie () in pairs
Plug 'scrooloose/nerdcommenter' " for commenting
"Plug 'scrooloose/syntastic'     " syntax checking 
Plug 'ervandew/supertab'        " use <Tab> for all your insert completion needs

"Plug 'tpope/vim-rails'          

" Languages
Plug 'fatih/vim-go'             " go development
Plug 'vim-ruby/vim-ruby'        " ruby development
Plug 'pangloss/vim-javascript'  " javascript development

" JSON formatting
Plug 'elzr/vim-json'            " JSON highlighting

"A fast, as-you-type, fuzzy search code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } 

"For exploring Go code - The plugin requires a Go helper program
"go get github.com/garyburd/go-explorer/src/getool
Plug 'garyburd/go-explorer'

" All of your Plugins must be added before the following line
call plug#end()            " required

set nocompatible           " be iMproved, required
filetype off               " required

filetype plugin indent on  " required

"
" Settings
" 

"remap semi colon to colon in normal mode - no recursive
"nore ; :
"nore : ;

"allow backspacing over everything in insert mode
set noerrorbells                " No beeps
set number                      "line numbers
set backspace=indent,eol,start
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set nobackup                    " Don't create annoying backup files
set noswapfile                  " Don't use swapfile

set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.

set guifont=Monaco:h16.00
set background=dark
colorscheme molokai

"store lots of :cmdline history
set history=1000

set incsearch   "find the next match as we type the search
set hlsearch    "highlight searches by default
set ignorecase  "Search case insensitive

" speed up syntax highlighting
"set nocursorcolumn
"set nocursorline

"set nowrap      "dont wrap lines
set wrap        "wrap lines
" Make it obvious where 80 characters is
"set textwidth=80
set textwidth=90
set colorcolumn=+1
set linebreak   "wrap lines at convenient points

set pastetoggle=<F6>

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent


"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

"hide buffers when not displayed
set hidden

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
  let g:CSApprox_loaded = 1
endif

"NERDTree stuff
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
" open on the right
let g:NERDTreeWinPos = "right"

" open NERDTree on startup and set focus to main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"NERDTree Stuff end

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>
"switch buffers easily
:nnoremap <F5> :buffers<CR>:buffer<Space>

"make ctrl-s save the file - in both insert and normal mode
"only works in macvim, need to 'stop the flow' in the terminal
"works in the terminal by adding the following to .bashrc/.zshrc
"stty -ixon
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> <esc>:w<CR>

"make ctrl-q quit completely, in both normal and insert mode
"dont save automatically
inoremap <C-q> <esc>:qall<CR>
nnoremap <C-q> <esc>:qall<CR>

"mark syntax errors with :signs
let g:syntastic_enable_signs=1


 " Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
"let g:go_fmt_fail_silently = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1


let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_extra_types = 1      " was 0
let g:go_highlight_operators = 1        " was 0
let g:go_highlight_space_tab_error = 1  " was 00
let g:go_highlight_trailing_whitespace_error = 0

let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1               " highlight other variables with same name
let g:go_auto_type_info = 1							" auto add imports

"Not sure what the below does, copied from fatih, but commenting out for now
"au FileType go nmap <Leader>s <Plug>(go-def-split)
"au FileType go nmap <Leader>v <Plug>(go-def-vertical)
"au FileType go nmap <Leader>in <Plug>(go-info)
"au FileType go nmap <Leader>ii <Plug>(go-implements)

au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>g  <Plug>(go-gbbuild)
au FileType go nmap <leader>t  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>f :GoImports<CR>


" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1


"remap jj to ESC in insert mode
inoremap jj <Esc>
nnoremap JJJJ <Nop>
