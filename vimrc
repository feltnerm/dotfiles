"" vim:set ft=vim et tw=78 sw=4:

""
" General Settings
""
set nocompatible            " don't inherit vi traits

silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction

let mapleader=","           " comma as the map-leader

" Autoload vimrc on changes
autocmd! bufwritepost .vimrc source %

set shell=/bin/zsh          " probably safe to assume this ( <3 zsh )
set modeline                " read modeline from files
set autoread                " watch for file changes

"
" Regex/Searching
set magic                   " set magic on, for regular expressions
set nohlsearch              " don't highlight search results
set incsearch               " incremental search
set ignorecase              " ignore case when searching
set smartcase               " Éor use use artificial intelligence whilst searching
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line

" Backup
""
set backupcopy=yes
set backupdir=~/.vim/backup
silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
set directory=~/.vim/tmp
silent !mkdir -p ~/.vim/tmp> /dev/null 2>&1
set undodir=~/.vim/undo
silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
if exists('+undofile')
  set undofile
endif
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000

"
" History
set history=700             " 200 lines of history
set undolevels=1000         " 1000 undos

" Bells/Sound
set noerrorbells            " no ringa-dinga-ding-ding-dong
set novisualbell            "

" File Formats and Encodings
set encoding=utf-8          " set encoding
set ffs=unix,mac,dos        " use mac, dos and unix file formats
set fileformats=unix,mac,dos
scriptencoding utf-8
set encoding=utf-8 nobomb " BOM often causes trouble

" Diff
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)

" Performance
""
set ttyfast                 " fast terminal
set lazyredraw              " Redraw when executing macros
set mat=2                   " how many tenths of a second to blink
set t_vb=                   " No visual/audio bell
set tm=500                  " timeout length for keypresses
"set tw=500

" Spellcheck
""
set dictionary+=/usr/share/dict/words
if exists("+spelllang")
    set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add
try                         " try and apply my mother tongue
    lang en_US
catch
endtry

""
" UI Settings
""
set number                  " show line numbers
set ruler                   " show ruler at bottom of screen
set showcmd                 " Show (partial) command in status line
set cmdheight=2
set laststatus=2            " status bar
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%h\ \ \ Line:\ %l/%L:%c
set more                    " use more prompt
set scrolloff=1             " keep >= 1 lines above/below
set sidescrolloff=1         " keep >= 1 lines left/right
set timeoutlen=1200         " A little bit more time for macros
set ttimeoutlen=50          " Make Esc work faster
set showmatch               " Show matching brackets
set splitbelow              " Split windows below
set title " Show the filename in the window titlebar.
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level

" Paste
""
"set paste                   " paste mode
set pastetoggle=<F2>        " toggle paste with F2
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
    endif
endif

" Backspacing
set backspace=eol,start,indent  " Allow backspace over autoindenting, line breaks, and start of insert.
set whichwrap+=<,>,h,l          " These keys should move to the next line

