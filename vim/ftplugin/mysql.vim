
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> yip:call MYSQL_Scratchy_raw(@0)<CR>
nmap <buffer> <F3> yip:call MYSQL_Scratchy_horizontal(@0)<CR>
nmap <buffer> <F4> yip:call MYSQL_Scratchy_vertical(@0)<CR>

" EXPLAIN
nmap <buffer> ,e   yip:call MYSQL_Scratchy_explain(@0)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MYSQL_Scratchy(flags, sql)
  if !exists("b:db_config")
    let b:db_config = {"host": $DB_HOST, "name": $DB_NAME, "user": $DB_USER}

    let b:db_config["host"] = input("host: ",     b:db_config["host"])
    let b:db_config["name"] = input("database: ", b:db_config["name"])
    let b:db_config["user"] = input("name: ",     b:db_config["user"])
  end

  let l:host = " -h " . b:db_config["host"]
  let l:user = " -u " . b:db_config["user"]
  let l:name = " " . b:db_config["name"]
  let l:flags = " --default-character-set=utf8 " . a:flags
  let l:command = "mysql" . l:flags . l:host . l:user . l:name
  let l:sql = a:sql

  SplitScratchy l:command, l:sql
endfunction

function! MYSQL_Scratchy_raw(sql)
  call MYSQL_Scratchy("", a:sql)
endfunction

function! MYSQL_Scratchy_horizontal(sql)
  call MYSQL_Scratchy("--table", a:sql)
endfunction

function! MYSQL_Scratchy_vertical(sql)
  call MYSQL_Scratchy("--vertical", a:sql)
endfunction

function! MYSQL_Scratchy_explain(sql)
  call MYSQL_Scratchy("--table", "explain\n" . a:sql)
endfunction
