" GENERAL SETTINGS {{{
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ Bold\ 9
set background=dark
colorscheme wombat256

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

set encoding=utf-8
" Set to auto read when a file is changed from the outside
set autoread
set hidden
syntax on
filetype plugin on
" filetype plugin indent on
" filetype indent on
set number
set ruler
set showcmd
set fdm=marker
set fmr=\ {{{,\ }}}
set nostartofline
set wildmenu
" set so=7
set nolazyredraw "Don't redraw while executing macros "
set viminfo='100,f1 " save marks and other information for up to 100 files, save global marks also
" }}}
" Statusline {{{
set laststatus=2
set statusline=                                 " clear the statusline for when vimrc is reloaded
set statusline+=%=                              " right align
set statusline+=%h%m%r%w\ \                     " flags
set statusline+=%{strlen(&ft)?&ft:'none'}\ \    " filetype
set statusline+=%{&fileformat}\ \               " file format
set statusline+=%{strlen(&fenc)?&fenc:&enc}\ \  " encoding
set statusline+=%-5.(%l,%c%V%)\ %<%P            " offset 
" }}}
" Search {{{
set ignorecase
set smartcase
set incsearch
set nohlsearch
" }}}
" Indent {{{
set autoindent " always set autoindenting on
set tabstop=4 " numbers of spaces of tab character
set expandtab " tabs are converted to spaces, use only when required
set lbr
set shiftwidth=4 " numbers of spaces to (auto)indent
" set softtabstop=4 " this makes the backspace key treat the four spaces like a tab (so one backspace goes back a full 4 spaces)
" }}}
" Sessions {{{
let g:session_autosave = 'no'
let g:session_autoload = 'no'
nnoremap <F12> :OpenSession 
nnoremap <S-F12> :SaveSession<cr>
" }}}
" Various mappings {{{

set pastetoggle=<F5>
map <silent><F6> :NEXTCOLOR<cr>
map <silent><F7> :PREVCOLOR<cr>
nnoremap <F10> ggVG= 
inoremap <F10> <C-o>ggVG=

" select all
nmap <Esc>a ggVG

" Speeding up viewport scrolling.
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Fixes the following *feature*:
" If you do not type anything on the new line except <BS> or CTRL-D and then
" type <Esc> or <CR>, the indent is deleted again
inoremap <Enter> <Enter><space><bs>
nnoremap o o<space><bs>
nnoremap O O<space><bs>

" Get absolute file path with Ctrl-g
noremap <C-g> 1<C-g>
" }}}
" Window mappings {{{
nmap <Esc>w :w!<cr>
imap <Esc>w <Esc>:w!<cr>

nmap <Esc>q :q<cr>
imap <Esc>q <Esc>:q<cr>

nmap <Esc>Z :qall!<cr>
imap <Esc>Z <Esc>:qall!<cr>

nmap <Esc>z :q!<cr>
imap <Esc>z <Esc>:q!<cr>
" }}}
" Insert mode specialties {{{
imap <Esc>h <Left>
imap <Esc>l <Right>
" go to end of line in insert mode
imap <Esc>a <esc>$a
" }}}
" Add ; to the end of line {{{
nnoremap <Esc>; mXA;<C-c>`X
inoremap <Esc>; <C-o>mX<C-o>A;<C-o>`X
" }}}
" Buftabs {{{
let g:buftabs_only_basename=1
" let g:buftabs_active_highlight_group="Folded"
let g:buftabs_active_highlight_group="Visual"
let g:buftabs_marker_modified="*"
let g:buftabs_separator=""
let g:buftabs_in_statusline=1
" }}}
" Buffer mappings {{{
map <Esc>b :set buflisted<cr>
" map <Leader>b <C-^>
imap <Esc>j <Esc>:bprevious<cr>
imap <Esc>k <Esc>:bnext<cr>
nmap <Esc>j :bprevious<cr>
nmap <Esc>k :bnext<cr>
nmap <Esc>d :bdelete<cr>
nmap <Esc><S-d> :bdelete!<cr>
nmap <silent> <Esc>1 :brewind<cr> 
nmap <silent> <Esc>2 :brewind<cr>1:bnext<cr>
nmap <silent> <Esc>3 :brewind<cr>2:bnext<cr>
nmap <silent> <Esc>4 :brewind<cr>3:bnext<cr>
nmap <silent> <Esc>5 :brewind<cr>4:bnext<cr>
nmap <silent> <Esc>6 :brewind<cr>5:bnext<cr>
nmap <silent> <Esc>7 :brewind<cr>6:bnext<cr>
nmap <silent> <Esc>8 :brewind<cr>7:bnext<cr>
nmap <silent> <Esc>9 :brewind<cr>8:bnext<cr>
nmap <silent> <Esc>` :blast<cr>
" }}}
" Comments {{{

let g:tcommentMapLeader1 = '<Esc>/'

set formatoptions+=or 
    "o Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
    "r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
    
" }}}
" Fast editing of the .vimrc {{{
map <Esc>v :e! ~/.vimrc<cr>
" }}}
" Lusty Explorer {{{
nmap <Esc>l :LustyFilesystemExplorer<cr>
nmap <Esc>l :LustyFilesystemExplorerFromHere<cr>
let g:LustyExplorerAlwaysShowDotFiles = 1
" }}}
" CommandT Explorer {{{
noremap <Leader>l :CommandT<cr>
noremap <Leader>, :CommandTBuffer<cr>
noremap <Leader>f :CommandTFlush<cr>
" }}}
" Parse / Execute scripts {{{

" Parse
autocmd FileType php noremap <F8> :w!<cr>:!clear && php -l %<cr>

" Execute
autocmd FileType python nnoremap <F9> :w!<cr>:!clear && python %<cr>
autocmd FileType perl nnoremap <F9> :w!<cr>:!clear && perl %<cr>
autocmd FileType php nnoremap <F9> :w!<cr>:!clear && php %<cr>
autocmd FileType sh nnoremap <F9> :w!<cr>:!clear && bash %<cr>
autocmd FileType ruby nnoremap <F9> :w!<cr>:!clear && ruby %<cr>
" }}}
" Allow to easily change indentation styles {{{
function! Spaces2()
    set expandtab
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
endfunction

function! Spaces4()
    set expandtab
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
endfunction

noremap <F2> :<C-U>call Spaces2()<CR>
noremap <F4> :<C-U>call Spaces4()<CR>
" }}}
" Backup {{{
set backupdir=~/.backup                 " save all backups in one directory
set directory=~/.backup                 " put swaps files here too
set nobackup                            " don't make a name~ backup file after saving file
set updatecount=50                      " write swap files to disk after 50 keystrokes
set sessionoptions+=resize,blank        " remember empty files and window sizes between sessions
" }}}
" Zencoding {{{
let g:user_zen_leader_key = '<Esc>e'
" let g:user_zen_settings = { 'html' : { 'indentation' : '  ' }}
"let g:use_zen_complete_tag = 1
" }}}
" PUM (popup menu) {{{
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
set pumheight=10
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}
" phpDocumentor {{{
nmap <Esc>o :call PhpDoc()<cr>
imap <Esc>o <C-o>:call PhpDoc()<cr>
" }}}
" AutoClose {{{
nnoremap <F3> :AutoCloseOn<cr>
inoremap <F3> <C-o>:AutoCloseOn<cr>
" }}}
" MRU (Most Recently Used) {{{
nnoremap <Esc>m :MRU<cr>
inoremap <Esc>m <C-o>:MRU<cr>
" }}}
" YankRing {{{
nnoremap <Esc>r :YRShow<cr>
" }}}
" IndentConsistencyCop {{{
let g:indentconsistencycop_highlighting = 'sglmf:2' 
nnoremap <Esc>c :IndentConsistencyCop<cr>
inoremap <Esc>c <C-c>:IndentConsistencyCop<cr>
nnoremap <Esc>C :IndentConsistencyCopOff<cr>
inoremap <Esc>C <C-c>:IndentConsistencyCopOff<cr>
" }}}
" Ctags {{{
set tags=~/.vim/mytags/last_tags_file
map <Esc>} :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Esc>] :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" }}}
" Window copy/paste {{{
nmap <Esc>p "+gP
imap <Esc>p <esc><Esc>pi
vmap <Esc>y "+y 
" }}}
" Filetypes {{{
autocmd BufRead *.php set ft=php.html
autocmd BufNewFile *.php set ft=php.html
autocmd BufRead *.html set ft=html.javascript
autocmd BufNewFile *.html set ft=html.javascript
" }}}
" Strip trailing whitespace {{{
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
autocmd FileType php,javascript,css autocmd BufWritePre <buffer> call StripTrailingWhite()
" }}}


