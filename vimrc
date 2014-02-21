"" vim:set ft=vim et tw=78 sw=4:


"" Options for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" General Plugins
" Show VCS diffs
Bundle "mhinz/vim-signify"
Bundle "edkolev/tmuxline.vim"
Bundle 'editorconfig/editorconfig-vim'
Bundle 'shemerey/vim-project'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ack.vim'
Bundle 'TaskList.vim'
" Undo on save - lifesaver!
Bundle 'sjl/gundo.vim'
" Buffer switching
Bundle 'tpope/vim-unimpaired'
" Use <tab> to tab-complete on context
Bundle 'ervandew/supertab'
" Essential vim utility scripts
Bundle 'L9'
" Ultimate Completion
Bundle 'Shougo/neocomplcache'
" Git integration
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
" Taglist
Bundle 'taglist.vim'
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
" let g:syntastic_python_checkers=['python', 'pyflakes', 'pep8']
" let g:syntastic_javascript_checkers=['jshint']
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
" Multiple cursors (like sublime)
Bundle 'terryma/vim-multiple-cursors'

"""
" Language Specific
"""

"" Python
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'

"" Clojure
"Bundle 'VimClojure'
Bundle 'paredit.vim'
Bundle "tpope/vim-fireplace"
Bundle "tpope/vim-classpath"
Bundle "guns/vim-clojure-static"
Bundle 'Rainbow-Parenthesis'

"" Go
Bundle 'uggedal/go-vim'

"" Javascript
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
au FileType javascript set tabstop=4 shiftwidth=4 softtabstop=4

"" Node.JS
Bundle 'node.js'

"" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'
au FileType coffee set tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.coffee set sw=2 sts=2 et
au BufNewFile,BufRead *.coffee set filetype=coffee

"" HTML5
Bundle 'othree/html5.vim'
au BufNewFile,BufRead *.html set filetype=html

"" Markdown
Bundle 'tpope/vim-markdown'
au BufNewFile,BufRead *.md set filetype=markdown

"" CSS3
Bundle 'hail2u/vim-css3-syntax'

"" LessCSS
Bundle 'less.vim'
au BufNewFile,BufRead *.less set filetype=less

filetype plugin indent on
""
" General Settings
""
let mapleader=","           " comma as the map-leader

set nocompatible			" don't inherit vi traits
set dictionary+=/usr/share/dict/words
if exists("+spelllang")
    set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add
set shell=/bin/zsh			" probably safe to assume this ( <3 zsh )
set pastetoggle=<F2>        " toggle paste
"set paste                   " paste mode
set ttyfast				    " fast terminal
set number				    " show line numbers
set ruler				    " show ruler at bottom of screen
set autoread				" watch for file changes
set lazyredraw			    " Redraw when executing macros
set mat=2				    " how many tenths of a second to blink
set t_vb=			    	"
set tm=500				    "
try					        " try and apply my mother tongue
	lang en_US
catch
endtry
set modeline               " read modeline from files
set backupcopy=yes
set clipboard=unnamed
set showcmd                 " Show (partial) command in status line
if exists('+undofile')
  set undofile
endif

" Regex
set magic				    " set magic on, for regular expressions

" History
set history=700				" 200 lines of history
set undolevels=1000			" 1000 undos

" Bells
set noerrorbells			" no ringa-dinga-ding-ding-dong
set novisualbell			"

" File Formats and Encodings
set encoding=utf-8			" set encoding
set ffs=unix,mac,dos        " use mac, dos and unix file formats
set fileformats=unix,mac,dos

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""
" UI Settings
""
set cmdheight=2
set laststatus=2			" status bar
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%h\ \ \ Line:\ %l/%L:%c
set more				    " use more prompt
set scrolloff=1				" keep >= 1 lines above/below
set sidescrolloff=1			" keep >= 1 lines left/right
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster

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
set wildignore+=*.o,*.obj,.git,*.rbc,log/**,node_modules/**,target/**,tmp/**

" Mouse
set mouse=a
if exists('$TMUX')
    set ttymouse=xterm2
endif

""
" Code Formatting
""
set nowrap
set autoindent
"set list 				    " show whitespace
"set listchars=tab:\ \ ,trail:Â· " show tabs

" Highlight whitespace
match ErrorMsg '\s\+$'
autocmd BufWritePre * :%s/\s\+$//e
" Show a subtle color when line is > 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#DC322F
match OverLength /\%81v.\+/

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Windows
set splitbelow              " Split windows below

set lbr
set tw=500

set ai					" auto indent
set si					" smart indent
set wrap				" wrap lines


""
" Visual Settings
""
" Default color scheme
set colorcolumn=79
set number
set background=light
set cursorline
colorscheme tomorrow

""" Plugin Options
"" vimwiki
let g:vimwiki_list = [{ 'path': expand("~/Dropbox/vimwiki"), 'path_html': expand("~/Dropbox/vimwiki_html") }]

"" Powerline
let g:Powerline_symbols = 'fancy'

"" MiniBuf
let g:MiniBufExplMapWindowNavVim = 1
let g:MiniBufExplMapWindowNavArrows = 1
let g:MiniBufExplMapCTabSwitchBufs = 1
let g:MiniBufExplModSelTarget = 1

"" cTags
let Tlist_Ctags_Cmd='/usr/bin/ctags'

"""
" Syntax highlighting
"""
syntax enable				" enable highlighitng
filetype off				" turn off filetype highlighting
filetype plugin on			" turn on filetype plugins
filetype indent on
set showmatch 				" Show matching brackets

"""
" Git
"""
autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
autocmd FileType gitcommit setlocal spell
autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>

"""
" Tex/tMarkdown
"""
autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
autocmd FileType markdown setlocal spell

""
" Key bindings, remappings, and such
""
inoremap jj <Esc>
imap ii <C-[>

" With the following you can press F8 to show all buffers in tabs
let notabs = 1

nore ; :
nore , ;

inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>
autocmd FileType sh,zsh,csh,tcsh    inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
autocmd FileType perl,python,ruby   inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>

" Fuck help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


if has("gui_macvim")
    " Shows great info in a statusbar at the bottom
    Bundle 'bling/vim-airline'
    " let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'tomorrow'
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    map <D-p> :<C-U>CtrlP<CR>
endif

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <Leader>tl :TaskList<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>g :GundoToggle<CR>
"nmap <leader>g :GitGutterToggle<CR>
nmap <leader>] :TagbarToggle<CR>
noremap <leader>q <Plug>TaskList<CR>
