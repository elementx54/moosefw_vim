" Vim section movement file for MOOSE framework input files.
" Language: MOOSE Framework input file

" Mapping Section Movement Commands (Press them quickly together.)
" Search towards end for closing section
noremap <script> <buffer> <silent> ]] :call moose_fw#sections#Move2Section(0, 0, 0)<CR>
vnoremap <script> <buffer> <silent> ]] :<C-U>call moose_fw#sections#Move2Section(1, 0, 0)<CR>
" Search towards end for opening section
noremap <script> <buffer> <silent> ][ :call moose_fw#sections#Move2Section(0, 0, 1)<CR>
vnoremap <script> <buffer> <silent> ][ :<C-U>call moose_fw#sections#Move2Section(1, 0, 1)<CR>
" Search towards beginning for closing section
noremap <script> <buffer> <silent> [] :call moose_fw#sections#Move2Section(0, 1, 0)<CR>
vnoremap <script> <buffer> <silent> [] :<C-U>call moose_fw#sections#Move2Section(1, 1, 0)<CR>
" Search towards beginning for opening section
noremap <script> <buffer> <silent> [[ :call moose_fw#sections#Move2Section(0, 1, 1)<CR>
vnoremap <script> <buffer> <silent> [[ :<C-U>call moose_fw#sections#Move2Section(1, 1, 1)<CR>
