" Indent file for MOOSE framwork input file
" Language: MOOSE Framework input file
" Creator: Xenon54z

" Much of this code was borrowed from pascal.vim

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" Set values associated with indenting
setlocal indentexpr=GetMOOSEfwIndent(v:lnum)
setlocal indentkeys=!^F,o,O,]

if exists("*GetMOOSEfwIndent")
    finish
endif

"" Functions for indenting correctly
" Check previous line's indentation
function! s:GetPrevNonCommentLineNum( line_num )
    " Skip lines starting with a comment (Had to add start with to definition)
    execute 'let SKIP_LINES = "\v^' . g:moose_fw_variables_comment[2:] . '"'
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile
    return nline
endfunction

" Main function for indenting
function! GetMOOSEfwIndent( line_num )
    " Probably should not start indented
    if a:line_num == 0
        return 0
    endif
    " Let others get our value for any line
    let this_codeline = getline( a:line_num )

    " Get indentation of previous line
    let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
    let prev_codeline = getline( prev_codeline_num )
    let indnt = indent( prev_codeline_num )
    
    " Begin the definitions of keywords for indent changing
    " Top Opener (such as [Kernels] )
    if prev_codeline =~? g:moose_fw_variables_topstart
        return indnt + &shiftwidth
    endif

    " Sub Opener (such as [./sub] )
    if prev_codeline =~? g:moose_fw_variables_substart
        return indnt + &shiftwidth
    endif
    
    " Top Closer [] (When not at beginning)
    if this_codeline =~? g:moose_fw_variables_topend[3:]
        return indnt - &shiftwidth
    endif

    " Sub Closer [../]
    if this_codeline =~? g:moose_fw_variables_subend
        return indnt - &shiftwidth
    endif
    
    " Default case if nothing was special was found
    return indnt
endfunction
