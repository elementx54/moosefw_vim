" Indent file for MOOSE framwork input file
" Language: MOOSE Framework input file

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" Set values associated with indenting
setlocal indentexpr=moose_fw#tabs#GetMOOSEfwIndent(v:lnum)
setlocal indentkeys=!^F,o,O,]
