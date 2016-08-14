" Vim Compiler File
" Compiler: grunt

if exists("current_compiler")
    finish
endif
let current_compiler = "grunt"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=grunt
