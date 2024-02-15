
" Print command output to the current buffer
function! FileMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  silent put=message
endfunction

" execute all of the contest of a buffer
function! EvalBuf()
  %y"
  @"
endfunction

" redirect command output directly to a file
function! RedirFile(...)
  if a:0 < 2
    echo "Only " a:0 " params given - need two"
    return
  endif

  let cmd = a:1
  let file = a:2
  redir => message
  silent execute cmd
  redir END
  let lines = split(message, '\n')
  call writefile(lines, file)
endfunction

command! -nargs=+ RedirFile call RedirFile(<f-args>)

