
function! SnipReplace()
  " extract last word, put in register x
  execute "normal! vb\"xy"

  "echom "copied:" @x

  " convert w/ snip command-line
  silent let @x = system("FT=" . shellescape(&ft) . " snip", @x)
  let @x = substitute(@x, "\\n$", "", "") " strip trailing CR

  " overwrite-paste
  execute "normal! gv\"xp"

  " if snippet contains a pipe (|), position cursor
  if match(@x, "|") != -1
    call search("|", "b")
    let @x = "xi"
    return
  endif

  " back to insert mode
  let @x = "a"
endfunction

"-- mappings
inoremap <TAB> <ESC>:call SnipReplace()<CR>@x
vnoremap <TAB> !vsnip<CR>
