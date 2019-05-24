let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:go_metalinter_command ='golangci-lint run --print-issued-lines=false'
let g:go_list_type = 'quickfix'

set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

nnoremap <buffer> <Leader>gt :GoTest<CR>
nnoremap <buffer> <Leader>gr :GoRename<CR>
