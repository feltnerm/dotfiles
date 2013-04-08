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
let mapleader=","
set nocompatible			" don't inherit vi traits
set number				    " show line numbers
set ruler				    " show ruler at bottom of screen
set encoding=utf-8			" set encoding
set autoread				" watch for file changes
set history=700				" 200 lines of history
set undolevels=1000			" 1000 undos
set ttyfast				    " fast terminal
set noerrorbells			" no ringa-dinga-ding-ding-dong
set novisualbell			"
set t_vb=			    	"
set tm=500				    "
set shell=/bin/zsh				" probably safe to assume this ( <3 zsh )
set fileformats=unix,mac,dos		" use mac, dos and unix file formats
set ffs=unix,mac,dos			"
set nolazyredraw			" Don't redraw when executing macros
set magic				    " set magic on, for regular expressions
set mat=2				    " how many tenths of a second to blink
try					        " try and apply my mother tongue
	lang en_US
catch
endtry
set shell=zsh\ --login

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

" Key bindings and such
inoremap jj <Esc>


"" Options for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"" Plugins Defined Here
"
" examples:
" # original repos on Github
" Bundle 'tpope/vim-fugitive' "
" # vim-scripts
" Bundle 'FuzzyFinder'
"
" # non github
" Bundle git://git.wincent.com/command-t.git


"" General Plugins
" Essential vim utility scripts
Bundle 'L9'
" Git integration
Bundle 'tpope/vim-fugitive'
" Shows great info in a statusbar at the bottom
Bundle 'Lokaltog/vim-powerline'
" Ctrl-P commands like sublime text
Bundle 'kien/ctrlp.vim'
" Quickly surround things
Bundle 'tpope/vim-surround'
" fuzzy searching
Bundle 'FuzzyFinder'
" beautiful color scheme
Bundle 'altercation/vim-colors-solarized'
" NERDTree
Bundle 'scrooloose/nerdtree'
" NERDCommentor
Bundle 'scrooloose/nerdcommenter'
" tab completion when searching
Bundle 'SearchComplete'
" Syntax checking
Bundle 'scrooloose/syntastic'
" tabbed buffers 
Bundle 'minibufexpl.vim'
" VimWiki
Bundle 'vimwiki'
" DelimitMate
Bundle 'Raimondi/delimitMate'
" Tagbar
Bundle 'majutsushi/tagbar'
" git gutter
Bundle 'airblade/vim-gitgutter'

""" Language Specific
"" Clojure
"Bundle 'VimClojure'
Bundle 'paredit.vim'
Bundle "tpope/vim-fireplace"
Bundle "tpop/vim-classpath"
Bundle "guns/vim-clojure-static"
"" Node.JS 
Bundle 'node.js'
"" LessCSS 
Bundle 'less.vim'
"" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'
"" CSS3
Bundle 'hail2u/vim-css3-syntax'
"" GO
Bundle 'uggedal/go-vim'
"" Javascript
Bundle 'pangloss/vim-javascript'
au FileType javascript set tabstop=2 shiftwidth=2 softtabstop=2
"" Markdown 
Bundle 'tpope/vim-markdown'
"" Mustache 
Bundle 'juvenn/mustache.vim'
"" Python 
Bundle 'python.vim'
"" HTML5
Bundle 'othree/html5.vim'

filetype plugin indent on

""
" Visual Settings
""
" Default color scheme
set colorcolumn=79
set number 
set background=dark
set cursorline
colorscheme solarized

""" Plugin Options
"" Powerline
let g:Powerline_symbols = 'fancy'

"" NerdTree
nnoremap <C-n> :NERDTreeToggle<cr>

"" Tagbar
nmap <F8> :TagbarToggle<cr>

"" MiniBuf
let g:MiniBufExplMapWindowNavVim = 1
let g:MiniBufExplMapWindowNavArrows = 1
let g:MiniBufExplMapCTabSwitchBufs = 1
let g:MiniBufExplModSelTarget = 1


"" MiniBufExpl
let g:MiniBufExplMapWindowNavVim = 1
let g:MiniBufExplMapWindowNavArrows = 1
let g:MiniBufExplCTabSwitchBufs = 1
let g:MiniBufExplModSelTarget = 1

"" cTags
let Tlist_Ctags_Cmd='/usr/bin/ctags'

""" Syntax highlighting
syntax enable				" enable highlighitng
filetype off				" turn off filetype highlighting
filetype plugin on			" turn on filetype plugins
filetype indent on
set showmatch 				" Show matching brackets

au BufNewFile,BufRead *.html set filetype=html
au BufNewFile,BufRead *.jade set filetype=jade
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.md set filetype=markdown

" Show a subtle color when line is > 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""" Keybindings
" With the following you can press F8 to show all buffers in tabs
let notabs = 1

" Fuck help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""" Automatically determine indenting using fuzzy matching. e.g. the a line starting "(with-"
""" will be indented two spaces.
"let vimclojure#FuzzyIndent=1
"
""" Highlight built-in functions from clojure.core and friends
"let vimclojure#HighlightBuiltins=1
"
""" Highlight functions from contrib
"let vimclojure#HighlightContrib=1
"
""" As new symbols are identified using VimClojure's dynamic features, automatically
""" highlight them.
"let vimclojure#DynamicHighlighting=1
"
""" Color parens so they're easier to match visually
"let vimclojure#ParenRainbow=1
"
""" Yes, I want nailgun support
"let vimclojure#WantNailgun = 1
""
""" Full path to the nailgun client
"let vimclojure#NailgunClient = "/usr/bin/ng"
