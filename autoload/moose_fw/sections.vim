" Autoload functions for ftplugin/moose_fw/sections.vim.
" Language: MOOSE Framework input file

" Borrowed from 'Learn Vimscript the Hard Way'
" Function to move section
function! moose_fw#sections#Move2Section(visual, direction, type)
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
            \ . g:moose_fw_variables_substart[2:] . ')|('
            \ . g:moose_fw_variables_newtop[2:] . ')'
    else
        " Closing Section
        let pattern = '\v(' . g:moose_fw_variables_topend[2:] . ')|('
            \ . g:moose_fw_variables_subend[2:] . ')|('
            \ . g:moose_fw_variables_newend[2:] . ')'
    endif

    execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction
