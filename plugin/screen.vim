" Author: Eric Van Dewoestine <ervandew@gmail.com>
" Version: 1.2
" GetLatestVimScripts: 2711 1 :AutoInstall: screen.vim
"
" Description: {{{
"   This plugin aims to simulate an embedded shell in vim by allowing you to
"   easily convert your current vim session into one running in gnu screen
"   with a split gnu screen window containing a shell, and to quickly send
"   statements/code to whatever program is running in that shell (bash,
"   python, irb, etc.).  Spawning the shell in your favorite terminal emulator
"   is also supported for gvim users or anyone else that just prefers an
"   external shell.
"
" }}}
"
" License: {{{
"   Copyright (c) 2009 - 2010
"   All rights reserved.
"
"   Redistribution and use of this software in source and binary forms, with
"   or without modification, are permitted provided that the following
"   conditions are met:
"
"   * Redistributions of source code must retain the above
"     copyright notice, this list of conditions and the
"     following disclaimer.
"
"   * Redistributions in binary form must reproduce the above
"     copyright notice, this list of conditions and the
"     following disclaimer in the documentation and/or other
"     materials provided with the distribution.
"
"   * Neither the name of Eric Van Dewoestine nor the names of its
"     contributors may be used to endorse or promote products derived from
"     this software without specific prior written permission of
"     Eric Van Dewoestine.
"
"   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
"   IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
"   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
"   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
"   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
"   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
"   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
"   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
"   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
"   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
"   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
" }}}

let s:save_cpo=&cpo
set cpo&vim

" Global Variables {{{

  if !exists('g:ScreenImpl')
    let g:ScreenImpl = 'GnuScreen'
    "let g:ScreenImpl = 'Tmux'
  endif

  if !exists('g:ScreenShellTmuxInitArgs')
    let g:ScreenShellTmuxInitArgs = ''
  endif

  " Sets the height of the gnu screen (or tmux) region used for the shell.
  if !exists('g:ScreenShellHeight')
    let g:ScreenShellHeight = 15
  endif

  " Sets the width of the screen window used for the shell.
  if !exists('g:ScreenShellWidth')
    let g:ScreenShellWidth = -1
  endif

  " Specifies whether or not to quit gnu screen when vim is closed and the
  " screen session was started via :ScreenShell.
  if !exists('g:ScreenShellQuitOnVimExit')
    let g:ScreenShellQuitOnVimExit = 1
  endif

  " When not 0, open the spawned shell in an external window (not currently
  " supported when running in cygwin).
  if !exists('g:ScreenShellExternal')
    let g:ScreenShellExternal = 0
  endif

  " Sets whether to focus 'vim' or the 'shell' when a shell region is opened.
  if !exists('g:ScreenShellInitialFocus')
    let g:ScreenShellInitialFocus = 'vim'
  endif

  " Specifies a name to be supplied to vim's --servername arg when invoked in
  " a new screen session.
  if !exists('g:ScreenShellServerName')
    let g:ScreenShellServerName = g:ScreenShellExternal ? '' : 'vim'
  endif

  " When g:ScreenShellExternal is set, this variable specifies the prefered
  " shell to use.  If not set, some common terminals will be tried.
  if !exists('g:ScreenShellTerminal')
    let g:ScreenShellTerminal = ''
  endif

  " Sets whether, and using which method, gnu screen supports vertical splits
  if !exists('g:ScreenShellGnuScreenVerticalSupport')
    let g:ScreenShellGnuScreenVerticalSupport = ''
  endif

" }}}

" Commands {{{

  if !exists(':ScreenShell')
    " unfortunately, to reap the benefits of an autoload scripts, we can't
    " call this, but instead have to copy the commands inline.
    "call screen#ScreenShellCommands()

    command -nargs=? -complete=shellcmd ScreenShell
      \ :call screen#ScreenShell('<args>', 'horizontal')
    command -nargs=? -complete=customlist,screen#CommandCompleteScreenSessions
      \ ScreenShellAttach :call screen#ScreenShellAttach('<args>')

    if !has('gui_running') &&
     \ !g:ScreenShellExternal &&
     \ (g:ScreenImpl == 'Tmux' || g:ScreenShellGnuScreenVerticalSupport != '')
      command -nargs=? -complete=shellcmd ScreenShellVertical
        \ :call screen#ScreenShell('<args>', 'vertical')
    endif
  endif

" }}}

" Autocmds {{{

  " while nice for vim screen window titles, this can kind of screw things up
  " since when exiting vim there could now be more than one screen window with
  " the title 'shell'.
  "if expand('$TERM') =~ '^screen'
  "  augroup vim_screen
  "    autocmd!
  "    autocmd VimEnter,BufWinEnter,WinEnter *
  "      \ exec "silent! !echo -ne '\\ek" . expand('%:t') . "\\e\\\\'"
  "    autocmd VimLeave * exec "silent! !echo -ne '\\ekshell\\e\\\\'"
  "  augroup END
  "endif

" }}}

let &cpo = s:save_cpo

" vim:ft=vim:fdm=marker
