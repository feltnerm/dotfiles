"=============================================================================
" What Is This: Add some conceal operator for your java files

if exists('g:no_java_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

"syntax clear javaOperator

syntax match javaNiceOperator "->" conceal cchar=λ
syntax match javaNiceOperator "==" conceal cchar=≟
syntax match javaNiceOperator "===" conceal cchar=≡
syntax match javaNiceOperator "!=" conceal cchar=≠
syntax match javaNiceOperator ">>" conceal cchar=»
syntax match javaNiceOperator "&&" conceal cchar=∧
syntax match javaNiceOperator "||" conceal cchar=∨

let s:extraConceal = 1
" Some windows font don't support some of the characters,
" so if they are the main font, we don't load them :)
if has("win32")
    let s:incompleteFont = [ 'Consolas'
                        \ , 'Lucida Console'
                        \ , 'Courier New'
                        \ ]
    let s:mainfont = substitute( &guifont, '^\([^:,]\+\).*', '\1', '')
    for s:fontName in s:incompleteFont
        if s:mainfont ==? s:fontName
            let s:extraConceal = 0
            break
        endif
    endfor
endif

if s:extraConceal
    " Match greater than and lower than w/o messing with Kleisli composition
    syntax match javaNiceOperator "<=\ze[^<]" conceal cchar=≤
    syntax match javaNiceOperator ">=\ze[^>]" conceal cchar=≥

    syntax match javaNiceOperator "++" conceal cchar=⧺

endif


hi link javaNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
