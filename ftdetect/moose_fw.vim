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
" To use modelines, put this line at the beginning of your MOOSE input file.
" Remove the quotation mark and space (" ):
" # vi:filetype=moose_fw
" IMPORTANT: The space between # and vi is required.

" TODO Create a search the file for something every MOOSE input has like
"   [Kernels] or just [].
