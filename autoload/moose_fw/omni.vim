" Vim omnifunction for omni completion for MOOSE input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z
"
" Not sure what to put here yet
" Examples of omnifunc:
"   https://codeberg.org/cwfoo/vim-text-omnicomplete/src/branch/master/autoload/text_omnicomplete.vim
"   https://github.com/machakann/vim-Verdin/blob/master/autoload/Verdin/Completer.vim
"   https://github.com/prabirshrestha/vim-lsp/blob/master/autoload/lsp/omni.vim
"
" Good Resource: https://learnvimscriptthehardway.stevelosh.com/
"
" In looking at the VSCode MOOSE autocomplete, they do these things:
"   - Completes parameter names addingin = and default option for that
"   parameter based on type of subblock.
"   - After `=`, it provides valid options (including default) to user. It also
"   for some items, looks at the subblock names in the input and adds them as
"   choices for certain parameters that require subblock names.
"   This also works for the `active = '__all__'` parameter.
"   - Knows whether to automatically add string quotes or not.
" See the example at https://mooseframework.inl.gov/help/development/VSCode.html
"
" My Ideas:
" I will probably need a few functions insides the omnifunc.
"   1. I think the json sytax output from BISON itself will be best to get the
"   structure of an input file. I will need to decide how to get the user to
"   provide this or provide the executable path and I grab it. I wonder if the
"   grabbing the whole thing at once would be too laggy or long, or if I could
"   just grab only the part I care about (or one block up). This would require
"   #2 to run first. If loading the whole thing then I should guard it so I
"   don't load it multiple times when not needed.
"   I'll need a json parser in vimscript and a way to interface with the
"   parsed json data.
"   2. Determine in what block and subblock the cursor is in when the
"   onmifunction is called. This might not be needed when finding the starting
"   column for inserting the "completed word" or line; only needed when
"   populating the choices/matches.
"   3. Choice logic based on location, parameter, and then (if needed) file
"   contents.
"
" I plan on having users specify the omnifunc in their autocommand for
" moose_fw which is how they will enable this script file autoloading. If they
" don't put it in their .vimrc, then it will remain disabled. I will need to
" add this to the help docs and rebuild the tags. The resource above talks
" about that.
"
" Now to find the time to attempt this...

echom "Autoloading moose_fw..." "Remove this when full done

" Omnifunc for omni completion.
function! moose_fw#omni#Complete(findstart, base) abort
    " Where to start?

