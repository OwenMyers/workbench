set nocompatible  

set backspace=indent,eol,start

set ttyfast "Fast terminal connection

set autoindent
set smarttab
"set cindent
set smartindent
set autowrite
set nolinebreak

"set wrapmargin=5
set nowrap
set textwidth=100
set joinspaces
set expandtab
set laststatus=2
set shiftwidth=4
set tabstop=4
set softtabstop=4
set visualbell
set statusline=%-25.45F\ %-2.9y%=%4l/%-4L\ %3.3v\ %3.3p%%%a%r%m
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set title
set fileformat=unix
set backupcopy=yes
set guioptions=f
set history=500
set ruler

syntax on
set background=dark        " adapt colors for background
"colorscheme wombat256      " use this color scheme (only works for xterm-color256)


if has("autocmd")
  filetype on
  filetype plugin on
  filetype indent on
endif

set showcmd
set showmatch
set showmode
set magic
set noignorecase
set incsearch
set nohlsearch

" This fixes tab completion
set wildmode=longest,list

" Abbreviations
iab #d #define
iab #i #include
iab #b /*******************************************************************
iab #e *******************************************************************/
iab #l % ---------------------------------------------------------------------------------------------------
iab #q % ===================================================================================================

" LaTeX Abbreviations and maps
map! ]ltx \documentclass[10pt]{article}<CR>\usepackage[letterpaper,centering,margin=1.0in]{geometry}<C-M>\usepackage[dvips]{graphicx}<C-M>\usepackage[centertags]{amsmath}<C-M>\usepackage{amssymb}<CR>\begin{document}<CR>\end{document}
map! ]e \begin{equation}<CR>\end{equation}<Esc>O
map! ]es \begin{equation}\begin{split}<CR>\end{split}\end{equation}<Esc>O
map! ]d \begin{displaymath}<CR>\end{displaymath}<Esc>O
map! ]a \begin{align}<CR>\end{align}<Esc>O
map! ]ea \begin{eqnarray}<CR>\end{eqnarray}<Esc>O
map! ]s1 \section{
map! ]s2 \subsection{
map! ]s3 \subsubsection{
map! ]f \begin{figure}[h]<CR>\centering<CR>\includegraphics[]{}<CR>\caption{\label{}}<CR>\end{figure}<ESC>

" Redraw the screen
map <C-s> :redraw<CR>

" Forward src search for xdvi
map _g  :execute "!xdvi -name xdvi -sourceposition " . line(".") . expand("%") . " " . expand("%:r") . ".dvi" <cr><cr> 

" Process with latex
map ,w :w<CR>:!latex -src %<CR>
map ,p :w<CR>:!pdflatex -src %<CR>


"For working on the vimrc file
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Convert a region to C-style comments
vmap gc c<Space>*<Space><ESC>

" Show tabs and trailing characters.
"set listchars=tab:»·,trail:·
"set list

" Q command to reformat paragraphs and list.
" This is the best shortcut ever! Thanks Gonz!
nnoremap Q gq}

" W command to delete trailing white space and Dos-returns and to expand tabs
" to spaces.
"nnoremap W :%s/[\r \t]\+$//<CR>:set et<CR>:retab!<CR>

" Move through, and open/close tabs
":nmap <A-t> :tabnew<CR>
":imap <A-t> <ESC>:tabnew<CR>
":nmap <A-w> :tabc<CR>
":imap <A-w> <ESC>:tabc<CR>
":nmap <D-l> :tabnext<CR>
":imap <D-l> <ESC>:tabnext<CR>
:nmap gl :tabnext<CR>
:nmap gh :tabprevious<CR>

"Used for navigating through camelCaseWords
imap <C-l> ?:call search('\<\<Bar>\u', 'W')<CR>
imap <C-h> ?:call search('\<\<Bar>\u', 'Wb')<CR>
map <C-l> :call search('\<\<Bar>\u', 'W')<CR>
map <C-h> :call search('\<\<Bar>\u', 'Wb')<CR>

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Select the code using any of v, V, ^V
" Copy into the X clipboard: "*y
" Switch to the other vim
" "*p