" Tab completion
set wildmenu                            " Enhanced command-line completion
set wildmode=list:longest,list:full     " Good wildmode default mactching
set wildignore+=*.o,*.obj,.git,*.rbc,node_modules/**

" Mouse
set mouse=a                 " Use mouse in all modes
set mousehide               " Hide the mouse cursor while typing
if exists('$TMUX')
    set ttymouse=xterm2
endif

""
" Code Formatting
""
set wrap
set wrapmargin=80       " Number of characters from the right window border where wrapping starts
set linebreak
"set list                   " show whitespace
"set listchars=tab:\ \ ,trail:Â· " show tabs

" Tabs
set autoindent          " Copy indent from current line when starting a new line
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" set smarttab

""
" Visual Settings
""
" Default color scheme
set colorcolumn=79
set number
set background=dark
set cursorline
colorscheme Tomorrow-Night-Eighties " colorscheme solarized

" Highlight code over 80 chars
match ErrorMsg '\s\+$'
autocmd BufWritePre * :%s/\s\+$//e
" Show a subtle color when line is > 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#DC322F
match OverLength /\%81v.\+/

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
" To disable this, add the following to your .vimrc.before.local file:
"   let g:spf13_no_restore_cursor = 1
if !exists('g:spf13_no_restore_cursor')
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END
endif

" --------------------------------------------------

" VUNDLE
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"" Plugins
Bundle 'L9'
Bundle 'sjl/gundo.vim'
Bundle 'airblade/vim-rooter'

"" OS Integration
Bundle "tpope/vim-eunuch"

"" Git
" Show a diff sign in the column
Bundle "mhinz/vim-signify"
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

"" Code Formatting
Bundle 'editorconfig/editorconfig-vim'
Bundle 'scrooloose/syntastic'

"" UI
Bundle "Solarized"
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'

"" Project Management
Bundle 'minibufexpl.vim'
Bundle 'TaskList.vim'
Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'shemerey/vim-project'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

"" Search
Bundle 'kien/ctrlp.vim'
" tab completion of words when searching with '/'
Bundle 'SearchComplete'
" @TODO: get this working!
Bundle 'FuzzyFinder'

"" Moving Around
" auto close parens, quotes, brackets, etc.
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
" Motions on speed (hint: try <leader><leader> then a key)
Bundle 'Lokaltog/vim-easymotion'
" Buffer switching
Bundle 'tpope/vim-unimpaired'
Bundle 'terryma/vim-multiple-cursors'

"" VimWiki
Bundle 'vimwiki'

"" Autocomplete
Bundle 'Valloric/YouCompleteMe'

"" Python
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'

"" Clojure
"Bundle 'VimClojure'
Bundle 'paredit.vim'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-dispatch'
Bundle "tpope/vim-classpath"
Bundle "guns/vim-clojure-static"
Bundle 'Rainbow-Parenthesis'
Bundle 'guns/vim-clojure-static'
Bundle 'vim-clojure-highlight'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'

"" Go
Bundle 'fatih/vim-go'
Bundle 'Blackrush/vim-gocode'

"" Javascript
Bundle 'pangloss/vim-javascript'
" au FileType javascript set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"" Node.JS
Bundle 'node.js'

"" Groovy
Bundle "groovy.vim"
Bundle "tfnico/vim-gradle"


"" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'

"" HTML5
Bundle 'othree/html5.vim'

"" Markdown
Bundle 'tpope/vim-markdown'

"" CSS3
Bundle 'hail2u/vim-css3-syntax'

"" LessCSS
Bundle 'less.vim'

"" Scala
Bundle 'derekwyatt/vim-scala'
Bundle 'ktvoelker/sbt-vim'
Bundle 'mpollmeier/vim-scalaConceal'

"" Groovy
Bundle 'vim.groovy'
Bundle 'tfnico/vim-gradle'


" To evaluate:
" Use <tab> to tab-complete on context
" Bundle 'ervandew/supertab'

filetype plugin indent on

" Plugin Options
"""

"" Airline
let g:airline_theme='tomorrow'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline#extensions#tabline#enabled=1

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

"
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
"" let Tlist_Ctags_Cmd='/usr/bin/ctags'

" Filetype Options / Syntax Highlighting
""
syntax enable               " enable highlighitng
"filetype off                " turn off filetype highlighting
"filetype plugin on          " turn on filetype plugins
"filetype indent on

au BufNewFile,BufRead *.less set filetype=less
"au BufNewFile,BufRead *.html set filetype=html
"au FileType coffee set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"autocmd BufRead,BufNewFile *.coffee set sw=4 sts=4 et
"au BufNewFile,BufRead *.coffee set filetype=coffee

"" Git
autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
autocmd FileType gitcommit setlocal spell
autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"" Tex/tMarkdown
au BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
autocmd FileType markdown setlocal spell

"" Shell Scripts
autocmd FileType sh,zsh,csh,tcsh    inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
autocmd FileType perl,python,ruby   inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>

inoremap <C-X>^ <C-R>=substitute(&commentstring,' \=%s\>'," -*- ".&ft." -*- vim:set ft=".&ft." ".(&et?"et":"noet")." sw=".&sw." sts=".&sts.':','')<CR>

" Key bindings, remappings, and such
""
nore ; :
nore , ;
inoremap jj <Esc>
imap ii <C-[>
let notabs = 1          " Press F8 to show all buffers in tabs
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" Fuck help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Move between splits using hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" space open/closes folds
nnoremap <space> za

vnoremap < <gv
vnoremap > >gv

" When you forget to sudo:
cmap w!! w !sudo tee % >/dev/null

" CtrlP
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" NERDTree - filesystem
nmap <leader>d :NERDTreeToggle<CR>

" TaskList
nmap <Leader>tl :TaskList<CR>
noremap <leader>q <Plug>TaskList<CR>

" Gundo
nmap <leader>g :GundoToggle<CR>

" Git Gutter
nmap <leader>g :GitGutterToggle<CR>

" TagBar
nmap <leader>] :TagbarToggle<CR>

" YouCompleteMe
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_collect_identifiers_from_tags_files = 1

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType py set textwidth=79 " PEP-8 Friendly

" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif

" For snippet_complete marker.
if !exists("g:spf13_no_conceal")
  if has('conceal')
      set conceallevel=2 concealcursor=i
  endif
endif

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview

" imap <Tab> <C-P>
" imap <Tab> <C-x><C-o>

" OTher Options
""
let g:virtualenv_auto_activate = '~/.virtualenvs'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '~/.go-packages/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
