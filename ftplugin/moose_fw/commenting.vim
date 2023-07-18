" Allow for easier method to comment blocks of MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z

if exists("g:moo_fw_no_commenting") || exists("b:did_commenting")
    finish
endif
let b:did_commenting = 1

" Mapping add comment and delete comments (not in operator pending mode)
nnoremap <script> <buffer> <silent> <Leader>c :<C-U>call moose_fw#commenting#CommentAtIndent(v:count1, 0)<CR>
vnoremap <script> <buffer> <silent> <Leader>c :call moose_fw#commenting#CommentAtIndent(v:count1, 0)<CR>gv

nnoremap <script> <buffer> <silent> <Leader>x :<C-U>call moose_fw#commenting#RemovePlacedComment(v:count1, 0)<CR>
vnoremap <script> <buffer> <silent> <Leader>x :call moose_fw#commenting#RemovePlacedComment(v:count1, 0)<CR>gv

nnoremap <script> <buffer> <silent> <Leader>C :<C-U>call moose_fw#commenting#CommentAtIndent(v:count1, 1)<CR>
vnoremap <script> <buffer> <silent> <Leader>C :call moose_fw#commenting#CommentAtIndent(v:count1, 1)<CR>gv

nnoremap <script> <buffer> <silent> <Leader>X :<C-U>call moose_fw#commenting#RemovePlacedComment(v:count1, 1)<CR>
vnoremap <script> <buffer> <silent> <Leader>X :call moose_fw#commenting#RemovePlacedComment(v:count1, 1)<CR>gv
