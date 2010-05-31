" --------
" Settings
" --------

" Tabs and Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set smarttab
set cindent

" Misc
set title
set number
set ruler
set showcmd
set showmatch
set visualbell
set nowrap
set hidden
set nocompatible
set history=1000
set ignorecase 
set smartcase
set scrolloff=5

"drop-down menu options
set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone

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


" --------
" Mappings
" --------

" Easy normal mode switch
inoremap jj <Esc>

" mapp keyword completition to S-tab
inoremap <M-Tab> <C-X><C-P>

" shortcuts for moving windows to alt key
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

" show TODO list
nnoremap <silent> <F2> :TaskList<CR>

"show outline explorer 
nnoremap <silent> <F3> :TlistToggle<CR>
			
"show project explorer
nnoremap <silent> <C-N> :NERDTreeToggle<CR>


" --------------
" Misc Functions
" --------------

"toggle highlighted search with C-S
function ToggleHLSearch()
       if &hls
	    set nohls
       else
	    set hls
       endif
endfunction
nmap <silent> <C-s> <Esc>:call ToggleHLSearch()<CR>

"keymap for setting paste mode
"set pastetoggle=<C-x>

function! DropDownMenu()
	if exists('&omnifunc') && &omnifunc != ''
		return ".\<C-X>\<C-O>"
	else
		return "."
	endif
endfunction
"map . to trigger omnifunc if it's defined
imap <silent> <buffer> . <c-r>=DropDownMenu()<CR>

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
let moria_style = 'dark'
colorscheme mc_moria
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
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

	" Load file state like foldings
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter *.* silent loadview

	" Autocompleate settings based on the filetype
endif

" little hack 
" this is set to 1 if we are editing a python file in a FileType autocommand in filetypes.vim
function UsePythonDictCompletition()
	if b:current_syntax == "python"
		return "\<c-x>\<c-k>"
	endif
endfunction


" --------------
" Plugin Settings
" ---------------

runtime macros/matchit.vim

" NERDTreee
let NERDTreeIgnore=['\.pyc$', '\~$']

" supertab settings
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-p>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 'UsePythonDictCompletition', 's:ContextDiscover']
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

" Tmux Settings
let g:ScreenImpl = 'Tmux'

