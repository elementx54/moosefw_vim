" Vim section movement file for MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z

" Similar to indent code but for placing closing block items
" Check if wanted or not
if exists("g:moo_fw_no_insert_pairs") || exists("b:did_insert_pairs")
    finish
endif
let b:did_insert_pairs = 1

" Save cursor position to get back to it
function! s:SavePosition()
    return 'call cursor('.line('.').','. col('.'). ')'
endfunction

" Function to check if closing pair is needed
function! s:NeedClosingPair()
    let l:typecloser = 'NULL'
    let l:linestring = getline('.')
    " Skip if part of comment
    if l:linestring !~? g:moose_fw_variables_comment
        " Check which one if any is needed
        if l:linestring =~? g:moose_fw_variables_topstart
            let l:typecloser = '[]'
        elseif l:linestring =~? g:moose_fw_variables_substart
            let l:typecloser = '[../]'
        else
            let l:typecloser = 'UNKNOWN'
        endif
    else
        let l:typecloser = 'COMMENT'
    endif
    return l:typecloser
endfunction

" Main function to close block section
function! s:CloseGetPot()
    " No Beep
    if col('.') == col('$') - 1
        " For at end of line
        execute 'silent normal! A]'
    else
        " For inbetween
        execute 'silent normal! i]'
        normal l
    endif
    " Get current cursor position
    let l:restore = s:SavePosition()
    let l:closer = s:NeedClosingPair()
    if l:closer !=# 'COMMENT' && l:closer !=# 'UNKNOWN' && l:closer !=# 'NULL'
        " We can place a closer on the next line down
        execute 'silent normal! o' . l:closer . "\<ESC>"
        execute l:restore
        startinsert!
    endif
endfunction

" So it begins
inoremap <script> <buffer> <silent> ] <C-O>:call <SID>CloseGetPot()<CR>
