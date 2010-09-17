" --------
" Settings
" --------

" Tabs and Spaces
set nocompatible
set hidden

set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set smarttab

set autoindent
set smartindent
set copyindent
"set cindent

" Misc
set title
set number
set ruler
set showcmd
set showmatch

set ignorecase 
set smartcase

set visualbell
set noerrorbells
set scrolloff=5
set t_vb=
set history=1000
set undolevels=100

" Commadline completition options
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class

" menu options
set completeopt=longest,menu
set ph=15

" save swaps to ~/.vim-tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" File-type
filetype on
filetype plugin on
filetype indent on
syntax enable

" Folding settings
set foldmethod=indent	"fold based on indent
set foldnestmax=10	"deepest fold is 10 levels
set nofoldenable	"dont fold by default
set foldlevel=1		"this is just what i use

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Matching parens
set mps=(:),{:},[:],<:>

" Go to next line
set whichwrap+=<,>


" --------
" Mappings
" --------

" Easy normal mode switch
inoremap jj <Esc>

" mapp keyword completition to S-tab
inoremap <M-Tab> <C-X><C-P>

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" shortcuts for moving windows to alt key
" ∆ is alt j, ext
nmap ∆ <C-W>j
nmap ˚ <C-W>k
nmap ˙ <C-W>h
nmap ¬ <C-W>l

" Move with h & l in input mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Go to next tab
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>

" Move lines of text around
nnoremap <C-j> mz:m+<CR>`z==
nnoremap <C-k> mz:m-2<CR>`z==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

"tame the completition menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" show TODO list
nnoremap <silent> <F2> :TaskList<CR>

"show outline explorer 
nnoremap <silent> <F3> :TlistToggle<CR>
			
"show project explorer
nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>


" --------------
" Misc Functions
" --------------

" toggle highlighted search with ;h 
function ToggleHLSearch()
       if &hls
	    set nohls
       else
	    set hls
       endif
endfunction
nmap <silent> ;h <Esc>:call ToggleHLSearch()<CR>

" keymap for setting paste mode
" set pastetoggle=<C-x>

function! DropDownMenu()
	if exists('&omnifunc') && &omnifunc != ''
		return ".\<C-X>\<C-O>"
	else
		return "."
	endif
endfunction

" map . to trigger omnifunc if it's defined
" imap <silent> <buffer> . <c-r>=DropDownMenu()<CR>

" Pylint
command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
endfunction

command Pyflakes :call Pyflakes()
fun! Pyflakes()
	set makeprg=pyflakes
	make "%"
	cw
endfunction

"sets soft wrap
command! -nargs=* Wrap set wrap linebreak nolist

"unravel one line xml files
autocmd FileType xml nmap <F7> <Esc>:1,$!xmllint --format -<CR>
autocmd FileType rst nmap <F7> <Esc>:make html<CR>


" --------
" UI Theme 
" --------

if &t_Co >= 256 || has("gui_running")
   colorscheme courier
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

set gfn=Menlo


" --------------
" Filetype Settings
" --------------

" Only do this part when compiled with support for autocommands
if has("autocmd")
	"remove all autocommands before set them again
	"autocmd!

	" Surround conf
	autocmd FileType php,ctp let b:surround_{char2nr("-")} = "<?php \r ?>"
	autocmd FileType mako let b:surround_{char2nr("-")} = "${\r}"
	autocmd FileType mako let b:surround_{char2nr("%")} = "<% \r %>"
	autocmd FileType php,html,ctp,mako let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"
	autocmd FileType php,html,ctp,mako let g:surround_{char2nr("a")} = "<a\1href: \r..*\r href=\"&\"\1>\r</a>"

	" activate auto close tag plugin on the next file types
	autocmd Filetype html,xml,xsl,ctp,mako source ~/.vim/scripts/closetag.vim

	" php syntax check
	autocmd FileType php map <C-P> :!php -l %<Cr>

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab

	" Customisations based on house-style (arbitrary)
	" autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	" autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	" autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

endif

function UseFileTypeCompletition()
	if b:current_syntax == "python"
		return "\<c-x>\<c-k>"
	endif

	if b:current_syntax == "html"
		return "\<c-x>\<c-o>"
	endif
endfunction


" --------------
" Plugin Settings
" ---------------
call pathogen#runtime_append_all_bundles()

runtime macros/matchit.vim

" NERDTreee
"let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Don't display these kinds of files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '^\.DS_Store$', '^\.gitignore$', '^\.hgignore$']

let NERDTreeShowBookmarks=1        " Show the bookmarks table on startup
let NERDTreeShowFiles=1            " Show hidden files, too
let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1  " Highlight the selected entry in the tree
let NERDTreeMouseMode=2            " Use a single click to fold/unfold directories
                                   " and a double click to open files

" supertab settings
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-p>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 'UseFileTypeCompletition', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"] 

" MiniBufExpl
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
let g:miniBufExplMapCTabSwitchBufs = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
" highlight MBENormal  ctermfg=LightBlue	guibg=LightGray guifg=DarkGray

" buffers that have NOT CHANGED and are VISIBLE
" highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black ctermbg=Blue  ctermfg=Green

" for buffers that HAVE CHANGED and are NOT VISIBLE
" highlight MBEChanged ctermfg=DarkRed guibg=Red guifg=DarkRed

" buffers that HAVE CHANGED and are VISIBLE
" highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black ctermbg=Blue ctermfg=Red
