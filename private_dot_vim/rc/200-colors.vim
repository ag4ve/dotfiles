
highlight TabLineFill ctermfg=DarkGreen ctermbg=LightGreen
highlight TabLineSel ctermfg=Red ctermbg=LightYellow gui=bold
highlight TabLine ctermfg=Black ctermbg=Brown

if &diff
  colorscheme zen
  highlight CursorLine term=bold cterm=bold guibg=White ctermbg=NONE ctermfg=NONE
else
  "colorscheme symfony
  "colorscheme peaksea
  colorscheme inkpot

  " set current line text bold and current line number color
  highlight CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=NONE ctermfg=NONE
endif

