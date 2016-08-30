" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Shows the git diff in the sign column
Plugin 'airblade/vim-gitgutter'
" Solarized colors
Plugin 'altercation/vim-colors-solarized'
" Detect modifications to vim buffers
Plugin 'def-lkb/vimbufsync'
" Use Tab for insert completion
Plugin 'ervandew/supertab'
" Change color schemes by calling colorscheme <name>
Plugin 'flazz/vim-colorschemes'
" Line up text by calling :Tab /<delimiter>
Plugin 'godlygeek/tabular'
" Tree explorer for file systems
Plugin 'scrooloose/nerdtree'
" Syntax checking hacks
Plugin 'scrooloose/syntastic'
" Fix markdown syntax highlighting
Plugin 'drmingdrmer/vim-syntax-markdown'
" Vim Scala Support
Plugin 'derekwyatt/vim-scala'
 
if version >= 703
	Plugin 'Lokaltog/vim-easymotion'
endif

call vundle#end()
filetype plugin indent on

set number
set smartindent
set tabstop=4
set shiftwidth=4

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

" EasyMotion Plugin
if version >= 703
	map  / <Plug>(easymotion-sn)
	omap / <Plug>(easymotion-tn)
endif

" Syntastic Options
let g:syntastic_cpp_compiler_options = ' -std=c++11'
autocmd BufRead,BufNewFile *.md  set filetype=markdown

