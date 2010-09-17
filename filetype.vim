" my filetype file
if exists("did_load_filetypes")
	finish
endif
augroup filetypeedetect
	au! BufRead,BufNewFile *.mako setfiletype mako 
	au! BufRead,BufNewFile *.ctp setfiletype ctp
	au! BufRead,BufNewFile *.less setfiletype less
	au! BufRead,BufNewFile *.jinja setfiletype htmljinja
	
	" Treat .rss files as XML
	au! BufNewFile,BufRead *.rss setfiletype xml
augroup END

augroup pythonsettings
	au!
	au FileType python let &dictionary = '/Users/juan/.vim/vimfiles/ftplugin/pydiction/complete-dict'
	au FileType python let python_highlight_all = 1
	au FileType python let python_slow_sync = 1
	au FileType python let python_print_as_function = 1
	
augroup END

"au FileType php let PHP_removeCRwhenUnix = 1

au FileType python		set omnifunc=pythoncomplete#Complete
au FileType javascript	set omnifunc=javascriptcomplete#CompleteJS
au FileType css			set omnifunc=csscomplete#CompleteCSS
au FileType less		set omnifunc=csscomplete#CompleteCSS
au FileType xml			set omnifunc=xmlcomplete#CompleteTags
au FileType php			set omnifunc=phpcomplete#CompletePHP
au FileType html		set omnifunc=htmlcomplete#CompleteTags

