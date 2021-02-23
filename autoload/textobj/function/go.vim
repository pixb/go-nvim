function! textobj#function#go#select(object_type) abort
    return s:select_{a:object_type}()
endfunction

function! s:select_a() abort
    " find ``func (xxx YYY) zzz(...) aaa {''
    while getline('.') !~# 'func\s\+\%(([^)]\+)\s\+\)\?\w\+([^)]*)\s*\%(\%(\w\|\*\)\+\|([^)]\+)\)\?\s*{'
        let before= getpos('.')
        keepjumps normal! [{
        if getpos('.') ==# before
            return 0
        endif
    endwhile
    keepjumps normal! 0
    let begin= getpos('.')

    keepjumps normal! f{%
    let end= getpos('.')

    if 0 <= end[1] - begin[1]  " is there some code?
        return ['v', begin, end]
    else
        return 0
    endif
endfunction

function! s:select_i() abort
    let range = s:select_a()
    if range is 0
        return 0
    endif

    let [_, ab, ae] = range

    call setpos('.', ab)
    keepjumps normal! f{j0
    let ib = getpos('.')

    call setpos('.', ae)
    normal! k$
    let ie = getpos('.')

    if 0 <= ie[1] - ib[1]  " is there some code?
        return ['v', ib, ie]
    else
        return 0
    endif
endfunction
