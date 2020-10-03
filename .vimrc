"j-mdw .vimrc set up

"TEXT RENDERING

set encoding=utf-8
"Setting tabs to be 4 spaces
"Usefl commmand to change this directly inside file opened with vim is: \
":set tabstop=x
":retab!
"set shiftwidth=4 
set tabstop=4
set autoindent
"Avoid wrapping a line in the middle of a word
set linebreak 
set scrolloff=1
set sidescrolloff=5
set wrap

"USER INTERFACE

set ruler
"Always show the status line
set laststatus=2
"Display line numbers
set number
"Enable wildmenu
"E.g. type ':color <Tab>' to see the various options available
set wildmenu
"Enable mouse
set mouse=a
"set title
set background=dark
syntax on
colo torte 

"OTHER OPTIONS

"Set undo limit to 500
set history=500
"Enables spell checking (desabled here)
"set spell
set magic
"Show matching brackets when text editor is over them
set showmatch

"Delete trailing spaces on Save for .c files
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.c :call CleanExtraSpaces()
endif
