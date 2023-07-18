" Vim file to detect MOOSE framework input files.
" Languages: MOOSE Framework input
" Creator: Xenon54z

" Detect file based on extension
" Common input extension is .i
if !exists('g:moo_fw_extensions')
    let g:moo_fw_extensions = ["i"]
endif
augroup moo_fw_auto_ext
    autocmd!
    if len(g:moo_fw_extensions) > 0
        execute 'autocmd BufRead,BufNewFile *.'
            \ . join(g:moo_fw_extensions, ',*.') . ' set filetype=moose_fw'
    endif
augroup END

" NOTE: A modeline could also be used to set the filetype for any extension.
" To use modelines, put this line at the start or end of your MOOSE input file.
" Remove the quotation mark and space (" ):
" # vi:filetype=moose_fw
" IMPORTANT: The space between # and vi is required.

augroup moo_fw_autodetect
    autocmd!
    if !exists('g:moo_fw_search_file_disable')
        autocmd BufRead * call moose_fw#detect#CheckMOOSEfwInput()
    endif
augroup END
