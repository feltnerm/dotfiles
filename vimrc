"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark Feltner 
" Version 3.0 - 05/04/11
"
"
" References:
" *	The ultimate Vim configuration ( http://amix.dk/vim/vimrc.html )
" *	StackOverflow ( http://goo.gl/bfd0p )
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
" General Settings
""
set nocompatible			" don't inherit vi traits
set number				" show line numbers
set ruler				" show ruler at bottom of screen
set encoding=utf-8			" set encoding
set autoread				" watch for file changes
set history=700				" 200 lines of history
set undolevels=1000			" 1000 undos
set ttyfast				" fast terminal
set noerrorbells			" no ringa-dinga-ding-ding-dong
set novisualbell			"
set t_vb=			    	"
set tm=500				"
set shell=zsh				" probably safe to assume this ( <3 zsh )
set fileformats=unix,mac,dos		" use mac, dos and unix file formats
set ffs=unix,mac,dos			"
set nolazyredraw			" Don't redraw when executing macros
set magic				" set magic on, for regular expressions
set mat=2				" how many tenths of a second to blink
try					" try and apply my mother tongue
	lang en_US
catch
endtry

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""
" UI Settings
""
set cmdheight=2
set laststatus=2			" status bar
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%h\ \ \ Line:\ %l/%L:%c
set more				" use more prompt
set scrolloff=5				" keep >= 5 lines above/below
set sidescrolloff=5			" keep >= 5 lines left/right

" Backspacing 
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Searching
set nohlsearch				" don't highlight search results
set incsearch				" incremental search
set ignorecase				" ignore case when searching
set smartcase				" Éor use use artificial intelligence whilst searching

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

""
" Code Formatting
""
set nowrap
set autoindent
" set list 				" show whitespace
"set listchars=tab:\ \ ,trail:Â·		" show tabs

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set lbr
set tw=500

set ai					" auto indent
set si					" smart indent
set wrap				" wrap lines

" Syntax highlighting
syntax enable				" enable highlighitng
filetype off				" turn off filetype highlighting
filetype plugin on			" turn on filetype plugins
filetype indent on
set showmatch 				" Show matching brackets

" Key bindings and such
inoremap jj <Esc>

""
" Visual Settings
""
" Default color scheme
set colorcolumn=79
set number 
set background=dark
""colorscheme solarized
set cursorline

" could be doneÉ
" if MySys() == "mac"
" 	set gfn=Menlo:h14
"	set shell=/bin/zsh
" elsif MySys() == "windows"
"	set gfn=Bitstream\ Vera\ Sans\ Monon:h10
" elsif MySys() == "linux"
"	set gfn=Monospace\ 10
"	set shell=/bin/zsh
"
if has("gui_running")
    set guifont=Inconsolata:h13 
    set guioptions-=T
	set t_Co=256
	set background=dark
	colorscheme solarized
	if has("gui_macvim")
  	    " Fullscreen takes up entire screen
  		set fuoptions=maxhorz,maxvert
    endif
else
	""colorscheme solarized
	set background=light
endif

"" Options for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"" Plugins Defined Here
"
" examples:
" # original repos on Github
" Bundle 'tpope/vim-fugitive'
"
" # vim-scripts
" Bundle 'FuzzyFinder'
"
" # non github
" Bundle git://git.wincent.com/command-t.git
Bundle 'spf13/PIV'
Bundle 'L9'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'command-t'
Bundle 'SearchComplete'
Bundle 'SuperTab'
Bundle 'tpope/vim-fugitive'
Bundle 'FuzzyFinder'
Bundle 'plasticboy/vim-markdown'
Bundle 'Gist.vim'
Bundle 'taglist.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'javascript.vim'
Bundle 'htmljinja.vim'
Bundle 'jsbeautify'
Bundle 'JavaScript-syntax'
Bundle 'node.js'
Bundle 'vim-coffee-script'

filetype plugin indent on

""" Syntax highlighting
syntax on
au BufNewFile,BufRead *.html set filetype=jinja
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.coffee set filetype=coffee-script
au BufNewFile,BufRead *.md set filetype=markdown

""" Keybindings
" Tab Switching
" Ctrl-Left and Ctrl-Right switch between previous and next tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Alt-Left and Alt-Right move current tab left or right
nnoremap <silent> <A-left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-right> :execute 'silent! tabmove ' . (tabpagenr()<CR>
" With the following you can press F8 to show all buffers in tabs
let notabs = 1

