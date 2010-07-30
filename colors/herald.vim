" Vim color file
" Name:       courier.vim
" Author:     Juan Barrientos <self@mechanicalchopsticks.com>
" Version:    0.0.1
" Notes:      Supports 256 and 16,777,216 (RGB) color modes

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "courier"

set background=dark

" Set some syntax-related variables

if has("gui_running")

	" -> Text; Miscellaneous
	hi Normal         guibg=bg      guifg=#D0D0D0 gui=none
	hi SpecialKey     guibg=bg      guifg=#E783E9 gui=none
	hi VertSplit      guibg=bg      guifg=#FFEE68 gui=none
	hi SignColumn     guibg=bg      guifg=#BF81FA gui=none
	hi NonText        guibg=bg      guifg=#FC6984 gui=none
	hi Directory      guibg=bg      guifg=#5De574 gui=none 
	hi Title          guibg=bg      guifg=#6DF584 gui=bold

	" -> Cursor 
	hi Cursor         guibg=#FFEE68 guifg=bg      gui=none
	hi CursorIM       guibg=#FFEE68 guifg=bg      gui=none
	hi CursorColumn   guibg=#000000               gui=none
	hi CursorLine     guibg=#000000               gui=none

	" -> Folding
	hi FoldColumn     guibg=#001336 guifg=#003DAD gui=none
	hi Folded         guibg=#001336 guifg=#003DAD gui=none

	" -> Line info  
	hi LineNr         guibg=#000000 guifg=#696567 gui=none
	hi StatusLine     guibg=#000000 guifg=#696567 gui=none
	hi StatusLineNC   guibg=#25365a guifg=#696567 gui=none

	" -> Messages
	hi ErrorMsg       guibg=#A32024 guifg=#D0D0D0 gui=none
	hi Question       guibg=bg      guifg=#FFA500 gui=none
	hi WarningMsg     guibg=#FFA500 guifg=#000000 gui=none
	hi MoreMsg        guibg=bg      guifg=#FFA500 gui=none
	hi ModeMsg        guibg=bg      guifg=#FFA500 gui=none

	" -> Search 
	hi Search         guibg=#FF9E16               gui=none 
	hi IncSearch      guibg=#FF9E16               gui=none

	" -> Diff
	hi DiffAdd        guibg=#006124 guifg=#ED9000 gui=none
	hi DiffChange     guibg=#0B294A guifg=#A36000 gui=none
	hi DiffDelete     guibg=#081F38 guifg=#ED9000 gui=none
	hi DiffText       guibg=#12457D guifg=#ED9000 gui=underline

	" -> Menu
	hi Pmenu          guibg=#140100 guifg=#660300 gui=none
	hi PmenuSel       guibg=#F17A00 guifg=#4C0200 gui=none
	hi PmenuSbar      guibg=#430300               gui=none
	hi PmenuThumb     guibg=#720300               gui=none
	hi PmenuSel       guibg=#F17A00 guifg=#4C0200 gui=none

	" -> Tabs
	hi TabLine        guibg=#141414 guifg=bg      gui=none
	hi TabLineFill    guibg=#000000               gui=none
	hi TabLineSel     guibg=bg      guifg=#D0D0D0 gui=bold  
	"
	" -> Visual Mode
	hi Visual         guibg=#000000 guifg=#FFB539 gui=none
	hi VisualNOS      guibg=#000000 guifg=#696567 gui=none

	" -> Code
	hi Comment        guibg=bg      guifg=#696567 gui=none
	hi Constant       guibg=bg      guifg=#6DF584 gui=none
	hi String         guibg=bg      guifg=#FFB539 gui=none
	hi Error          guibg=bg      guifg=#FC4234 gui=none
	hi Identifier     guibg=bg      guifg=#70BDF1 gui=none
	hi Function       guibg=bg      guifg=#90CBF1 gui=none
	hi Ignore         guibg=bg      guifg=bg      gui=none
	hi MatchParen     guibg=#FFA500 guifg=bg      gui=none
	hi PreProc        guibg=bg      guifg=#BF81FA gui=none
	hi Special        guibg=bg      guifg=#FFB539 gui=none
	hi Todo           guibg=bg      guifg=#FC4234 gui=bold
	hi Underlined     guibg=bg      guifg=#FC4234 gui=underline
	hi Statement      guibg=bg      guifg=#E783E9 gui=none
	hi Operator       guibg=bg      guifg=#FC6984 gui=none
	hi Delimiter      guibg=bg      guifg=#FFEC48 gui=none
	hi Type           guibg=bg      guifg=#FFEE68 gui=none
	hi Exception      guibg=bg      guifg=#FC4234 gui=none

	" -> HTML-specific
	hi htmlBold                 guibg=bg      guifg=#D0D0D0 gui=bold
	hi htmlBoldItalic           guibg=bg      guifg=#D0D0D0 gui=bold,italic
	hi htmlBoldUnderline        guibg=bg      guifg=#D0D0D0 gui=bold,underline
	hi htmlBoldUnderlineItalic  guibg=bg      guifg=#D0D0D0 gui=bold,underline,italic
	hi htmlItalic               guibg=bg      guifg=#D0D0D0 gui=italic
	hi htmlUnderline            guibg=bg      guifg=#D0D0D0 gui=underline
	hi htmlUnderlineItalic      guibg=bg      guifg=#D0D0D0 gui=underline,italic

