" Vim constant variables for MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z

" The goal is to load variables once and never change them. Then if future
" development changes occur, this will be the only place the variable
" definition needs to be change instead of in every file location as has been
" done previously.

" Top Block Definitions
let g:moose_fw_variables_topstart = '\v^\[(\w|\-)*\w\]'
let g:moose_fw_variables_topend = '\v^\[\]'

" Sub-block Definitions
let g:moose_fw_variables_substart = '\v\[\.\/(\w|\-|\*|\<|\>)*\]'
let g:moose_fw_variables_subend = '\v\[\.\.\/\]'

" Comments
let g:moose_fw_variables_comment = '\v\#.*$'
