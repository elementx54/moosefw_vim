" Allow for easier method to comment blocks of MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z

if exists("g:moo_fw_no_commenting") || exists("b:did_commenting")
    finish
endif
let b:did_commenting = 1

" Function to find column to place # in
function! s:SavedColumn()
    " Check previous line for comment
    let l:orig_pos = 'call cursor('.line('.').','. col('.'). ')'
    if getline(prevnonblank(line('.')-1)) =~? '\v^\s*\#'
        " Previous line has only a comment on it
        execute 'call cursor(' . prevnonblank(line('.')-1) . ',0)'
    endif
    " Find column to place '#' on
    if getline('.') =~? '\v^\s'
        execute 'silent normal! 0w'
        let l:tempcol = col('.')
    else
        let l:tempcol = 1
    endif
    execute l:orig_pos
    return l:tempcol
endfunction

" Function to loop and place comments at specific column
function! s:CommentAtIndent(num_count)
    let l:comcol = s:SavedColumn()
    let l:i_c = 0
    while l:i_c != a:num_count
        let l:i_c += 1
        if getline('.') =~? '\v^$'
            " Treat blank lines special
            execute 'silent normal! ' . l:comcol . 'i ' . "\<ESC>"
        elseif getline('.') =~? '\v^\s'
            execute 'silent normal! 0w'
            if l:comcol < col('.')
                execute 'silent normal! ' . l:comcol . '|'
            endif
        else
            execute 'silent normal! 0'
        endif
        execute 'silent normal! i#' . "\<ESC>" . 'j'
    endwhile
endfunction

" Function to loop and remove comment at beginning of line
function! s:RemovePlacedComment(num_count)
    let l:i_c = 0
    while l:i_c != a:num_count
        let l:i_c += 1
        if getline('.') =~? '\v^\s+\# $'
            " Has hanging alone '#'
            execute 'silent normal! 0d$'
        elseif getline('.') =~? '\v^\#'
            execute 'silent normal! 0x'
        elseif getline('.') =~? '\v^\s+\#\s*\w.*$'
            execute 'silent normal! 0wx'
        endif
        execute 'silent normal! j'
    endwhile
endfunction

" Mapping add comment and delete comments
noremap <script> <buffer> <silent> <Leader>c :<C-U>call <SID>CommentAtIndent(v:count1)<CR>
noremap <script> <buffer> <silent> <Leader>x :<C-U>call <SID>RemovePlacedComment(v:count1)<CR>
