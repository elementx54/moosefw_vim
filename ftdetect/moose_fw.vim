" Vim file to detect MOOSE framework input files.
" Languages: MOOSE Framework input
" Creator: Xenon54z
" Latest Revision: January 2016

" Detect file based on extension
" Common input extension is .i
au BufRead,BufNewFile *.i set filetype=moose_fw

" Example: MOOSE Framework input (*.moo)
"au BufRead,BufNewFile *.moo set filetype=moose_fw

" NOTE: A modeline could also be used to set the filetype for any extension.
" To use modelines, put this line at the start or end of your MOOSE input file.
" Remove the quotation mark and space (" ):
" # vi:filetype=moose_fw
" IMPORTANT: The space between # and vi is required.

" Detect file based on if contains a [Opener] and [] closer block.
"   Change the check_lines variable if loading files becomes slow.
function! s:CheckMOOSEfwInput()
    if &filetype == "moose_fw"
        return
    endif
    " Check certain number of lines
    let check_lines = 50
    let c = 1
    while c <= check_lines
        if getline(c) =~ '\[\w*\w\]'
            " Found a opener
            let sub = 1
            while sub <= check_lines
                if getline(c + sub) =~ '\[\]'
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

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    au BufRead * call s:CheckMOOSEfwInput()
endif
