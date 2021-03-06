if has('python3')
  silent! python3 1
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Change color schemes by calling colorscheme <name>
Plugin 'flazz/vim-colorschemes'
" Solarized colors
Plugin 'altercation/vim-colors-solarized'
" Tree explorer for file systems
Plugin 'scrooloose/nerdtree'
" Fix markdown syntax highlighting
Plugin 'drmingdrmer/vim-syntax-markdown'
" Vim Scala Support
Plugin 'derekwyatt/vim-scala'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" Use macOS Preview to display PDF.
let g:livepreview_previewer = 'open -a Preview'

set number
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

set modeline
set wildmode=longest,list
set history=1000

" Setup font
syntax on
if has('gui_running')
	if has('gui_macvim')
		set guifont=Menlo:h12
	else
		set guifont=DejaVu\ Sans\ Mono\ Book\ 12
	endif
else
	set t_Co=256
	try
		colorscheme jellybeans
	catch /^Vim\%((\a\+)\)\=:E185/
	endtry
endif

" Use solarized colorscheme
if has('gui_running')
	syntax enable
	set background=dark
	colorscheme solarized
	call togglebg#map("")
endif

" Use macOS Preview to display PDFs.
let g:livepreview_previewer = 'open -a Preview'

" Highlight 100 character column
if version >= 703
	let &colorcolumn=join(range(101,101),",")
endif

" Remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
