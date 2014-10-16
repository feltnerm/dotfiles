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
    map <D-t> :CommandT<CR>
    map <D-p> :<C-U>CtrlP<CR>
    " Disable print shortcut for 'goto anything...'
      macmenu File.Print key=<nop>

    " Disable new tab shortcut for 'goto file...'
    macmenu File.New\ Tab key=<nop>

    " Move  with cmd+alt
    macm Window.Select\ Previous\ Tab  key=<D-M-LEFT>
    macm Window.Select\ Next\ Tab	   key=<D-M-RIGHT>

    " Open new window via cmd+shift+n
    macmenu File.New\ Window key=<D-N>

    " Larger Font
    set antialias
    set guifont=Inconsolata-g\ for\ Powerline:h12

    set background=dark
    colorscheme Tomorrow-Night-Eighties

endif