elseif &t_Co == 256

	" -> Text; Miscellaneous
	hi Normal         ctermbg=234  ctermfg=252   cterm=none
	hi SpecialKey     ctermbg=234  ctermfg=176   cterm=none
	hi VertSplit      ctermbg=234  ctermfg=227   cterm=none
	hi SignColumn     ctermbg=234  ctermfg=141   cterm=none
	hi NonText        ctermbg=234  ctermfg=204   cterm=none
	hi Directory      ctermbg=234  ctermfg=227   cterm=none 
	hi Title          ctermbg=234  ctermfg=84    cterm=bold

	" -> Cursor 
	hi Cursor         ctermbg=227  ctermfg=234   cterm=none
	hi CursorIM       ctermbg=227  ctermfg=234   cterm=none
	hi CursorColumn   ctermbg=0                  cterm=none
	hi CursorLine     ctermbg=0                  cterm=none

	" -> Folding
	hi FoldColumn     ctermbg=234  ctermfg=25    cterm=none
	hi Folded         ctermbg=234  ctermfg=25    cterm=none

	" -> Line info  
	hi LineNr         ctermbg=0    ctermfg=241   cterm=none
	hi StatusLine     ctermbg=0    ctermfg=241   cterm=none
	hi StatusLineNC   ctermbg=237  ctermfg=241   cterm=none

	" -> Messages
	hi ErrorMsg       ctermbg=124  ctermfg=252   cterm=none
	hi Question       ctermbg=234  ctermfg=214   cterm=none
	hi WarningMsg     ctermbg=214  ctermfg=0     cterm=none
	hi MoreMsg        ctermbg=234  ctermfg=214   cterm=none
	hi ModeMsg        ctermbg=234  ctermfg=214   cterm=none

	" -> Search 
	hi Search         ctermbg=214                cterm=none 
	hi IncSearch      ctermbg=214                cterm=none

	" -> Diff
	hi DiffAdd        ctermbg=22   ctermfg=208   cterm=none
	hi DiffChange     ctermbg=235  ctermfg=130   cterm=none
	hi DiffDelete     ctermbg=234  ctermfg=208   cterm=none
	hi DiffText       ctermbg=24   ctermfg=208   cterm=underline

	" -> Menu
	hi Pmenu          ctermbg=0    ctermfg=52    cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none
	hi PmenuSbar      ctermbg=52                 cterm=none
	hi PmenuThumb     ctermbg=52                 cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none

	" -> Tabs
	hi TabLine        ctermbg=233  ctermfg=234   cterm=none
	hi TabLineFill    ctermbg=0                  cterm=none
	hi TabLineSel     ctermbg=234  ctermfg=252   cterm=bold 
	"
	" -> Visual Mode
	hi Visual         ctermbg=0    ctermfg=215   cterm=none 
	hi VisualNOS      ctermbg=0    ctermfg=241   cterm=none

	" -> Code
	hi Comment        ctermbg=234  ctermfg=241   cterm=none
	hi Constant       ctermbg=234  ctermfg=84    cterm=none
	hi String         ctermbg=234  ctermfg=215   cterm=none
	hi Error          ctermbg=234  ctermfg=203   cterm=none
	hi Identifier     ctermbg=234  ctermfg=75    cterm=none
	hi Function       ctermbg=234  ctermfg=117   cterm=none
	hi Ignore         ctermbg=234  ctermfg=234   cterm=none
	hi MatchParen     ctermbg=214  ctermfg=234   cterm=none
	hi PreProc        ctermbg=234  ctermfg=141   cterm=none
	hi Special        ctermbg=234  ctermfg=215   cterm=none
	hi Todo           ctermbg=234  ctermfg=203   cterm=bold
	hi Underlined     ctermbg=234  ctermfg=203   cterm=underline
	hi Statement      ctermbg=234  ctermfg=176   cterm=none
	hi Operator       ctermbg=234  ctermfg=204   cterm=none
	hi Delimiter      ctermbg=234  ctermfg=227   cterm=none
	hi Type           ctermbg=234  ctermfg=227   cterm=none
	hi Exception      ctermbg=234  ctermfg=203   cterm=none 

	" -> HTML-specific
	hi htmlBold                 ctermbg=234  ctermfg=252   cterm=bold
	hi htmlBoldItalic           ctermbg=234  ctermfg=252   cterm=bold,italic
	hi htmlBoldUnderline        ctermbg=234  ctermfg=252   cterm=bold,underline
	hi htmlBoldUnderlineItalic  ctermbg=234  ctermfg=252   cterm=bold,underline,italic
	hi htmlItalic               ctermbg=234  ctermfg=252   cterm=italic
	hi htmlUnderline            ctermbg=234  ctermfg=252   cterm=underline
endif

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline

" Spellcheck formatting
if has("spell")
	hi SpellBad   guisp=#FC4234 gui=undercurl
	hi SpellCap   guisp=#70BDF1 gui=undercurl
	hi SpellLocal guisp=#FFEE68 gui=undercurl
	hi SpellRare  guisp=#6DF584 gui=undercurl
endif
