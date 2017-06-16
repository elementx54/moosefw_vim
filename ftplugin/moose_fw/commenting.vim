" Allow for easier method to comment blocks of MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z

if exists("g:moo_fw_no_commenting") || exists("b:did_commenting")
    finish
endif
let b:did_commenting = 1

" Function to find column to place # in
function! s:SavedColumn(direction)
    let l:orig_pos = 'call cursor('.line('.').','. col('.'). ')'
    " Check previous or post line for comment
    if a:direction
        " Look down cause going up
        if getline(nextnonblank(line('.')+1)) =~? '\v^\s*\#'
            " Next line has only a comment on it
            execute 'call cursor(' . nextnonblank(line('.')+1) . ',0)'
        endif
    else
        " Look up cause going down
        if getline(prevnonblank(line('.')-1)) =~? '\v^\s*\#'
            " Previous line has only a comment on it
            execute 'call cursor(' . prevnonblank(line('.')-1) . ',0)'
        endif
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
function! s:CommentAtIndent(num_count, direction)
    let l:comcol = s:SavedColumn(a:direction)
    let l:lesscom = l:comcol - 1
    let l:i_c = 0
    while l:i_c != a:num_count
        let l:i_c += 1
        if getline('.') =~? '\v^$'
            " Treat blank lines special since need end of line
            execute 'silent normal! ' . l:lesscom . 'i ' . "\<ESC>"
            execute 'silent normal! A#' . "\<ESC>"
        else
            if getline('.') =~? '\v^\s'
                execute 'silent normal! 0w'
                if l:comcol < col('.')
                    execute 'silent normal! ' . l:comcol . '|'
                endif
            else
                execute 'silent normal! 0'
            endif
            execute 'silent normal! i#' . "\<ESC>"
        endif
        if a:direction
            execute 'silent normal! k'
        else
            execute 'silent normal! j'
        endif
    endwhile
endfunction

" Function to loop and remove comment at beginning of line
function! s:RemovePlacedComment(num_count, direction)
    let l:i_c = 0
    while l:i_c != a:num_count
        let l:i_c += 1
        if getline('.') =~? '\v^\s+\#$'
            " Has hanging alone '#'
            execute 'silent normal! 0d$'
        elseif getline('.') =~? '\v^\#'
            " Begins line with '#'
            execute 'silent normal! 0x'
        elseif getline('.') =~? '\v^\s+\#\s*\S.*$'
            " space and then comment with space or no space
            execute 'silent normal! 0wx'
        endif
        if a:direction
            execute 'silent normal! k'
        else
            execute 'silent normal! j'
        endif
    endwhile
endfunction

" Mapping add comment and delete comments
noremap <script> <buffer> <silent> <Leader>c :<C-U>call <SID>CommentAtIndent(v:count1, 0)<CR>
noremap <script> <buffer> <silent> <Leader>x :<C-U>call <SID>RemovePlacedComment(v:count1, 0)<CR>
noremap <script> <buffer> <silent> <Leader>C :<C-U>call <SID>CommentAtIndent(v:count1, 1)<CR>
noremap <script> <buffer> <silent> <Leader>X :<C-U>call <SID>RemovePlacedComment(v:count1, 1)<CR>
