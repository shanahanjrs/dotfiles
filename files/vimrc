"------------------------------------------------------------------------------
" Important
"------------------------------------------------------------------------------
set history=500		"500 commands back
set undofile		"Persistant undo
set undolevels=500	"Undo's
set undoreload=500	"Undo buffer
set undodir=~/.vim/backup


set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
" Set a backup directory for vim


"------------------------------------------------------------------------------
" Moving around, searching, patterns, and mapping
"------------------------------------------------------------------------------

" remap 'jj' to escape in insert mode
inoremap jj <Esc>

" Fix broken backspace in 7.4
set backspace=2

"------------------------------------------------------------------------------
" Displaying text
"------------------------------------------------------------------------------
set scrolloff=9		"Number of lines to show around cursor
set number 		"Show line numbers

"------------------------------------------------------------------------------
" Syntax, highlighting and spelling
"------------------------------------------------------------------------------
syntax on		"Turn on syntax highlighting
set background=dark	"Assumes a dark bg
execute "set colorcolumn=" . join(range(81,335), ',') 	

			"Display different color line in column 80
			"to show you when to line break and
			"Sets colorcolumn to black
:hi ColorColumn ctermbg=black guibg=black
			"Makes anything past 80 col red/white
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

set hlsearch		"Highlight search terms

"------------------------------------------------------------------------------
" Multiple windows
"------------------------------------------------------------------------------
set laststatus=2


"------------------------------------------------------------------------------
" Terminal
"------------------------------------------------------------------------------
set ttyfast


"------------------------------------------------------------------------------
" Messages and info
"------------------------------------------------------------------------------
set showcmd 		"In status bar, show incomlete commands as they are typed.
set spell		"Turn on spell check
set ruler		"Always display the current cursor pos. in the status bar.

"------------------------------------------------------------------------------
" Selecting text
"------------------------------------------------------------------------------
set clipboard=unnamed	"Yank to system clipboard by default


"------------------------------------------------------------------------------
" Editing text/Tabs and indenting
"------------------------------------------------------------------------------

" Indent using Google's python style guide

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

" Some extra indentation magic...
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


"------------------------------------------------------------------------------
" Folding/splitting
"------------------------------------------------------------------------------
set splitbelow
" For more natural looking splitting


"------------------------------------------------------------------------------
" Diff mode
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" Reading and writing files
"------------------------------------------------------------------------------
set autoread	"Automatically re-read files changed outside of Vim.


"------------------------------------------------------------------------------
" Multi-byte characters
"------------------------------------------------------------------------------
set encoding=utf-8


"------------------------------------------------------------------------------
" Various
"------------------------------------------------------------------------------
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/\
after,$HOME/.vim/after
endif		"Make Windows compatible

"------------------------------------------------------------------------------
" Vundle support
"------------------------------------------------------------------------------
set nocompatible "No Vi support
filetype off	"Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let Vundle manage Vundle
"Required
Bundle 'gmarik/vundle'

"Put Bundles here:
"
"Original repos on Github
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'


"Vim scripts repos

"Non-github repos

" ---

filetype plugin indent on	"Required

"Brief Vundle help:
" :BundleList		-list configured bundles
" :BundleInstall(!)	-install(update) bundles
" :BundleSearch(!) foo	-search for foo
" :BundleClearn(!)	-confirm removal of unused bundles
"
" see :h vundle for more details
" NOTE: comments after Bundle are now allowed

