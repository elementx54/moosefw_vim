" Autoload functions for ftplugin/moose_fw/insert_pairs.vim.
" Language: MOOSE Framework input file
" Creator: Xenon54z

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
        elseif l:linestring =~? g:moose_fw_variables_newtop
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
function! moose_fw#insert_pairs#CloseGetPot()
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
