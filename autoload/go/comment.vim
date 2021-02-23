
" Auto generate go function method comment
function! go#comment#generate_go_comment()
   let l:funclist = []
   let l:methlist = []

   let l:pattern_func = 'func\s[A-Z]\([A-z]\)\+()\s{$'
   silent! exec 'g/'.l:pattern_func.'/call add(l:funclist, line("."))'
   if !empty(l:funclist)
     call s:generate_comment(l:funclist)
   endif

   let l:pattern_meth = 'func\s(\([A-z]\)\+\s\(\*\?[A-z]\+\))\s[A-Z][A-z]\+()\s\*\?\([A-z]\+\)\?\s\?{$'
   silent! exec 'g/'.l:pattern_meth.'/call add(l:methlist, line("."))'
   if !empty(l:methlist)
     call s:generate_comment(l:methlist)
   endif
endfunction

function! s:generate_comment(funclist)
  let l:func_name = {}
  for line in a:funclist
    let l:name = matchstr(getline(line), '\s[A-Z]\([A-z]\+\)\+(')
    let l:func_name[line] = split(l:name,'(')[0]
  endfor
  for line in a:funclist
    if line == a:funclist[0]
      call cursor(line, 0)
      call append(line-1, '//'.l:func_name[line])
    else
      call cursor(line+1, 0)
      call append(line, '//'.l:func_name[line])
    endif
  endfor
endfunction

