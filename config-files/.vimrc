

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tell-k/vim-autoflake'
Plugin 'chrisbra/csv.vim'


" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on


" .VIMRC
"
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader=","                 " map leader to ,

set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set nobackup nowritebackup noswapfile   " swap files
set history=1000                  " lots of history
set undolevels=1000               " lots of undo
set showcmd                       " display incomplete commands
set showmatch incsearch hlsearch  " search goodness
set laststatus=2                  " always show status
set autowrite                     " write before running commands
set hidden                        " keep buffers around
set encoding=utf8                 " utf-8 just about everything
set fileencoding=utf8             " ditto

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

" AUTOCMDS
""""""""""
augroup vimrcEx
  autocmd!
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType text setlocal textwidth=80
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType md, mkd, markdown  setlocal spell

  autocmd FileType ruby,haml,eruby,yaml,html,javascript,json,sass,vim,clojure set ai sw=2 sts=2 et
  autocmd FileType python,c           set ai sw=4 sts=4 et
  autocmd FileType go,make            set ai sw=4 sts=4 ts=4 noet
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd CmdwinEnter * :unmap <cr>
  autocmd CmdwinLeave * :call MapCR()
augroup END

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,.vimrc.bundles so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" COLOR & APPERARANCE
"""""""""""""""""""""
syntax on                        " Enable syntax highlighting
set t_Co=256                     " 256 colors
colorscheme pablo
set background=light

" MORE SETTINGS
"""""""""""""""
"set tabstop=4
"set softtabstop=0
"set shiftwidth=4
"set expandtab
set nowrap
set nolist
set textwidth=80
"set colorcolumn=80,+0								" show col at textwidth and 80
set cursorline                    " highlight current line
set cmdheight=1                   " Single-row cmd-line height
set switchbuf=useopen
set showtabline=2                 " Always show tab bar
set winwidth=80
set number numberwidth=5
"set smarttab
set scrolloff=5                   " keep more context when scrolling
set shell=bash                    " works better inside tmux
"set autoindent smartindent        " indentation
set mouse=a                       " make it easier for others to jump on my machine
set binary noeol                  " don't insert EOL
set ignorecase smartcase          " search case-sensitive if upper-cased
set shortmess=asI                 " remove intro message
set timeout timeoutlen=900 ttimeoutlen=100 " better command timeouts
set tags=./tags;/                 " ctags
set splitbelow splitright         " more natural pane-splitting
set wildmode=longest,list         " use emacs-style tab completion
set wildmenu                      " make tab completion for files/buffers act like bash
set wildignore+=*/tmp/*,*/gems/*,*/node_modules/*,*/dist/*,*/bower_components/*,*.pyc
set cole=1                                " set conceal level

" PLUGIN SETTINGS
"""""""""""""""""
let g:javascript_enable_domhtmlcss = 1    " helps with jsx
" let g:javascript_conceal_function  = "ƒ"  " hide 'function'

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#whitespace#enabled = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" CUSTOM BINDINGS
"""""""""""""""""

" .VIMRC EDITING
nmap <leader>rce :e $MYVIMRC<CR>
nmap <leader>rcb :e ~/.vimrc.bundles<CR>
nmap <leader>rcr :so $MYVIMRC<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" map <leader>l :silent !reload-chrome<CR>
nnoremap <leader>j :! eslint %<CR>

" OPEN FILES IN DIRECTORY OF CURRENT FILE
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" CHANGE GLOBAL DIRECTORY AND CURRENT DIRECTORY
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>lcd :lcd %:p:h<CR>

" Alphabetize with !sort
nnoremap <leader>[az vi{ !sort<CR>
nnoremap <leader>az gv !sort<CR>

" Quick Toggles
nnoremap <leader>w :set invwrap wrap?<CR>
nnoremap <leader>n :set invnumber<CR>
nnoremap <leader>p :set invpaste paste?<CR>

" CTRL
" Move around splits with <c-hjkl>
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l

map <c-x> <esc>:q<cr>             " easy quit
map <c-t> <esc>:tabnew<cr>        " new tab
nnoremap <leader><leader> <c-^>   " jump to prev buffer

" FUNCTIONS
"""""""""""
" Clear The Search Buffer When Hitting Return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Multipurpose Tab Key
" Indent if we're at the beginning of a line. Else do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Rename Current File
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>rn :call RenameFile()<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor  " Use Ag over Grep
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" Drop Syntastic settings at the end of the config file "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_python_python_use_codec=1


"set clipboard=unnamed
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"Ultisnips ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsUsePythonVersion=3

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set noundofile
set relativenumber