" Vim syntax file
" Language:	LESS Cascading Style Sheets
" Maintainer:	Leaf Corcoran <leafot@gmail.com>
" Modifier:	Bryan J Swift <bryan@bryanjswift.com>
" URL: 		http://leafo.net/lessphp/vim/less.vim
" URL:		http://gist.github.com/161047
" Last Change:	2009 August 4
" LESS by Leaf Corcoran
" CSS2 by Nikolai Weibull
" Full CSS2, HTML4 support by Yeti

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'less'
endif

if version < 600
  so <sfile>:p:h/css.vim
else
  runtime! syntax/css.vim
  unlet b:current_syntax
endif

syn case ignore

syn match lessComment "//.*$" contains=@Spell
syn match lessVariable "@[A-Za-z_-][A-Za-z0-9_-]*" contained
syn region lessVariableDefinition start="^@" end=";" contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssDefinition,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction

" captures both the definition and the call
syn region lessFunction matchgroup=lessFuncDef start="@[A-Za-z_-][A-Za-z0-9_-]*(" end=")" contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssDefinition,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssDefinition,cssClassName,cssTagName,cssIdentifier,lessComment,lessVariable,lessFunction
syn match cssBraceError '}'

if main_syntax == 'css'
  syn sync minlines=10
endif

" Define the default highlighting.

hi link lessComment Comment
hi link lessVariable Identifier 
hi link lessFuncDef Function
hi link cssColorProp Constant
hi link cssBraceError cssBraces

let b:current_syntax = 'less'

if main_syntax == 'less'
  unlet main_syntax
endif


" vim: ts=8

