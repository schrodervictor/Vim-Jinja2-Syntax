" Figure out which type of hilighting to use for html
" This function will iterate over the first 50 lines to
" try to find something that looks like Jinja2 Syntax
fun! s:SelectHTML()
let n = 1
while n < 50 && n <= line("$")
  " check if this line looks like Jinja2
  if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
    " Case positive, set the filetype
    set filetype=jinja
    return
  endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.html,*.htm,*.nunjucks,*.nunjs  call s:SelectHTML()
