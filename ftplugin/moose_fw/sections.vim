" Vim section movement file for MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z
" Latest Revision: February 2017

" Borrowed from 'Learn Vimscript the Hard Way'
" Function to move section
function! s:Move2Section(visual, direction, type)
    if a:visual
        normal! gv
    endif

    if a:direction
        let dir = '?'
        let flags = 'e'
    else
        let dir = '/'
        let flags = ''
    endif

    if a:type
        " Opening Section
        let pattern = '\v(' . g:moose_fw_variables_topstart[2:] . ')|('
            \ . g:moose_fw_variables_substart[2:] . ')'
    else
        " Closing Section
        let pattern = '\v(' . g:moose_fw_variables_topend[2:] . ')|('
            \ . g:moose_fw_variables_subend[2:] . ')'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

" Mapping Section Movement Commands (Press them quickly together.)
" Search towards end for closing section
noremap <script> <buffer> <silent> ]] :call <SID>Move2Section(0, 0, 0)<CR>
vnoremap <script> <buffer> <silent> ]] :<C-U>call <SID>Move2Section(1, 0, 0)<CR>
" Search towards end for opening section
noremap <script> <buffer> <silent> ][ :call <SID>Move2Section(0, 0, 1)<CR>
vnoremap <script> <buffer> <silent> ][ :<C-U>call <SID>Move2Section(1, 0, 1)<CR>
" Search towards beginning for closing section
noremap <script> <buffer> <silent> [] :call <SID>Move2Section(0, 1, 0)<CR>
vnoremap <script> <buffer> <silent> [] :<C-U>call <SID>Move2Section(1, 1, 0)<CR>
" Search towards beginning for opening section
noremap <script> <buffer> <silent> [[ :call <SID>Move2Section(0, 1, 1)<CR>
vnoremap <script> <buffer> <silent> [[ :<C-U>call <SID>Move2Section(1, 1, 1)<CR>
