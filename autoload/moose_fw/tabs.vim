" Autoload functions for indent/moose_fw.vim.
" Language: MOOSE Framework input file
" Creator: Xenon54z

" Much of this code was borrowed from pascal.vim

"" Functions for indenting correctly
" Check previous line's indentation
function! s:GetPrevNonCommentLineNum( line_num )
    " Skip lines with only a comment
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? g:moose_fw_variables_onlycomment
            break
        endif
    endwhile
    return nline
endfunction

" Main function for indenting
function! moose_fw#tabs#GetMOOSEfwIndent( line_num )
    " Probably should not start indented
    if a:line_num == 0
        return 0
    endif
    " Let others get our value for any line
    let this_codeline = getline( a:line_num )
    if this_codeline =~? g:moose_fw_variables_onlycomment
        return indent( a:line_num )
    endif

    " Get indentation of previous line
    let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
    let prev_codeline = getline( prev_codeline_num )
    let indnt = indent( prev_codeline_num )

    " Begin the definitions of keywords for indent changing
    "   Order does matter; put prev_codeline before this_codeline
    " Top Opener (such as [Kernels] )
    if prev_codeline =~? g:moose_fw_variables_topstart ||
                \ prev_codeline =~? g:moose_fw_variables_newtop
        let indnt += &shiftwidth
    endif

    " Sub Opener (such as [./sub] )
    if prev_codeline =~? g:moose_fw_variables_substart
        let indnt += &shiftwidth
    endif

    " Single or double quote without matching pair ( ' " )
    if prev_codeline =~? '\v(\=\s*'')|(\=\s*")' &&
                \ prev_codeline !~? '\v(''.*'')|(".*")'
        let indnt = match( prev_codeline, '\v('')|(")' ) + 1
    endif

    " Single or double quote closer without matching open
    if prev_codeline =~? '\v('')|(")' &&
                \ prev_codeline !~? '\v(''.*'')|(".*")' &&
                \ prev_codeline !~? '\v(\=\s*'')|(\=\s*")'
        " Need to find previous indent of '=' line
        let qline = a:line_num
        while qline > 0
            let qline = prevnonblank( qline - 1 )
            if getline(qline) =~? '\v(\=\s*'')|(\=\s*")'
                let indnt = indent( qline )
                break
            endif
        endwhile
    endif

    " Top Closer [] (When not at beginning)
    if this_codeline =~? g:moose_fw_variables_topend[3:]
        let indnt -= &shiftwidth
    endif

    " Sub Closer [../]
    if this_codeline =~? g:moose_fw_variables_subend
        let indnt -= &shiftwidth
    endif

    " Return the net indent modification
    return indnt
endfunction
