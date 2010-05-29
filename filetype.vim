" my filetype file
if exists("did_load_filetypes")
	finish
endif
augroup filetypeedetect
	au! BufRead,BufNewFile *.mako setfiletype mako 
	au! BufRead,BufNewFile *.ctp setfiletype ctp
	au! BufRead,BufNewFile *.less setfiletype less
	
	" Treat .rss files as XML
	au! BufNewFile,BufRead *.rss setfiletype xml
augroup END

augroup pythonsettings
	au!
	au FileType python let &dictionary = '/Users/juan/.vim/vimfiles/ftplugin/pydiction/complete-dict'
	au FileType python let python_higlight_all = 1
	au FileType python let python_slow_sync = 1
	au FileType python let python_print_as_function = 0

	au FileType python let g:PythonFile = 1
augroup END


augroup completesettings
	au!
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
augroup END	
