let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_go_nvim')
  finish
endif
let g:loaded_go_nvim = 1

" -----------------------------------------------------------------------------
" register remote plugin

let s:plugin_name   = 'nvim-go'
let s:plugin_root   = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

command! -nargs=0 -bar GoAuToComment  call go#comment#generate_go_comment()

let &cpo = s:save_cpo
unlet s:save_cpo
