## INTRODUCTION
---
To help make writing [MOOSE](http://mooseframework.org/) input files easier on
a common editor found on almost all remote computation resources, I want to
make a Vim plugin that does the style right, highlights keywords, does folding,
and does section movement correctly. Vim style documentation also included and
accessed by `:help moose_fw`.

## INSTALLING
---
### Manual Method
Inside the user's home Vim directory (on Linux `.vim`) copy the contents of
each subdirectory into the corresponding subdirectory. If a subdirectory does
not exist then create that subdirectory. Ensure that syntax, indentation, and
folding are on by filetype.

### Native Vim Package Manager
Vim has a native package manager loader for plugins (`:help packages`). Within
the `pack` directory create a folder structure ending with a `start` directory
and place the plugin inside its own directory, such as:
`~/.vim/pack/github/start/moosefw_vim`, then following the manual installation
method placing the contents in `moosefw_vim` OR clone the repository into the
directory (`git@github.com:elementx54/moosefw_vim.git moosefw_vim`).  

The plugin should usually **not** be placed in an optionally loaded (`opt`)
directory due to the filetype detection being part of the plugin.

### [Vundle](https://github.com/VundleVim/Vundle.vim) Method
Assuming you have already set up
[Vundle](https://github.com/VundleVim/Vundle.vim), place this plugin line in
the `.vimrc` to install:
```vim
Plugin 'elementx54/moosefw_vim.git'
```
Then update your plugins with the command `:PluginInstall` when running `vim`.
To include the plugin's Vim style documentation, use the command `:PluginDocs`.

### [vim-plug](https://github.com/junegunn/vim-plug) Method
Assuming you have already set up
[vim-plug](https://github.com/junegunn/vim-plug), place this plugin line in
the `.vimrc` to install:
```vim
Plug 'elementx54/moosefw_vim'
```
Then update your plugins with the command `:PlugInstall` when running `vim`.
The Vim style documentation should be updated as well.

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
MOOSE input format is loosely based off a
[GetPot](http://getpot.sourceforge.net/) input structure. The MOOSE input
parser now allows for more flexibility between parent and child pairs.
The syntax coloring is provided specifically for MOOSE keywords and
can be customized. Syntax highlighting works best with the old MOOSE input
structure. MOOSE input files traditionally end with `*.i`, but any
ending may be used as this plugin can search the input file's beginning
lines looking for a `[*Opening*]` and `[]` closing pair. This plugin identifies
MOOSE input files as being `filetype=moose_fw`. The `moose_fw` stands for
_MOOSE Framework_.

Although indentation formatting is not required, this plugin includes 
indentation formatting based on user indentation settings. Auto-indentation
occurs as text is entered, both forward and backward indents. To fix indents on
an entire input file, use the Vim command in normal mode `gg=G`.

The style of folding is left up to each individual user. Folding by syntax or
indent can be set locally with an autocommand place in the `.vimrc` file.
```vim
autocmd FileType moose_fw setlocal foldmethod=syntax|indent foldignore=
```

### Default Configuration Values
For many of the configuration values to work properly, the location of the
command `filtype plugin on` in the `.vimrc` file MUST come after user defined
configuration values.

The number of lines to search the beginning of a file for a section pair of
bracket sets `[]` identifying the file as a `moose_fw` filetype.
```vim
let g:moo_fw_search_lines = 50  " Defaults to 50 lines.
```
  
To disable searching files for bracket pairs identifying the file as a
`moose_fw` filetype, create the global variable.
```vim
let g:moo_fw_search_file_disable = 1  " Defaults to being enabled.
```

The input file extensions which could identify `moose_fw` filetype may be set
with the global variable. The '*.' part is automatically applied to the list.
```vim
let g:moo_fw_extensions = ["i"]  " Defaults to ["i"] for '*.i' file names.
```
To disable file extension assignment of `moose_fw` filetype, set the global
variable to an empty string.
```vim
let g:moo_fw_extensions = []  " Automatic detection still searches unless disabled.
```

To disable the insertion of closing pairs when an opening pair has been typed,
create the global variable.
```vim
let g:moo_fw_no_insert_pairs = 1  " Defaults to being enabled.
```

To disable the key maps for commenting, create the global variable.
```vim
let g:moo_fw_no_commenting = 1  " Defaults to being enabled.
```
