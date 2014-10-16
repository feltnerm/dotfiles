" GUI Options
""
if has("gui_macvim")
    set lines=100
    set columns=160

    " Shows great info in a statusbar at the bottom
    " Bundle 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'tomorrow'

    " OSX Specific Keybindings
    "macmenu &File.New\ Tab key=<nop>
    " Disable print shortcut for 'goto anything...'
    macmenu File.Print key=<nop>
    macmenu &File.New\ Tab key=<nop>

    " Move  with cmd+alt
    macm Window.Select\ Previous\ Tab  key=<M-S-T>
    macm Window.Select\ Next\ Tab	   key=<M-T>

    "macmenu File.New\ Tab key=<D-t>
	macm File.New\ Tab key=<nop>
	nmap <D-t> :tabnew<CR>:NERDTreeToggle<CR>
    "map <D-t> :CtrlP<CR>

    " Larger Font
    set antialias
    set guifont=Inconsolata-g\ for\ Powerline:h12

    set background=dark
    colorscheme Tomorrow-Night-Eighties

endif
