" Vim file to detect MOOSE framework input files.
" Languages: MOOSE Framework input
" Creator: Xenon54z

" Detect file based on extension
" Common input extension is .i
if !exists('g:moo_fw_extensions')
    let g:moo_fw_extensions = ["i"]
endif
if len(g:moo_fw_extensions) > 0
    execute 'autocmd BufRead,BufNewFile *.' . join(g:moo_fw_extensions, ',*.')
        \ . ' set filetype=moose_fw'
endif

" Example: MOOSE Framework input (*.moo)
"au BufRead,BufNewFile *.moo set filetype=moose_fw

" NOTE: A modeline could also be used to set the filetype for any extension.
" To use modelines, put this line at the start or end of your MOOSE input file.
" Remove the quotation mark and space (" ):
" # vi:filetype=moose_fw
" IMPORTANT: The space between # and vi is required.

" Detect file based on if contains a [Opener] and [] closer block.
"   let g:moo_fw_search_lines = 'smaller number' variable if loading files
"   becomes slow.
function! s:CheckMOOSEfwInput()
    if &filetype ==? "moose_fw"
        return
    endif
    " Check certain number of lines
    if !exists('g:moo_fw_search_lines')
        let g:moo_fw_search_lines = 50
    endif
    let check_lines = g:moo_fw_search_lines
    let c = 1
    while c <= check_lines
        if getline(c) =~? g:moose_fw_variables_topstart
            " Found an opener
            let sub = 1
            while sub <= check_lines
                if getline(c + sub) =~? g:moose_fw_variables_topend
                    set filetype=moose_fw
                    let sub += check_lines
                    let c += check_lines
                endif
                let sub += 1
            endwhile
        endif
        let c += 1
    endwhile
endfunction

if !exists('g:moo_fw_search_file_disable')
    if !exists("b:autocommands_loaded_mfw")
        let b:autocommands_loaded_mfw = 1
        autocmd BufRead * call s:CheckMOOSEfwInput()
    endif
endif
