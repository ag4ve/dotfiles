
" speak selected text
function SpeakText() range
  let l:data = '$HOME/.config/piper'
  let l:cmd = ""
  let l:cmd .= '| piper '
    \ . '--download-dir ' . l:data
    \ . ' --data-dir ' . l:data
    \ . ' --model en_GB-alba-medium --output_raw'
  let l:cmd .= '| aplay -f S16_LE -c1 -r24000'
  let s:job = jobstart('echo '.shellescape(join(getline(a:firstline, a:lastline), " ")).l:cmd)
endfunction
xnoremap s :'<,'>call SpeakText()<CR>

