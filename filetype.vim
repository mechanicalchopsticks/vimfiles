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
