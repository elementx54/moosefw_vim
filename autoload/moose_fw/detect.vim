" Autoload functions for ftdetect/moose_fw.vim.
" Languages: MOOSE Framework input

" Detect file based on if contains a [Opener] and [] closer block.
"   let g:moo_fw_search_lines = 'smaller number' variable if loading files
"   becomes slow.
function! moose_fw#detect#CheckMOOSEfwInput()
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
                    setfiletype moose_fw
                    let sub += check_lines
                    let c += check_lines
                endif
                let sub += 1
            endwhile
        endif
        let c += 1
    endwhile
endfunction
