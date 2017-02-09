## INTRODUCTION
---
To help make writing [MOOSE](http://mooseframework.org/) input files easier on
a common editor found on almost all remote computation resources, I want to
make a VIM plugin that does the style right, highlights keywords, does folding,
and might check for open blocks or unmatched open-close pairs.

## INSTALLING
---
### Manual Method
Inside the users home VIM directory (on Linux `.vim`) copy the contents of each
subdirectory into the corresponding subdirectory. If a subdirectory does not
exist then create that subdirectory. Ensure that syntax, indentation, and
folding is on by filetype.

### [Vundle](https://github.com/VundleVim/Vundle.vim) Method
Assuming you have already set up
[Vundle](https://github.com/VundleVim/Vundle.vim), place this plugin line in
the `.vimrc` to install:
```vim
Plugin 'elementx54/moosefw_vim.git'
```
Then update your plugins with the command `:PluginInstall` when running `vim`.

## CUSTOMIZATION
---
Feel free to change highlighting colors in the `syntax/moose_fw.vim` file or
place a custom syntax file in the Vim `after` directory. Actually, feel free to
change anything.
I've also found it handy to syntax highlight the dump files (`--dump`) when
output into a file. You can either make the file extension match an input file
extension or tell Vim directly the filetype.
To tell Vim the filetype, place `# vi:filetype=moose_fw` at either the top or
bottom of the file.

## INFORMATION
---
### MOOSE Input Format
MOOSE input format is a [GetPot](http://getpot.sourceforge.net/) input
structure. The syntax coloring is provided specifically for MOOSE keywords and
can be customized. MOOSE input files traditionally end with `*.i`, but any
ending may be used as this plugin can search the input file's beginning
lines looking for a `[*Opening*]` and `[]` closing pair. This plugin identifies
MOOSE input files as being `filetype=moose_fw`. The `moose_fw` stands for
_MOOSE Framework_.

Although indentation formatting is not required, this plugin includes 
indentation formatting based on user indentation settings. Auto-indentation
occurs as text is entered, both forward and backward indents. To fix indents on
an entire input file, use the Vim command in normal mode `gg=G`.

### Default Configuration Values
The number of lines to search the beginning of a file for a section pair of
bracket sets `[]` identifying the file as a `moose_fw` filetype.
```vim
let g:moo_fw_search_lines = 50  " Defaults to 50 lines.
```
  
To disable searching files for bracket pairs identifying the file as a
`moose_fw` filetype, simply create the global variable.
```vim
let g:moo_fw_search_file_disable = 1  " Defaults to being enabled.
```
