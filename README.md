INTRODUCTION
------
To help make writing MOOSE input files easier on a common editor found on
almost all remote computation resources, I want to make VIM files that do the
style right, highlight keywords, do folding, and might check for open blocks
or unmatched open-close pairs.

INSTALLING
------
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

CUSTOMIZATION
------
Feel free to change highlighting colors in the `syntax/moose_fw.vim` file or
place a custom syntax file in the vim `after` directory. Actually, feel free to
change anything.
I've also found it handy to syntax highlight the dump files (`--dump`) when
output into a file. You can either make the file extension match an input file
extension or tell Vim directly the filetype.
To tell Vim the filetype, place `# vi:filetype=moose_fw` at either the top or
bottom of the file.

