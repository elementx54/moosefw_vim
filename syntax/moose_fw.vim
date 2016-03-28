" Vim syntax file for MOOSE framework input files.
" Language: MOOSE Framework input file
" Creator: Xenon54z
" Latest Revision: January 2016

if exists("b:current_syntax")
    finish
endif

"" Number Matching
" Integer with - + or nothing in front
syn match mooInteger "\v\d+" display
syn match mooInteger "\v[-+]\d+" display

" Floating point number with decimal no E or e 
syn match mooFloat "\v\d+\.\d*" display
syn match mooFloat "\v[-+]\d+\.\d*" display

" Floating point like number with E and no decimal point (+,-)
syn match mooFloat "\v[-+]=\d[[:digit:]]*[eE][-+]=\d+" display
syn match mooFloat "\v\d[[:digit:]]*[eE][-+]=\d+" display

" Floating point like number with E and decimal point (+,-)
syn match mooFloat "\v[-+]=\d[[:digit:]]*\.\d*[eE][-+]=\d+" display
syn match mooFloat "\v\d[[:digit:]]*\.\d*[eE][-+]=\d+" display

" Boolean Matching
syn keyword mooBoolean true false

" Todo's and Notes and Comments
syn keyword mooTodo contained TODO todo Todo FIXME fixme Fixme NOTE Note note
syn match mooComment "\v\#.*$" contains=mooTodo

"" Keyword Matching
" Define block regions
syn region mooTopBlock start="\v\[(\w|\-)*\w\]" end="\v\[\]" fold transparent contains=ALLBUT,mooTodo,mooSubWord
syn region mooSubBlock matchgroup=mooSubWord start="\v\[\.\/(\w|\-|\*)*\]" end="\v\[\.\.\/\]" fold transparent contained contains=ALLBUT,mooTodo,mooTopBlock,mooTopWord
syn sync fromstart

" Many of the following matches are borrowed from Daniel Schwen's Atom files.
" Thanks Daniel! :D
syn match mooTopWord "\v(\[)(Bounds|Mesh|MeshModifiers|Kernels|AuxKernels|ScalarKernels|AuxScalarKernels|Variables|AuxVariables|Materials|Postprocessors|BCs|ICs|Executioner|Outputs|Problem|Debug|Preconditioning|UserObjects|Functions|GlobalParams|VectorPostprocessors|Dampers|DiracKernels|DGKernels|Constraints|NodalNormals|CoupledProblems|DeprecatedBlock|MultiApps|Transfers)(\])" contained
syn keyword mooControl contained TimeStepper TimePeriods Quadrature Predictor Adaptivity Indicators Markers Periodic InitialCondition MortarInterfaces
syn keyword mooOrder contained CONSTANT FIRST SECOND THIRD FOURTH FIFTH SIXTH SEVENTH EIGHTH NINTH
syn keyword mooQuad contained LAGRANGE MONOMIAL HERMITE SCALAR HIERARCHIC CLOUGH XYZ SZABAB BERNSTEIN L2_LAGRANGE L2_HIERARCHIC
syn keyword mooElem contained EDGE EDGE2 EDGE3 EDGE4 QUAD QUAD4 QUAD8 QUAD9 TRI3 TRI6 HEX HEX8 HEX20 HEX27 TET4 TET10 PRISM6 PRISM15 PRISM18
syn keyword mooWhen contained none initial linear nonlinear timestep_end timestep_begin final failed custom
syn keyword mooOper contained abs acos acosh arg asin atan atan2 atanh cbrt ceil conj cos cosh cot csc exp exp2 floor hypot if imag int log log10 log2 max min polar pow real sec sin sinh sqrt tan tanh trunc plog

" MOOSE escape characters
syn match mooEscape "\v\\." display

" MOOSE strings
syn match mooString "\v(\"|\').*(\1)"

" MOOSE type helps spot what a block or sub-block is about
syn match mooType "\v<type((\s|\t)+)*\=" contained
syn match mooActive "\v<active((\s|\t)+)*\=" contained

" MOOSE sub-block words can be anything.
syn match mooSubWord "\v\[\.\/(\w|\-|\*)*\]" contained

"" Highlighting Links
" Set the script has run
let b:current_syntax = "moose_fw"

" Definitions
hi def link mooInteger      Number
hi def link mooFloat        Float
hi def link mooBoolean      Boolean
hi def link mooTodo         Todo
hi def link mooComment      Comment
hi def link mooTopWord      Label
hi def link mooControl      Keyword
hi def link mooOrder        Keyword
hi def link mooQuad         Keyword
hi def link mooElem         Tag
hi def link mooWhen         Keyword
hi def link mooOper         Operator
hi def link mooEscape       VisualNOS
hi def link mooString       String
hi def link mooType         Type
hi def link mooActive       WarningMsg
hi def link mooSubWord      Identifier

