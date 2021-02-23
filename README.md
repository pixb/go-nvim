# go-nvim

- syntax highlight
- textobject need
  [vim-textobj-function](https://github.com/kana/vim-textobj-funcfunction)

## Syntax highlight settings on default

```viml
let g:go_highlight_fold_enable_comment        = 0
let g:go_highlight_generate_tags              = 0
let g:go_highlight_string_spellcheck          = 1
let g:go_highlight_format_strings             = 1
let g:go_highlight_fold_enable_package_comment= 0
let g:go_highlight_fold_enable_block          = 0
let g:go_highlight_import                     = 0
let g:go_highlight_fold_enable_varconst       = 0
let g:go_highlight_array_whitespace_error     = 1
let g:go_highlight_trailing_whitespace_error  = 1
let g:go_highlight_chan_whitespace_error      = 1
let g:go_highlight_extra_types                = 1
let g:go_highlight_space_tab_error            = 1
let g:go_highlight_operators                  = 1
let g:go_highlight_functions                  = 1
let g:go_highlight_function_parameters        = 1
let g:go_highlight_function_calls             = 1
let g:go_highlight_fields                     = 1
let g:go_highlight_types                      = 1
let g:go_highlight_variable_assignments       = 0
let g:go_highlight_variable_declarations      = 0
let g:go_highlight_build_constraints          = 0
```

## TODO

- Add tags
