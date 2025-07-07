" Vim section movement file for MOOSE framework input files.
" Language: MOOSE Framework input file

" Similar to indent code but for placing closing block items
" Check if wanted or not
if exists("g:moo_fw_no_insert_pairs") || exists("b:did_insert_pairs")
    finish
endif
let b:did_insert_pairs = 1

" So it begins
inoremap <script> <buffer> <silent> ] <C-O>:call moose_fw#insert_pairs#CloseGetPot()<CR>
